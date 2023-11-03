class HomeController < ApplicationController
  # before_action :authenticate_user! 
  def index
    @property = Property.where(publish: 1).where(is_paid: false).take(4)
    @Topproperties = Property.order(price: :desc).where(publish: 1).where(is_paid: false).limit(4)
  end

  def home
    @property = Property.where(publish: 1).take(4)
    @Topproperties = Property.order(price: :desc).where(publish: 1).limit(4)    
  end
end
