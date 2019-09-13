class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # GET /organizations
  # GET /organizations.json
  def index
    if current_user.organization_id != nil
      redirect_to organization_path(current_user.organization_id)
    end
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    if current_user.organization_id == nil
      flash[:notice] = "Join an organization first!"
      redirect_to organizations_path    
    elsif current_user.organization_id != @organization.id
      flash[:notice] = "You cannot visit organizations you're not part of."
      redirect_to organization_path(current_user.organization_id)
    end
    # user = User.all
    # @organization_users = @organization.user
  end

  # GET /organizations/new
  def new
    if current_user.organization_id == nil
      @organization = Organization.new
    else
      flash[:notice] = "You're already in an organization!"
      redirect_to organization_path(current_user.organization_id)
    end
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:notice] = "Organization was successfully created."
      current_user.organization_id = @organization.id
      current_user.save
      redirect_to organizations_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    if @organization.update(organization_params)
      flash[:notice] = "Organization was successfully updated."
      redirect_to organizations_path
    else
      render 'edit'
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    flash[:notice] = "Organization was successfully deleted."
    redirect_to organizations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :hourly_rate)
    end
end
