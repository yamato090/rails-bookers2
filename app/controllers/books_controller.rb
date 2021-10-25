class BooksController < ApplicationController
   def index
     @user = current_user
     @book = Book.new
     @books = Book.all
   end
   def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
         flash[:complete]=" created."
         redirect_to book_path(@book)
      else
         @books = Book.all
         render :index
      end
   end

   def show
     @book = Book.find(params[:id])
     @books = Book.all
     @user = current_user
   end

   def edit
      @book = Book.new
      @book = Book.find(params[:id])
   end
   def update
   @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:complete]=" updated."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render :edit
      end
   end
   def destroy
     book = Book.find(params[:id])
      if book.destroy
        flash[:complete]=" destroyed."
        redirect_to books_path
      end
   end


   private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end
