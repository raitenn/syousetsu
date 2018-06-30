class UsersController < ApplicationController
	def users
		
	end
	def management

	end
	def impression
	@user = User.find(params[:id])
		if @user == current_user
			@users = User.all
		else
			redirect_to ("/")
		end
	end

	def destroy
        user = User.find(params[:user_id])
        impression = Impression.find(params[:id])
      	imoression.destroy
        redirect_to user_path(@user)
    end

	def show
		@user = User.find(params[:id])
		if @user == current_user
			@users = User.all
		else
			redirect_to ("/")

	end

	end
end
