class UsersController < ApplicationController
  def index
    # Userモデルの情報を全て取得する
    @users = User.all
  end

  def show
  end

  def edit
  end
end
