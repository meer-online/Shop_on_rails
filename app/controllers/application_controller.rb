class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end
 #  private
  
 #  def current_cart
	# Cart.find(session[:cart_id])
	# 	rescue ActiveRecord::RecordNotFound
	# cart = Cart.create
	# session[:cart_id] = cart.id
	# cart
 #  end

end
