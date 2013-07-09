class StoreController < ApplicationController
  def index
    @products = Product.all
    @json = Product.all.to_gmaps4rails
  end
end
