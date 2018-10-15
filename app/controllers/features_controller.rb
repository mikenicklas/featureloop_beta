class FeaturesController < BaseController
  before_action :ensure_product_tenant

  layout "product_dashboard"

  def index
  end

  private

  def ensure_product_tenant
    redirect_to root_path unless current_product
  end

end