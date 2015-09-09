class UsersController < ApplicationController
  require 'date'

  def index
    #@users = User.all
    @users = User.all
    #@next_game = 1 #method here
    #@next_next_game = 2 #do i need to set these variables at all
    next_game
    #or should I just run the method?
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
    next_game
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
      if user_params[:name] #check if i need this double-if checker or not
        #am doing this b/c sometimes will only have :name or :status in params
        @user.name = user_params[:name]
      end
      if user_params[:status]
        @user.status = user_params[:status]
      end
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
    params.require(:user).permit(:name, :status)
  end

  def next_game
    if Date.today.wday >= 1 && Date.today.wday <= 3
      #@next_game, @next_next_game = 'Wednesday', 'Sunday'
      @next_game = next_wednesday
      @next_next_game = next_sunday
    else
      #@next_game, @next_next_game = 'Sunday', 'Wednesday'
      @next_game = next_sunday
      @next_next_game = next_wednesday
      #next game is sunday
      #next_next_game is wed
    end
  end

  def next_wednesday
    x = Date.today
    x += 1 until x.wday > 2 && x.wday < 4#for some reason, can't just use equal sign...
    x
  end

  def next_sunday
    x = Date.today
    x += 1 until x.wday <=0 #for some reason, can't just use equal sign
    x
  end

  def testing
    #@users = User.all
    #rake db:reset
  end


end
