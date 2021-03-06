class User < ApplicationRecord
  has_many :items
 class << self
   def authenticate(email, password)
     user = User.find_for_authentication(email: email)
     user.try(:valid_password?, password) ? user : nil
   end
 end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
