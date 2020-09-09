class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    # 新規投稿なので空のモデルを持ってくる
    @recipe = Recipe.new
  end

  def edit
  end
end
