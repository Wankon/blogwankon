class BlogsController < ApplicationController


  def index
    @blogs = Blog.all
  end

  def new

  end

  def create
    @blog= Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, success: '投稿が完了しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit 
    @blog = Blog.find(params[:id])
   end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to blogs_path, success: '編集が完了しました'
    else
    flash.now[:danger] = "編集に失敗しました"
     render 'edit'
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end

end
