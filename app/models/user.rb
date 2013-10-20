class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :products,     class_name: 'Product'

  field :first_name,      type: String, default: 'John'
  field :last_name,       type: String, default: 'Doe'
  field :email,           type: String, default: 'snaptosell@gmail.com'

  def full_name
    first_name + ' ' + last_name
  end

end