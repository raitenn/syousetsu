class ChaptersController < ApplicationController
	def new
  	@book = Book.find(params[:book_id])
	@chapter = Chapter.new
	end

	def create
		 # ストロングパラメーターを使用
  		 @book = Book.find(params[:book_id])
         @chapter  = Chapter.new(chapter_params)
         @chapter.user_id = current_user.id
         @chapter.book_id = @book.id
        if  @chapter.save
            redirect_to '/'

        else
            # render edit_book_chapter_path(:book_id, :chapter) #失敗の場合 
            render "chapters/new.html.erb"
        end

    end

    def show
      @book = Book.find(params[:book_id])
      @chapter = Chapter.find(params[:id])
    end

    def edit
      @book=Book.find(params[:book_id])
      @chapter = Chapter.find(params[:id])
    end

    def index

    end

    def update
      book = Book.find(params[:book_id])
      chapter = Chapter.find(params[:id])
      if chapter.update(chapter_params)
      flash[:notice] = "Book was successfully update."
      redirect_to user_path(book,chapter)
      end
    end

    def destroy
        book = Book.find(params[:book_id])
        chapter = Chapter.find(params[:id])
        chapter.destroy
        redirect_to edit_book_path(book)
    end

         private

    def chapter_params
        params.require(:chapter).permit(:subtitle, :subchapter)
    end
end


