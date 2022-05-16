class Account < ApplicationRecord
  include Rodauth::Rails.model
    
  ROLE = {
    admin: "admin",
    customer: "customer",
  }    

  has_one :profile, dependent: :destroy
  has_many :bookmarks
  accepts_nested_attributes_for :profile

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # The validation of password here is only for the following scenario :
  # An admin creates a new Account in the /admin dashboard.
  # 
  # Security of password of customers, in the "Sign up" screen, is a lot more secure.
  # See :password_complexity in class RodauthMain. Documented here :
  # http://rodauth.jeremyevans.net/rdoc/files/doc/password_complexity_rdoc.html
  validates :password, presence: true, on: :create, format: { with: /\A(?=.{8,})/x, message: "Must contain 8+ characters" }
    

end
