class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_curt
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

# The current_cart starts by getting the :cart_id from the session object, and attempts
# to find a cart corresponding to this id. If such a Cart record is not found (which
# will happen if the id is nil or invalid for any reason), then this method will
# proceed to create a new Cart, store the id of the created cart into the session, and
# then return the new cart.

# I made the current_curt method private so that it is only available to other controllers, It
# will not availabe as an action to the user.

end
