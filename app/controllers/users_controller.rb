class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
    session[:user_id] = nil
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Registered Successfully"
    else
      @users = User.all
      render :index, status: :unprocessable_entity
    end
  end

def profile
  @user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to profile_path(@user), notice: "Profile Updated Successfully"
  else
    render :edit, status: :unprocessable_entity
  end
end

def login
  @user = User.new
end

def login_form
  user = User.find_by(email: params[:email])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect_to(user.is_admin? ? products_path : home_path, notice: "Logged In Successfully")
  else
    flash.now[:alert] = "Invalid email or password"
    render :login, status: :unprocessable_entity
  end
end


def logout
  session[:user_id] = nil
  redirect_to login_path, notice: "Logged Out Successfully"
end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
