class BlogsController < ApplicationController
  before_action :set_blog, only:[:show,:edit,:update,:destroy ]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def create
    @blog = current_user.blog.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "作成しました"
      else
        render :new
      end
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
      respond_to blogs_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
    format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed" }
    format.json { head :no_content}
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end
end
