class ApplicationController < ActionController::Base
  helper_method :current_product, :current_product_name

  def current_product
    @_current_product ||= Product.current(request.subdomain)
  end

  def current_product_name
    current_product ? current_product.name : "FeatureLoop"
  end

  def scope_to_product(attributes)
    attributes.merge(product_id: current_product.id)
  end

end
