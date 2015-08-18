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
    @user = User.find(params[:id])
  end

  def show
    #Not really using this action...
    @users = User.all
    @user = User.find(params[:id])
    render 'show'
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.name = user_params[:name]
      @user.save
    end
    redirect_to users_url
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    #flash @user.name
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
