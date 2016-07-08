class UsersController < ApplicationController
  #load landing page
  def index
  end

  #create user
  def create
  	@user = User.new(user_params)
  	if @user.save
  	  session[:id] = @user.id
  	  redirect_to '/dashboard'
  	else
  	  flash[:errors] = @user.errors.full_messages
  	  redirect_to :back
  	end
  end

  #log in user
  def login
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  	  session[:id] = user.id
  	  redirect_to '/dashboard'
  	else
  	  flash[:errors] = ["Email & Password Did Not Match Records!"]
  	  redirect_to :back
  	end
  end

  #display user dashboard
  def dashboard
    @user = User.find(current_user.id)
    @current = Category.where(user: User.find(current_user.id), status: "current")
    @want = Category.where(user: User.find(current_user.id), status: "want")
    @finished = Category.where(user: User.find(current_user.id), status: "finished")
  end

  #logout user
  def logout
  	session[:id] = nil
  	redirect_to action: "index"
  end

  private
  def user_params
  	params.require(:user).permit(:alias, :email, :password, :password_confirmation)
  	# requiring password_confirmation automatically flashes error if password_confirmation field does not match
  end

end
