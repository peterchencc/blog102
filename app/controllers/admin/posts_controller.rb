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
    redirect_to :action => :index
    # respond_with(@admin_post)
  end

  def destroy
    @admin_post.destroy
    respond_with(@admin_post)
  end

  #multiReorder
  def multiple_reorder
    errorFlag = false
    params[:post][:reorderset].each_with_index do | postid , index |
      @admin_post = Post.find(postid)
      if !@admin_post.nil?
        @admin_post.update_attribute(:ranking , index+1 )
      else
        errorFlag = true
      end
    end

    respond_to do |format|
      if errorFlag
        format.json { head :no_content }
      else
        format.json { head :no_content }
      end
    end
  end


  private
  def set_admin_post
    @admin_post = Admin::Post.find(params[:id])
  end

  def admin_post_params
    params.require(:admin_post).permit(:name, :content, :avatar)
  end
end
