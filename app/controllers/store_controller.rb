class StoreController < ApplicationController
  def index
    if params[:category]
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end

    @json = Product.all.to_gmaps4rails
  end
end
