class BooksController < ApplicationController
	def new
	@book = Book.new
	end
	def create
		 # ストロングパラメーターを使用
         @book  = Book.new(book_params)
         @book.user_id = current_user.id
        # DBへ保存する
         if @book.save
            redirect_to user_path(current_user)

        else
            render new_book_path #失敗の場合 
        end
    end

    def show
      @book=Book.find(params[:id]).increment!(:read,1)
      @user = @book.user
      flash[:notice] = "ログイン済ユーザーのみ記事の詳細を確認できます" 
    end

    def rank
      @rank = Book.find(Book.group(:book_id).order('read(book_id) desc').limit(5).pluck(:book_id))
    end

    def newsubtitle
        @books = Book.all
        @book = Book.new

    end
    def content
    end

    def edit
      @book=Book.find(params[:id])
      @chapter = Chapter.find(params[:id])
    end

    def title_edit
      @book=Book.find(params[:id])
    end

    def arasuji_edit
      @book=Book.find(params[:id])
    end

    def update

      book = Book.find(params[:id])
      if 
      book.update(book_params)
      redirect_to user_path
      flash[:notice] = "Book was successfully update."
      end
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to user_path
    end

         private

    def post_params
        params.require(:book).permit(:title, :body, :arasuji, :subtitle)
    end

    def book_params
          params.require(:book).permit(:title, :arasuji)
      end
end
