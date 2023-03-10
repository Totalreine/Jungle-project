class Admin::CategoriesController < ApplicationController
    http_basic_authenticate_with name: "Jungle", password: "book"
  
  def index
    @categories = Category.order(name: :desc).all
    puts @categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end

  end

  private

  def product_params
    params.require(:category).permit(
      :name,
      
    )
  end
end
