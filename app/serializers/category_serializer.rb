class CategorySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  has_many :events
end
