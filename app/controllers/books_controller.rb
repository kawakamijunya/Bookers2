class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @user=current_user
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @books=Book.all
    if@book.save
     flash[:notice]="You have created book successfully."
     redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def show
    @book_new=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
  end

  def index
    @user=current_user
    @book=Book.new
    @books=Book.all
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if@book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title,:body,:user_id)
  end
end
