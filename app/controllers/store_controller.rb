class StoreController < ApplicationController
  layout "store_layout"
  def index
    if params[:category] || params[:search] || params[:cat_search]
      if params[:category]
        @products = Product.where(category_id: params[:category])
        @json = Product.where(category_id: params[:category]).to_gmaps4rails
        # raise params.inspect
      else
        if params[:search].blank? && params[:cat_search].blank?
          @products = Product.all
          @json = Product.all.to_gmaps4rails
        else
          if !params[:search].blank? && params[:cat_search].blank?
            @products = Product.where("title like ?", params[:search])
            @json = Product.where("title like ?", params[:search]).to_gmaps4rails
          end
          if params[:search].blank? && !params[:cat_search].blank?
            category = Category.where("name like ?", params[:cat_search])
            # @products = []
            category.each do |p|
             @products = p.products
            end
             @json = @products.to_gmaps4rails
             # raise params.inspect
          end
          if !params[:search].blank? && !params[:cat_search].blank?
            category = Category.where("name like ?", params[:cat_search])
            category.each do |p|
              @product = p.products
            end
            @product_s = Product.where("title like ?", params[:search])
            @products = @product & @product_s
            @json = @products.to_gmaps4rails
            # raise params.inspect
          end
        end
      end
    else

      @electronic_products = find_product("Electronics")
      @products = Product.all
      @json = Product.all.to_gmaps4rails
    end
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
