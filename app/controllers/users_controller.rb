class UsersController < ApplicationController


    def create
        user = User.create(user_params)
        
        if user.valid?
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: user
            }
        else
            render json: {
                status: 500
            }
        end

    end

    def show
       user = User.find(params[:id])

      if user
          render json: {
              user: user
          }
      else
        render json: {
            status: 500,
            errors: ['user not found']
        }
      end
   
    end

  

    private

    def user_params
        params.require(:user).permit(:username, 
                                     :password, 
                                     :password_confirmation, 
                                     :email, 
                                     :bio,
                                     :avatar)
    end

end
