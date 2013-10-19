class Product
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user,       class_name: 'User'
  has_mongoid_attached_file :picture

  field :title, type: String
end
