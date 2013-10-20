class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  belongs_to :user,       class_name: 'User'
  has_mongoid_attached_file :picture, styles: {thumb: "340x340#"}

  field :title, type: String
  field :location,  type: Hash

  field :zip_code, type: String
  field :dpt_code, type: Integer
  field :region, type: Integer

  before_save :parse_location

  after_save :post_to_leboncoin

  def parse_location
    unless self.zip_code.present? && self.dpt_code.present?
      self.zip_code = self.location["address_components"].select{|a| a["types"] == ["postal_code"]}.first["short_name"]
      self.dpt_code = self.zip_code[0..1]
      self.region_from_dpt
    end
  end

  def post_to_leboncoin
    IO.popen("casperjs lib/assets/post_leboncoin.js --region='#{self.region}' --dpt_code='#{self.dpt_code}' --zipcode='#{self.zip_code}' --category=39 --name='#{self.user.name.gsub(/\s+/, "")}' --email='#{self.user.email}' --phone='0676845050' --phone_hidden=true --subject='#{self.title}' --body='Achete il y a un an'  --image0='public#{self.picture(:thumb).split('?')[0]}' --pwd='coucou' --screenshot=false") do |io|
      while line = io.gets
        logger.info line
      end
    end
  end

  def region_from_dpt
    h = {67=>1,68=>1,24=>2,33=>2,40=>2,47=>2,64=>2,3=>3,15=>3,43=>3,63=>3,14=>4,50=>4,61=>4,21=>5,58=>5,71=>5,89=>5,22=>6,29=>6,35=>6,56=>6,18=>7,28=>7,36=>7,37=>7,41=>7,45=>7,8=>8,10=>8,51=>8,52=>8,25=>10,39=>10,70=>10,90=>10,27=>11,76=>11,75=>12,77=>12,78=>12,91=>12,92=>12,93=>12,94=>12,95=>12,11=>13,30=>13,34=>13,48=>13,66=>13,19=>14,23=>14,87=>14,54=>15,55=>15,57=>15,88=>15,9=>16,12=>16,31=>16,32=>16,46=>16,65=>16,81=>16,82=>16,59=>17,62=>17,44=>18,49=>18,53=>18,72=>18,85=>18,2=>19,60=>19,80=>19,16=>20,17=>20,79=>20,86=>20,4=>21,5=>21,6=>21,13=>21,83=>21,84=>21,1=>22,7=>22,26=>22,38=>22,42=>22,69=>22,73=>22,74=>22}
    self.region = h[self.dpt_code]
  end 

end