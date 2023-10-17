class SubAdminPropertiesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @properties = @user.properties.where(status: 0).where(publish: 1)
    render json:{data: @properties}
  end
end
