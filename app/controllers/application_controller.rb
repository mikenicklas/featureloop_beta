class ApplicationController < ActionController::Base
  helper_method :current_product, :current_product_name

  def current_product
    return unless tenant = Apartment::Tenant.current
    @_current_product ||= Product.find_by_subdomain(tenant)
  end

  def current_product_name
    current_product ? current_product.name : "FeatureLoop"
  end

end
