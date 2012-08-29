class Item < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title, :category_name, :category_id, :photo
  scope :uncategorized, where(:category_id => nil) 
  # has_many :line_items


  # before_destroy :ensure_not_referenced_by_any_line_item
  # # ensure that there are no line items referencing this product
  # def ensure_not_referenced_by_any_line_item
  #   if line_items.count.zero?
  #     return true
  #   else
  #     errors[:base] << "Line Items present"
  #     return false
  #    end
  # end
  
  belongs_to :category
  has_attached_file :photo, :styles => { :small => "200x200>", :thumbnail => "120x120>", :image_preview_cart => "60x60>", :image_admin_preview => "50x50>" },
        :url => "/assets/items/:id/:style/:basename.:extension",
        :path => ":rails_root/public/assets/items/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  #validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

#  paginates_per 2
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      #why this scoped variable is passed
      scoped
    end
  end

  def category_name
  	 category.try(:name)
  end

  def category_name=(name)
  	 self.category = Category.find_by_name(name) if name.present?
  end  


end
