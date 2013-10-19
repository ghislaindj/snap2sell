(function() {
	var values = {
		region: 12,
		dpt_code: 75, // cannot be accessed by input[name=dpt_code]
		zipcode: "75009",
		category: 39,
		name: "Snap Tosel",
		email: "snaptosell@gmail.com",
		phone: "0666666667",
		//phone_hidden: true,
		subject: "IPhone 4 bon état",
		body: "Acheté il y a un an",
		//image0: "ma photo.jpg", // file to upload
	};
	for (var key in values) {
		document.getElementById(key).value = values[key];
	}

	document.getElementById("phone_hidden").checked = "checked";

	var form = document.getElementById("formular");
	form.setAttribute("onsubmit", "");

	confirm("submit?", function() {
		form.submit();
	});

})();