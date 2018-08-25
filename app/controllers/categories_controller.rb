class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def check_for_duplicate_category_name(name)
     Category.find_by(title: name)
  end

  def create
    @category = Category.new(category_params)
    if check_for_duplicate_category_name(category_params[:title]) == nil
      @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
      if check_for_duplicate_category_name(category_params[:title]) == nil
      @category.update(category_params)
      if @category.save
        flash[:success] = "#{@category.title} updated!"
        redirect_to category_path(@category)
      else
        redirect_to edit_category_path(@category)
      end
    else
      redirect_to edit_category_path(@category)
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end


end
