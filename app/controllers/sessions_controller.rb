class SessionsController < ApplicationController

    
    private
    def session_params
          params.require(:user).permit(:username, :password, :email)
    end

end
