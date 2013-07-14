class ProductsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @products = Product.where(user_id: current_user.id)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

  end

  # GET /products/new
  # GET /products/new.json
  def new
    @user = User.find(current_user.id)
    @product = @user.products.build

  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
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

  # PUT /products/1
  # PUT /products/1.json
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

  # DELETE /products/1
  # DELETE /products/1.json
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
