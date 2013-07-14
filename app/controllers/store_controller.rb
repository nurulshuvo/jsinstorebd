class StoreController < ApplicationController
  def index
    if params[:category] || params[:search]
      if params[:category]
        @products = Product.where(category: params[:category])
        @json = Product.where(category: params[:category]).to_gmaps4rails
      else
        if params[:search].blank?
          @products = Product.all
          @json = Product.all.to_gmaps4rails
        else
          @products = Product.where("title like ?", params[:search])
          @json = Product.where("title like ?", params[:search]).to_gmaps4rails
        end
      end
    else
      @products = Product.all
      @json = Product.all.to_gmaps4rails
    end
  end
end
