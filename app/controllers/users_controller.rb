class UsersController < ApplicationController
    has_secure_password

    validates :username, :email, :password, presence: {message: "Attribute must be given"} on: :create
    validates :email, uniqueness: true on: :create
    validates :password, length: {minimum: 6}

    def create
        @user = User.create(user_params)
        
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
