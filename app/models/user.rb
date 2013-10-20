class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :products,     class_name: 'Product'

  field :name,      type: String
  field :email,     type: String, default: 'snaptosell@gmail.com'

  before_save do |user|
    if user.name.nil?
      user.name = Faker::Name.name
    end
  end

end