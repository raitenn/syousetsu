class HomeController < ApplicationController
	def top
		
		@ranks = Book.all.order(read: "ASC").limit(10)
	end

	def index
		@books = Book.all
		@books = Book.page(params[:page]).reverse_order
	end
end
