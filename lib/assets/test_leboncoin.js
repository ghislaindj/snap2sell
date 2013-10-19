var links = [];
var casper = require('casper').create({
    viewportSize: {width: 1200, height: 800},
    verbose: true,
    logLevel: "debug"
});

// var user = casper.cli.get("user");
// var pass = casper.cli.get("pass");

var region = "12";
var dpt_code = "75";
var zipcode = "75002";

var category = "39";

var name = "Ghislain";
var email = "test@gmail.com";
var phone = "0677855095";
var phone_hidden = true;

var subject = "Titre";
var body = "Mon contenu ici";

casper.start('http://www2.leboncoin.fr/ai/init/0?request_state=form', function(){
    this.echo("Open URL");
});

casper.wait(1000, function() {
    this.fill("form[name='formular']", { 
        region: region,
        dpt_code: dpt_code,
        zipcode: zipcode,
        category: category,
        name: name,
        email: email,
        phone: phone,
        phone_hidden: phone_hidden,
        subject: subject,
        body: body
    }, false);
    this.echo("Fill just made");
    //this.click('input.button');
    this.capture('lib/assets/test0.png');
});

casper.wait(3000, function() {
    this.capture('lib/assets/test1.png');
    this.echo("Screen");
    casper.evaluate(function() {
        jQuery("form#formular").submit();
        this.capture('lib/assets/test1.png');
    });
});

casper.run();