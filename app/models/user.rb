class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :items

  after_save :index_items_in_elasticsearch

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


  private

  def index_items_in_elasticsearch
    items.find_each { |item| item.__elasticsearch__.index_document }
  end
end
