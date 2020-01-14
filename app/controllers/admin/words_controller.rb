class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "Successfully created!"
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  private
    def word_params
      params.require(:word).permit(:content)
    end

end
