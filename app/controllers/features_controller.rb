class FeaturesController < ApplicationController
  before_action :ensure_product_tenant
  before_action :authenticate_user!, except: [:index, :show]

  layout "product_dashboard"

  def index
    @features = current_product.features.includes(:upvotes)
  end

  def new
    @feature = current_user.features.new
  end

  def create
    @feature = current_user.features.new(feature_params)
    if @feature.save
      flash[:success] = "Your feature request has been submitted!"
      redirect_to feature_path(@feature)
    else
      flash[:error] = "Your feature request could not be created. Please try again or contact support@featureloop.com for assistance."
      render :new
    end
  end

  def show
    @feature = current_product.features.find(params[:id])
  end

  private

  def ensure_product_tenant
    redirect_to root_path unless current_product
  end

  def feature_params
    scope_to_product(params.require(:feature).permit(:title, :description))
  end

end