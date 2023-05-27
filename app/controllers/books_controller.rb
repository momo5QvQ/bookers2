class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user 
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = User.find(params[:id])
    @book.update(user_params)
    redirect_to book_path(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
