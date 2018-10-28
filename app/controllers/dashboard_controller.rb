class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to new_product_path unless current_user.owns_product?
    # TODO: is this long term viable?
    redirect_to root_url(subdomain: current_user.product.subdomain)
  end

end