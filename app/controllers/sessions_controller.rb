class SessionsController < ApplicationController

    ##creating login session
    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), token: token}
        else
            render json: {
                message: "Oops, try again!"
            }
        end
    end


    private
    def session_params
          params.require(:user).permit(:username, :password, :email)
    end

end
