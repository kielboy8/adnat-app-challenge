class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email_address: params[:session][:email_address].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in."
            if user.organization_id != nil
                redirect_to organization_path(user.organization_id)
            else
                redirect_to organizations_path
            end
        else
            flash.now[:danger] = "There was something wrong with your login information."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out."
        redirect_to root_path
    end
end