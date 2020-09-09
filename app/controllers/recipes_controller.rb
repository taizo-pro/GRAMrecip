class RecipesController < ApplicationController
  def index
  end

  def show
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

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end

  def edit
  end
end
