class CategorySerializer < ActiveModel::Serializer
    attributes :id, :name
    belongs_to :owner, class_name: "User", foreign_key: "owner_id"
    has_many :events
  end
