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
    @book_show.user_id=current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end


end
