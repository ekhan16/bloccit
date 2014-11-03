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

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to[@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end

  private

  def post_params
    params.require(:comment).permit(:body, :image)
  end