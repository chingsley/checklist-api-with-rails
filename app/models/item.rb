require 'elasticsearch/model'

class Item < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user

  validates :user_id, presence: true
end

# Item.__elasticsearch__.create_index!
# Item.import


# Item.import # for auto sync model with elastic search