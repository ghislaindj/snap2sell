class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :products,     class_name: 'Product'

  field :first_name,      type: String
  field :last_name,       type: String
  field :email,           type: String

  def full_name
    first_name + ' ' + last_name
  end

end