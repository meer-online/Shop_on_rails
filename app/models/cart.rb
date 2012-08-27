class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, :dependent => :destroy 
  has_many :items

  

  def paypal_url(return_url)
    values={
      :business => 'seller_1345723051_biz@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      #:invoice => id
    }
    line_items.each_with_index do |item, index|
      values.merge!({
          "amount_#{index+1}" => item.price,
          "item_name_#{index+1}" => item.title,
          "item_number_#{index+1}" => item.id,
          "quantity_#{index+1}" => item.quantity
        })
     end
     "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end
