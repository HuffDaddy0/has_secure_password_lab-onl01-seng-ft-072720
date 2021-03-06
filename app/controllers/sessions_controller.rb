class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        #binding.pry
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user_path(user.id)
        else
            redirect_to new_session_path
        end
    end

    def destroy
        session.clear :user_id
    end
end