class CartController < ApplicationController
  #has_many :line_items
  before_filter :require_login, :only => :index
  def index
      @cart = session[:cart] || {}
  end
  
  def add
    id = params[:id]    
    cart = session[:cart] ||= {}
    cart[id] = (cart[id] || 0) + 1
    redirect_to :action => :index
  end

  #  def create
  #   @cart = Cart.new(params[:cart])
  #   7.times { |i| logger.debug "***********#{ @cart.inspect if i == 4 }***********" }

  #   # respond_to do |format|
  #   #   if @item.save
  #   #     format.html { redirect_to @item, notice: 'Item was successfully created.' }
  #   #     format.json { render json: @item, status: :created, location: @item }
  #   #   else
  #   #     format.html { render action: "new" }
  #   #     format.json { render json: @item.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  #   #redirect_to :action => :index
  # end

  # def checkout
  #   values={
  #     :business => 'seller_1345723051_biz@gmail.com',
  #     :cmd => '_cart',
  #     :upload => 1,
  #   }
  #   @cart = session[:cart] ||={}
  #   7.times { |t| logger.debug "********#{(@cart.inspect if t == 3)}*********" }
  #   @cart.each  do |id, quantity |
  #     item = Item.find(id)
  #     values.merge!({    
  #         "amount_#{id.to_i+1}" => item.price,
  #         "item_name_#{id.to_i+1}" => item.title,
  #         "item_number_#{id.to_i+1}" => item.id,
  #         "quantity_#{id.to_i+1}" => item.category
  #       })
  #    end
  #    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  
  # end

  def total_price
    line_items.to_a.sum(&:full_price)
  end



end
