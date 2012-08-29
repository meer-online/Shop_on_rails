module CartHelper
  def paypal_url(cart, return_url)
    values={
      :business => 'seller_1345723051_biz@gmail.com',
      :cmd => '_cart', #'_xclick',
      :upload => 1,
      :return => return_url
    }
    #cart = session[:cart] ||={}
    #7.times { |t| logger.debug "***#{(@cart.inspect if t == 3)}****" }
    items_count = 0
    cart.each  do |id, quantity |
      items_count += 1
      item = Item.find(id)
      values.merge!({    
          "item_number_#{items_count}" => item.id,
          "item_name_#{items_count}" => item.title,
          "amount_#{items_count}" => item.price,         
          "quantity_#{items_count}" => quantity
        })
     end
  
     "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
