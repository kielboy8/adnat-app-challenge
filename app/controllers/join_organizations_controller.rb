class JoinOrganizationsController < ApplicationController
    before_action :require_user
    
    def update
        current_user.organization_id = params[:organization]
        current_user.save
        redirect_to organization_path(params[:organization])
    end

    def destroy
        current_user.organization_id = nil
        current_user.shifts.delete_all
        current_user.save
        redirect_to organizations_path
    end
end