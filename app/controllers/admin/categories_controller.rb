class Admin::CategoriesController < ApplicationController

  ## to information to partial
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Catagory deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at,
    ) 
    end

end

