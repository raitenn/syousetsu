class SubtitleController < ApplicationController

	def create
		 # ストロングパラメーターを使用
         book  = Book.new(post_params)
         book.user_id = current_user.id
        # DBへ保存する
         book.save
        # トップ画面へリダイレクト
        redirect_to '/'
    end
    private
 
    def post_params
        params.require(:book).permit(:subtitle, :subchapter)
    end
end
