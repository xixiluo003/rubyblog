class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # ======= GET / =======
  def index
    puts "\n******* post/index *******"
    puts "** session[:user_id], #{session[:user_id]}"
    @user = User.where(id: session[:user_id]).first
    @posts = Post.where(user_id: session[:user_id])
  end

  # ======= GET /show/:id =======
  def show
    puts "\n******* show *******"
    puts "\n** params.inspect: #{params.inspect}"
    @user = User.where(id: session[:user_id]).first
    # @comments = @user.comments
    @post = Post.find(@post)
    @comments = Comment.where(post_id: @post.id)
    puts "** @post.inspect: #{@post.inspect}"
    puts "** @comments.inspect: #{@comments.inspect}"

  end

  # ======= GET /post/new =======
  def new
    puts "\n******* new *******"
    puts "** params.inspect: #{params.inspect}"
    @user = User.where(id: session[:user_id]).first
    @post = @user.posts.build
    puts "@user.inspect, #{@user.inspect}"
    puts "@post.inspect, #{@post.inspect}"
end

  # ======= GET /posts/:id/edit =======
  def edit
    puts "\n******* edit *******"
  end

  # ======= POST /posts =======
  def create
    puts "\n******* create *******"
    puts "\n** post_params.inspect: #{post_params.inspect}"
    @user = User.where(id: session[:user_id]).first
    @post = @user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/posts_index", notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # ======= PATCH/PUT /posts/:id =======
  def update
    puts "\n******* update *******"
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # ======= DELETE /posts/:id =======
  def destroy
    puts "\n******* destroy *******"
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_path, notice: 'Post was successfully destroyed.' }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
