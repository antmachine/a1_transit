class UsersController < ApplicationController

	def show
		@user = User.find(params)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to A1Transit"
			sign_user @user
			redirect_to @user
		else
			flash[:error] = "Failed to create account. Please try again."
			redirect_to new_user_path
		end

	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password)
			
		end

end
