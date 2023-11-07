class SubAdminPropertiesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @properties = @user.properties.where(status: 0).where(publish: 1)

    @reviews = Review.joins(:user).where(user: {id: @user})
    @avg_rating = Review.average("rating")
  end
end
