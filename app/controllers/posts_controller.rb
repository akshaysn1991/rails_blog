class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]
   def index
     @posts = Post.all.order('created_at DESC')
   end
   def new
     @post = Post.new
   end

  def show
  end
  def edit
  end
  def create
     @post = Post.new(post_params)

        if @post.save
          redirect_to @post
        else
           render 'new'
        end

   end
  def update
    if @post.update(post_params)
       redirect_to @post
      else
        render 'edit'
      end
  end
  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end
   def post_params
     params.require(:post).permit(:title, :body)
   end
end