class UsersController < ApplicationController
    
    def create
     @user = User.new(user_params)
         if @user.save
             login!  
             render json: {
             status: :created,
             user: @user
         }
        else 
            render json: {
            status: 500,
            errors: @user.errors.full_messages
        }
        end
    end


    def index
        @users = User.all
           if @users
              render json: {
              users: @users
           }
          else
              render json: {
              status: 500,
              errors: ['no users found']
          }
         end
    end

    def show
        @user = User.find(params[:id])
            if @user
                render json: {
                user: @user
            }
            else
                render json: {
                status: 500,
                errors: ['user not found']
                }
            end
    end

    def update
        @user = User.find(params[:id])
            if @user.avatar.attached? 
                @user.update(user_params)
            elsif
                @user.avatar.attach(io: File.open("/path/to/face.jpg"), filename: "face.jpg", content_type: "image/jpg")
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
