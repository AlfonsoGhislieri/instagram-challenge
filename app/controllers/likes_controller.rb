class LikesController < ApplicationController

  def create
    p '--------'
    p '--------'
    p '--------'
    p '--------'
    p params
    @like = current_user.likes.create(like_params)
    @post = Post.find(params[:post_id])

    p @like

    respond_to do |format|
      format.js
    end

  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @post = Post.find(params[:post_id])
    @like.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def like_params
    params.permit(:likeable_id, :likeable_type)
  end
end
