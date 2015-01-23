class Admin::PostsController < AdminController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @admin_posts = Admin::Post.page(params[:page]).per(5)
    respond_with(@admin_posts)
  end

  def show
    respond_with(@admin_post)
  end

  def new
    @admin_post = Admin::Post.new
    respond_with(@admin_post)
  end

  def edit
  end

  def create
    @admin_post = Admin::Post.new(admin_post_params)
    if @admin_post.save
      redirect_to :action => :index
    else
      render :action => :new
    end
    # @admin_post.save
    # respond_with(@admin_post)
  end

  def update
    @admin_post.update(admin_post_params)
    respond_with(@admin_post)
  end

  def destroy
    @admin_post.destroy
    respond_with(@admin_post)
  end

  private
    def set_admin_post
      @admin_post = Admin::Post.find(params[:id])
    end

    def admin_post_params
      params.require(:admin_post).permit(:name, :content)
    end
end
