class User < ApplicationRecord
  
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :properties, dependent: :destroy
  has_one :address, as: :addressable
  has_many :appointments, dependent: :destroy
  has_many :payment_details, dependent: :destroy
  accepts_nested_attributes_for :roles, allow_destroy: true



  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["confirmation_sent_at", "confirmation_token", "confirmed_at", "contact_no", "created_at", "email", "encrypted_password", "first_name", "id", "last_name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "unconfirmed_email", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["address", "properties", "roles", "appointments"]
  end

  after_create do
    customer = Stripe::Customer.create({
      name: self.first_name + " " + self.last_name,
      phone: self.contact_no, 
      email: self.email
    })
    # binding.pry
  end



end
