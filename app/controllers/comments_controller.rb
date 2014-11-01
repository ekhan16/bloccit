class CommentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @comment = coment.new
      authorize @comment
  end

  def create
    @comment = current_user.comments.build(post_params)
    authorize @comment
    if @comment.save
      flash[:notice] = "Post was saved."
      redirect_to @comment
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:comment).permit(:body, :image)
  end