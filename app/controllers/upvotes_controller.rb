class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    if existing_upvote
      existing_upvote.destroy
    else
      @upvote = current_user.upvotes.create(scope_to_product(feature_id: params[:feature_id]))
    end
    redirect_to params[:return_url]
  end

  private

  def existing_upvote
    @_existing_upvote ||= current_user.upvotes.find_by_feature_id(params[:feature_id])
  end
end