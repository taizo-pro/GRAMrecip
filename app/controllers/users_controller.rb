class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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

  # ユーザーの編集画面
  def edit
    @user = User.find(params[:id])
  end

  # 編集してDBに登録するアクション
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # 画面遷移
    redirect_to user_path(@user)
  end

  # DBに登録するカラムを定義
  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
