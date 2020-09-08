class UsersController < ApplicationController
  # ユーザーの一覧画面
  def index
    # Userモデルの情報を全て取得する
    @users = User.all
  end

  # ユーザーの詳細画面
  def show
    # 1人だけの情報を取り出す
    # params[:id]で、URLの番号をとってくる
    @user = User.find(params[:id])
  end

  def edit
  end
end
