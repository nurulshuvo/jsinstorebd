class OrdersController < ApplicationController

  def index
    # @orders = Order.all
    @orders = Order.where(buyer: current_user.id)

    respond_to do |format|
      format.html
      format.json { render json: @orders }
    end
  end


  def show
    @order = Order.find(params[:id])
    @products = @order.line_items.map do |p|
      p.product_id
    end

    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end


  def new
    @cart = current_cart
    product = @cart.line_items.first.product_id
    @user = Product.find(product).user.id
    if @cart.line_items.empty?
      redirect_to store_url, notice: 'Your cart is empty'
      return
    end

    @order = Order.new

    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end


  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to orders_url, notice: 'Thank you for your order.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_orders
    @orders = Order.where(seller: current_user.id)
  end

  def approval
    # raise params.inspect
    @order = Order.find(params[:order])
    @order.update_attributes(approved: true)
    redirect_to my_orders_path
  end


  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
