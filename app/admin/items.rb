ActiveAdmin.register Item do
	scope :uncategorized
  index do
    column "preview", :photo do |item|
      image_tag item.photo.url(:image_admin_preview)
    end
  	column "Name", :title
  	column :category
  	column "Release Date", :created_at
  	column :price, :sortable => :price do |item|
  		number_to_currency item.price
  	end 
	default_actions
  end
  
   form do |f|
     f.inputs "Details" do
       f.input :category
       f.input :title
       f.input :description
       f.input :price
       f.input :photo
     end
     f.buttons
   end
end
