class Admin::WordsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "Successfully created!"
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words    
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  
  end
  
  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    @word.update(word_params)
    if @word.update(word_params)
      flash[:success] = "Successfully Updated!"
      redirect_to  admin_category_words_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.destroy
      flash[:success] = "Successfully Deleted!"
      redirect_to  admin_category_words_url
    else
      render 'edit'
    end
  end

  private
    def word_params
      params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
    end

end
