class StoreController < ApplicationController
  layout "store_layout"
  def index
      @products ||= Product.order('created_at desc')
# raise params.inspect
      if params[:search] || params[:cat_search] || params[:price] || params[:location]
            @products = @products.where("title like ?", "%#{params[:search]}%") unless params[:search].blank?

            unless params[:cat_search].blank?
              category = Category.find_by_name(params[:cat_search]) unless params[:cat_search].blank?
              if category.ancestry == nil
                categories = category.children
                @products = categories.map {|p| p.products}
                @products = categories.map {|p| p.products.where("title like ?", "%#{params[:search]}%")} unless params[:search].blank?
                @products.flatten!
              else
                @products = category.products
              end
            end

            unless params[:category].blank?
              category = Category.find_by_name(params[:category]) unless params[:category].blank?

              if category.ancestry == nil
                categories = category.children
                @products = categories.map {|p| p.products}
                @products = categories.map {|p| p.products.where("title like ?", "%#{params[:search]}%")} unless params[:search].blank?
                @products.flatten!
              else
                @products = category.products
              end
            end

            @products = @products.where("address like ?", "%#{params[:location]}%") unless params[:location].blank?

            @products = @products.where("price BETWEEN ? AND ?", params[:price].split("-").first, params[:price].split("-").last) unless params[:price].blank?
      end


      @electronic_products = find_product("Electronics")
      @home_and_kitchen = find_product("Home and Kitchen")
      @vehicle = find_product("Vehicles")
      @books_and_entertainment= find_product("Books and Entertainment")
      @json = @products.to_gmaps4rails

      # raise params.inspect

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
