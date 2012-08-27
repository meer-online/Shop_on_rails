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
    cart.each  do |id, quantity |
      item = Item.find(id)
      values.merge!({    
          "item_number_#{id.to_i}" => item.id,
          "item_name_#{id.to_i}" => item.title,
          "amount_#{id.to_i}" => item.price,         
          "quantity_#{id.to_i+1}" => quantity
        })
     end
  
     "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
