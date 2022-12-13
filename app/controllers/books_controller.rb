class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path
  end

  def show
  end

  def index
    @user=current_user
    @book=Book.new
    @books=Book.all
  end

  def edit
  end


  private

  def books_params
    params.require(:book).permit(:title,:opinion)
  end
end
