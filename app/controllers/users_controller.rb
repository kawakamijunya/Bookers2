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
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end


end
