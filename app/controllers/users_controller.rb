class UsersController < ApplicationController
  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def show
    
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction)
  end

end
