class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted user."
    redirect_to :action => "index"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      #flash[:notice] = "You have been signed up successfully."
      redirect_to controller: 'sessions', action: 'new', :notice => "Signed up!"   
    else
      flash[:error] = "Error!"
      render :action => 'new'
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
