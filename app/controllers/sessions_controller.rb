class SessionsController < ApplicationController

    ##creating login session
    def create
        @user = User.find_by(email: params[:email])
        
      
        if @user && @user.authenticate(params[:password])
            render json: {user: UserSerializer.new(@user)}
        else
            render json: {
                message: "Oops, try again!"
            }
        end
    end


    private
    def session_params
          params.permit(:username, :password, :email)
    end

end
