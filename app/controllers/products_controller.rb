class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      Apartment::Tenant.switch!(@product.subdomain)
      redirect_to subdomain: @product.subdomain, controller: 'products', action: "show"
    else
      flash[:error] = "Your app could not be added. Please try again or contact support@featureloop.com for assistance."
      render :new
    end
  end

  def show
    @product = find_product_by_subdomain_or_id
    render :show, layout: "product_dashboard"
  end

  private

  def product_params
    params.require(:product).permit(:name, :subdomain)
  end

  def find_product_by_subdomain_or_id
    if tenant = Apartment::Tenant.current
      Product.find_by_subdomain(tenant)
    else
      Product.find(params[:id])
    end
  end

end