class UsersController < ApplicationController
  before_filter :require_signin, except: [:new, :create]
  before_filter :correct_user, only: [:edit, :update]

  def new
  	@user = User.new
  end

  def show 
  	@user = User.find(params[:id])
    @invitations = @user.loop_memberships.pending
  end

  def create 
  	@user = User.new(params[:user])

  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to Th Moov!"
  		redirect_to @user
  	else 
  		render 'new'	
  	end
  end

  def edit
    #@user found in correct_user
  end

  def update 
    #@user found in correct_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Changes saved successfully"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private 
    def require_signin
      store_location
      redirect_to root_url, notice: "You must be signed in" unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to current_user unless @user == current_user
    end
  
end
