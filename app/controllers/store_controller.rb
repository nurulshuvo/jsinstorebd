class StoreController < ApplicationController
  layout "store_layout"
  def index
      # raise params.inspect
      @products ||= Product.order('created_at desc')

      @products = @products.where("title like ?", "%#{params[:search]}%") unless params[:search].blank?

      unless params[:cat_search].blank?
        category = Category.where("name like ?", "%#{params[:cat_search]}%")

        category.each do |p|
          @products = p.products
          @products = @products.where("title like ?", "%#{params[:search]}%") unless params[:search].blank?
        end
      end

      unless params[:category].blank?
        category = Category.where("id like ?", "%#{params[:category]}%")

        category.each do |p|
          @products = p.products
          @products = @products.where("title like ?", "%#{params[:search]}%") unless params[:search].blank?
        end
      end

      @products = @products.where("address like ?", "%#{params[:location]}%") unless params[:location].blank?

      @products = @products.where("price BETWEEN ? AND ?", params[:price].split("-").first, params[:price].split("-").last) unless params[:price].blank?

      @electronic_products = find_product("Electronics")
      
      @json = @products.to_gmaps4rails

  end

  private

  # for finding product through category
    def find_product(name)
      category = Category.find_by_name(name).children
      prod = category.map do |p|
        p.products
      end
      prod.flatten
    end

end
