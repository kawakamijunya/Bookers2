class UsersController < ApplicationController
  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books #そのユーザーが投稿した全てのbook
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction)
    params.require(:book).permit(:title,:body,:user_id)
  end


end
