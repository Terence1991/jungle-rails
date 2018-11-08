class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def index 
    @categories = Category.products.order(created_at: :desc) 
  end 
  
  

end
