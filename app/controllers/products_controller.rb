class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      flash[:error] = "Your app could not be added. Please try again or contact support@featureloop.com for assistance."
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :subdomain)
  end

end