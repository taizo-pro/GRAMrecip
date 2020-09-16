class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  # レシピの詳細画面
  def show
    # 1人だけの情報をとってくる
    @recipe = Recipe.find(params[:id])
  end

  def new
    # 新規投稿なので空のモデルを持ってくる
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # ログインしてる人のIDを判別する。誰が投稿しているのか
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  # DBに登録するアクション
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    # 画面遷移
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipe_path(@recipe)
  end

  # DBに登録するカラムを設定する
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end

end
