/*
 
== Dependencies ==
 
CasperJS - http://casperjs.org/
PhantomJS - http://phantomjs.org/
 
== Command Line Options ==
 
Required:
  --region: 12,
  --dpt_code: 75,
  --zipcode: "75009",
  --category: 39,
  --name: "Snap Tosel",
  --email: "snaptosell@gmail.com",
  --phone: "0666666667",
  --phone_hidden: true,
  --subject: "IPhone 4 bon état",
  --body: "Acheté il y a un an",
  --image0: 'public/criteo.jpg'
  --pwd: "myfirstpassword"

 
== Example ==
 
$ casperjs post_leboncoin.js --region=12 --dpt_code=75 --zipcode="75009" --category=39 
                             --name="Homer Simpson" --email="homer@simpson.com" --phone="0676845050" 
                             --phone_hidden=true --subject="Super object de décoration" --body="Acheté il y a un an" 
                             --image0='public/criteo.jpg' --pwd="coucou"

Made with love in Paris by @adrienjoly @ghislaindj @thomasguillory

*/


var casper = require('casper').create({
  viewportSize: {width: 1200, height: 800},
  // Any "error" level message will be written on the console output and PhantomJS will terminate
  onError: function(self, m) { 
      console.log('FATAL:', m);
      self.exit();
  },
  pageSettings: {
    javascriptEnabled: true,
    loadImages:  true,
    loadPlugins: true,
    //userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4'
  },
  waitTimeout: 20000
});

var debug = casper.cli.get("screenshot") || false;


var fields = { 
  region: 12,
  dpt_code: 75,
  zipcode: "75009",
  category: 39,
  name: "Snap Tosel",
  email: "snaptosell@gmail.com",
  phone: "0666666667",
  phone_hidden: true,
  subject: "IPhone 4 bon état",
  body: "Acheté il y a un an",
  image0: 'public/attack_criteo.jpg'
};

for (var key in fields) {
  fields[key] = casper.cli.raw.get(key) || fields[key];
}

var pwd = casper.cli.get("pwd") || "coucou";

// Homepage of leboncoin
casper.start('http://www.leboncoin.fr', function(){
  if(debug){
    this.echo("######## Start of the process ########"),
    this.capture('start.png')
  };
  this.mouseEvent('click', '.Deposer img');
});

// Fill of the Form
casper.waitForSelector("#formular", function(){
  this.fill("form[name='formular']", fields, false);
  if(debug){this.capture('screen_form.png');};
  this.mouseEvent('click', '.button-upload'); 
});

// Wait for the picture to be uploaded
casper.waitForSelector(".photo.waiting", function(){
  if(debug){
    this.capture('screen_form_photo_upload.png');
  };
  this.mouseEvent('click', 'input[name=validate]');
});

// Preview before final validation of the form
casper.waitForSelector("#lbc_submit", function(){
  if(debug){
    this.capture('screen_form_done.png');
  };
  this.fill("form[name='formular']", {
    passwd: pwd,
    passwd_ver: pwd
  }, true);
});

// Confirmation page : it's ok
casper.waitForSelector("ul", function(){
  if(debug){
    this.capture('end.png');
    this.echo("######## End of the process ########");
  };
  this.echo(true);
});

casper.run();