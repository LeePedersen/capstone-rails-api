class UsersController < ApplicationController

  before_action :authorize, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    if @user = User.new(user_params)
      if @user.save
        # flash[:notice] = "You've successfully signed up!"
        session[:user_id] = @user.id
        json_response('adjksfhadfsjkkl')
        # json_response(@user)
        # redirect_to "/"
      # else
        # flash[:alert] = "There was a problem signing up."
        # render :new
      end
    # else
    #   flash[:alert] = "There was a problem signing up. Try clearing your cookies and trying again"
    #   render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    json_response(@user)
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    session[:user_id] = nil
    # redirect_to '/'
  end

  private

  def user_params
    params.permit(:email, :username, :password, :password_confirmation)
  end

  def json_response(objec, status = :ok)
    render json: object, status: status
  end

end
