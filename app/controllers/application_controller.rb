class ApplicationController < ActionController::Base
  helper_method :current_product

  def current_product
    return unless tenant = Apartment::Tenant.current
    @_current_product ||= Product.find_by_subdomain tenant
  end

end
