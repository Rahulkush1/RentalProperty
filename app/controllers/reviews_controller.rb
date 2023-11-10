class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def new
    @user =  current_user
    @review = @user.reviews.build
    @property = Property.find(params[:id])

  end

  def update
    @review = Review.find(params[:id])
    user = User.find(review_params[:user_id])
    if @review.update(review_params)
      redirect_to sub_admin_property_path(user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
     @user =  current_user
     user = User.find(review_params[:user_id])
     @review = @user.reviews.new(review_params)
     if @review.save!
        redirect_to sub_admin_property_path(user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
    def review_params
      params.require(:review).permit(:rating,:body, :user_id)
    end
end
