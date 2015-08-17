class UsersController < ApplicationController
  def index
    #@users = User.all
    @users = User.all
    render 'index'
  end

  def create
    @user = User.new(user_params)
    if @user
      @user.save
    end

    redirect_to users_url
    #params.require(:user).permit(:name)
    #render 'create'
  end

  def new
    #@user = User.new
    render 'new'
  end

  def edit
  end

"""  def show
    @users = User.all
    @selected_user = User.find(params[:id])
    render 'show'
  end"""

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
