class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(scope_to_product(content: params[:comment][:content], feature_id: params[:feature_id]))
    if @comment.save
      flash[:success] = "Your comment has been added!"
    else
      flash[:error] = "Your comment could not be added."
    end
    redirect_to feature_path(@comment.feature)
  end

end