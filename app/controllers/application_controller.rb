class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_cart_items

  stale_when_importmap_changes

  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin?
    current_user&.is_admin == true
  end

    def require_login
    unless current_user
      redirect_to login_path, alert: "Please login first"
    end
  end


  before_action :set_cart_items

  def set_cart_items
    if current_user
      @cart_items = Cart.where(user_id: current_user.id)
    else
      @cart_items = Cart.none
    end
    end

end
