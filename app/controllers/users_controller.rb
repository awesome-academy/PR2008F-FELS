class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :find_user, only: [:show, :edit, :update]

	def show
    end

    def edit
    end
    
    def update
		if @user.update(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
    end
    
    private
	def user_params
		params.require(:user).permit(:name, :email, :password,
									   :password_confirmation)
	end

	def find_user
		@user = current_user
	end

end

