class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :collection_for_parent_select

  before_filter :prepare_for_mobile

  private
    def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

# The current_cart starts by getting the :cart_id from the session object, and attempts
# to find a cart corresponding to this id. If such a Cart record is not found (which
# will happen if the id is nil or invalid for any reason), then this method will
# proceed to create a new Cart, store the id of the created cart into the session, and
# then return the new cart.

# I made the current_curt method private so that it is only available to other controllers, It
# will not availabe as an action to the user.

    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == '1'
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end

    helper_method :mobile_device?

    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
      request.format = :mobile if mobile_device?
    end

    # for grouping categories
    def collection_for_parent_select
      @categories_for_list = ancestry_options(Category.unscoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
    end

    def ancestry_options(items)
      result = []
      items.map do |item, sub_items|
        result << [yield(item), item.id]
      
        result += ancestry_options(sub_items) {|i| "#{'-' * i.depth} #{i.name}" }
      end
       result
    end


    include Mobylette::RespondToMobileRequests
end




