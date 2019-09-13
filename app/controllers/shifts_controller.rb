class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # GET /shifts
  # GET /shifts.json
  def index
    if current_user.organization_id != nil
      flash[:notice] = "The page you're going to does not exist."
      redirect_to organization_path(current_user.organization_id)
    else
      flash[:notice] = "You should be joined in an organization."
      redirect_to organizations_path
    end
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @organization = Organization.find_by(id: current_user.organization_id)
    @shift = current_user.shifts.new(shift_params)
    @shift.shift_date = DateTime.now
    if @shift.save
      flash[:notice] = "Shift was successfully created."
      redirect_to organizations_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    if @shift.update(shift_params)
      flash[:notice] = "Shift was successfully edited."
      redirect_to organization_path(current_user.organization_id)
    else
      render 'edit'
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    flash[:notice] = "Shift was successfully deleted."
    redirect_to organization_path(current_user.organization_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:user_id, :organization_id, :shift_date, :start, :finish, :break_length, :timestamps)
    end
end
