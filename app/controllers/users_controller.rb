class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # ======= GET /user =======
  def signin
    puts "\n******* signin *******"
    puts "\n** signin_params.inspect: #{signin_params.inspect} *******"
    @user = User.where(username: signin_params[:username]).first
    puts "\n******* USER OK *******"
    if @user && User.where(password: signin_params[:password])
       puts "\n******* PSWD OK *******"
       puts "** @user.inspect: #{@user.inspect}"
       puts "** @user[:id].inspect: #{@user[:id].inspect}"
       session[:user_id] = @user.id
       puts "** session[:user_id]: #{session[:user_id]}"
       redirect_to "/home", :flash => { :success => "Welcome!" }
     else
       redirect_to "/"
     end
   end

  def signout
    puts "\n******* signout *******"
    session[:user_id] = nil
    redirect_to "/login"
  end

  # ======= GET /login =======
  def login
    puts "\n******* login *******"
    @user = User.new
    @users = User.all
  end

  # ======= GET / =======
  def index
    puts "\n******* index *******"
    @users = User.all
  end

  def home
    puts "\n******* home *******"
    @postsArray = []
    @users = User.all
    @users.each do |user|
      posts = user.posts
      if posts.length > 0
        @postsArray << posts
      else
        @postsArray << "no_post"
      end
    end
  end

  # ======= GET /show/:id =======
  def show
    puts "\n******* show *******"
  end

  # ======= GET /user/new =======
  def new
    puts "\n******* new *******"
    @user = User.new
  end

  # ======= GET /users/:id/edit =======
  def edit
    puts "\n******* edit *******"
  end

  # ======= POST /users =======
  def create
    puts "\n******* create *******"
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # ======= PATCH/PUT /users/:id =======
  def update
    puts "\n******* update *******"
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # ======= DELETE /users/:id =======
  def destroy
    puts "\n******* destroy *******"
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def signin_params
      puts "\n******* signin_params"
      params.permit(:username, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:fname, :lname, :email, :username, :password)
    end
end
