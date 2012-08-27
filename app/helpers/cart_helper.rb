module CartHelper
  def paypal_url(cart, return_url)
    values={
      :business => 'seller_1345723051_biz@gmail.com',
      :cmd => '_cart',
      #:upload => 1,
      :return => return_url
    }
    #cart = session[:cart] ||={}
    #7.times { |t| logger.debug "***#{(@cart.inspect if t == 3)}****" }
    cart.each  do |id, quantity |
      item = Item.find(id)
      values.merge!({    
          "amount_#{id.to_i+1}" => item.price,
          "item_name_#{id.to_i+1}" => item.title,
          "item_number_#{id.to_i+1}" => item.id,
          "quantity_#{id.to_i+1}" => item.category
        })
     end
  
     "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
