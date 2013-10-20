class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip


  belongs_to :user,       class_name: 'User'
  has_mongoid_attached_file :picture, styles: {thumb: "340x340#"}

  field :title,     type: String
  field :location,  type: Hash
end
