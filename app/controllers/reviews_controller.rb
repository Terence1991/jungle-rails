class ReviewsController < ApplicationController
 def create
  review = Review.new(review_params)
  review.user_id = current_user.id
  review.product_id = params[:product_id]
  puts " this is working #{params}"
  if review.save
    redirect_to '/'
  else
    puts review.errors.full_messages
    redirect_to '/signup'
  end
end

def review_params
  params.require(:review).permit(:description, :product_id, :rating)
end

 end  

