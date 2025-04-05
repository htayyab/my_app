class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to articles_path, notice: "Welcome to my APP." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @user is already set by the before_action
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to articles_path, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to users_path, alert: "User not found"
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
