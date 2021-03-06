class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Adnat, " + @user.name
      redirect_to organizations_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully."
      if current_user.organization_id != nil
        redirect_to organization_path(current_user.organization_id)
      elsif current_user.organization_id == nil
        redirect_to organizations_path
      end
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email_address, :password)
    end

    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit your own account."
        redirect_to root_path
      end
    end
        
end
