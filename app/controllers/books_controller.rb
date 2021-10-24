class BooksController < ApplicationController
   def index
      @books = Book.all
      @book = Book.new
   end

   def show
      @books = current_user.posts.all
   end

   def edit
   end
   
   private
   def user_params
   	params.require(:user).permit(:name, :profile_image)
   end
end
