class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    if @category.save
      flash[:success] = "You successfully saved a new category!!"
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(categories_params)
    if @category.update(categories_params)
      flash[:success] = "Successfully Updated!"
      redirect_to  admin_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    if @category.destroy
      flash[:success] = "Successfully Deleted!"
      redirect_to  admin_categories_url
    else
      render 'edit'
    end
  end

  def categories_params
    params.require(:category).permit(:title, :description)
  end

end
