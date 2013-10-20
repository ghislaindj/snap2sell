class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :user,       class_name: 'User'
  has_mongoid_attached_file :picture, styles: {thumb: "340x340#"}

  field :title, type: String
  field :location,  type: Hash

  def post_to_leboncoin
    IO.popen("casperjs lib/assets/post_leboncoin.js --region=12 --dpt_code=75 --zipcode='75009' --category=39 --name='Homer Simpson' --email='homer@simpson.com' --phone='0676845050' --phone_hidden=true --subject='#{self.title}' --body='Achete il y a un an'  --image0='public#{self.picture(:thumb).split('?')[0]}' --pwd='coucou' --screenshot=true") do |io|
      while line = io.gets
        logger.info line
      end
    end
  end
end