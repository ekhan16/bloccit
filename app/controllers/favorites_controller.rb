class FavoritesController < ApplicationController

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Success!"
      redirect_to [@post]
    else
      flash[:error] = "Error!"
      redirect_to [@post]
    end
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite

    if favorite.save
      flash[:notice] = "The post was added to your favorites."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error adding the post to your favorites."
      redirect_to [@post]
  end
end
