module Leboncoin
  def post_to_leboncoin
    IO.popen('casperjs lib/assets/post_leboncoin.js --region=12 --dpt_code=75 --zipcode="75009" --category=39 --name="Homer Simpson" --email="homer@simpson.com" --phone="0676845050" --phone_hidden=true --subject="Super object de décoration" --body="Acheté il y a un an"  --image0="public/criteo.jpg" --pwd="coucou"') do |io|
      while line = io.gets
        logger.info line
      end
    end
  end
end