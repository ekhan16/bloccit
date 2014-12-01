class Topics::PostsController < ApplicationController
  
  def show 
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @topic
    @comment = @post.comments  
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def create
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @post = current_user.posts.build(post_params)
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
    authorize @post
    if @post.save_with_initial_vote
      # Rails.logger.info ">>> Calling from save with initial post"
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving post. Please try again."
      # redirect_to new_topic_post_path(@topic)
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
      if @post.update_attributes(post_params)
        flash[:notice] = "Post was updated."
        redirect_to [@topic, @post]
      else
        flash[:error] = "Error saving post. Please try again."
        render :edit
      end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title
    authorize @post
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "Error deleting. Please try again."
      render :show
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

end