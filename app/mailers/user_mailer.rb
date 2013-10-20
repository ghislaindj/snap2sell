class UserMailer < ActionMailer::Base
  default from: "snaptosell@gmail.com"


  def new_product(user, product_id)
    @user = user
    #@url  = "http://example.com/login"
    @product = Product.where(id: product_id).first
    mail(:to => user.email, :subject => "Your product is online")
  end
end
