var casper = require('casper').create({
  viewportSize: {width: 1200, height: 800},
  onError: function(self, m) {   // Any "error" level message will be written
      console.log('FATAL:', m);  // on the console output and PhantomJS will
      self.exit();               // terminate
  },
  pageSettings: {
    javascriptEnabled: true,
    loadImages:  true,        // The WebPage instance used by Casper will
    loadPlugins: true,         // use these settings
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4'
  },
  waitTimeout: 20000
});

var debug = true;

var fields = { 
  region: 12,
  dpt_code: 75, // cannot be accessed by input[name=dpt_code]
  zipcode: "75009",
  category: 39,
  name: "Snap Tosel",
  email: "snaptosell@gmail.com",
  phone: "0666666667",
  phone_hidden: true,
  subject: "IPhone 4 bon état",
  body: "Acheté il y a un an",
  image0: 'public/criteo.jpg'
};

  for (var key in fields) {
    fields[key] = casper.cli.get(key) || fields[key];
  }

  var pwd = casper.cli.get("pwd") || "coucou";

// leboncoin homepage
casper.start('http://www.leboncoin.fr', function(){
    this.mouseEvent('click', '.Deposer img'); // deposer annonce
  });

// form
casper.waitForSelector("#formular", function(){
    this.fill("form[name='formular']", fields, false); // remplir formulaire
    if(debug){this.capture('screen_form.png');};
    this.mouseEvent('click', '.button-upload'); // upload photo
  });

// form
casper.waitForSelector(".photo.waiting", function(){
  if(debug){
    this.capture('screen_form_photo_upload.png');
  };
    this.mouseEvent('click', 'input[name=validate]'); // submit
  });

// preview
casper.waitForSelector("#lbc_submit", function(){
  if(debug){
    this.echo("Capture");
    this.capture('screen_form_done.png');
  };
  this.fill("form[name='formular']", {
    passwd: pwd,
    passwd_ver: pwd
  }, true);
});

// confirmation
casper.waitForSelector("ul", function(){
  if(debug){this.capture('end.png');};
});

casper.run();