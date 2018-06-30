class ImpressionsController < ApplicationController

	def create
	# ストロングパラメーターを使用
  		 @book = Book.find(params[:book_id])
         @impression = Impression.new(impression_params)
         @impression.user_id = current_user.id
         @impression.book_id = @book.id

         if @impression.save
            redirect_to  book_impressions_path(@book)

        else
            render "impressions/new.html.erb" #失敗の場合 
        end
	end

	def index
		@book=Book.find(params[:book_id])
		# @user=User.find(params[:book_id])
		@impressions = Impression.page(params[:page]).reverse_order
	end

	def written
		@user = User.find(params[:id])
		@users = User.all
		@impressions = Impression.page(params[:page]).reverse_order
	end

	def new
		@book=Book.find(params[:book_id])
		@impression = Impression.new
	end

	def destroy
        user = User.find(params[:user_id])
        impression = Impression.find(params[:id])
      	impression.destroy
        redirect_to user_path(user)
    end


	private

	def impression_params
		params.require(:impression).permit(:impression)
	end
end
