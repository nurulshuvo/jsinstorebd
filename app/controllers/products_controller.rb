class ProductsController < ApplicationController


  before_filter :authenticate_user!

  def index
    @products = Product.where(user_id: current_user.id)
  end


  def show
    @product = Product.find(params[:id])
    @json = @product.to_gmaps4rails
  end


  def new
    @user = User.find(current_user.id)
    @product = @user.products.build

  end


  def edit
    @product = Product.find(params[:id])
  end


  def create

    @user = User.find(params[:user_id])
    @product = @user.products.create(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.mobile { redirect_to @product}
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.mobile { redirect_to @product }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.mobile { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @user = current_user.id
    if @user == @product.user.id
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    else
      redirect_to products_url, notice: 'You are not authorized to delete this product!'
    end
  end



end
