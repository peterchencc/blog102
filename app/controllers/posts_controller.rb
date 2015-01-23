class PostsController < ApplicationController
  def index
        if params[:keyword]
      @posts = Post.where( [ "name like ?", "%#{params[:keyword]}%" ]).page(params[:page]).per(5)
    else
      @posts = Post.page(params[:page]).per(5)
    end
  end
end