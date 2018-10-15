class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to new_product_path unless current_user.products.any?
  end

end