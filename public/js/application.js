$(document).ready(function () { 
  // Put your JavaScript behavior here
  switchTabs();
  showStockForm();
  addStock();
  nasdaq();
  nyse();
  dj();
  map();



});
function switchTabs(){
	$(".tabs li a").on('click',function(event){
	event.preventDefault();

	$(this).parent().addClass('active').siblings().removeClass('active');
	var paragraph = $(this).attr("href");


	$('.tab-content').hide();
	$(paragraph).show();	
})
}

function showStockForm(){
	$("a#new-stock").on('click',function(event){
		event.preventDefault();
	$(this).parent().hide();

	$.ajax({
		url: "/stock/new",
		method: "GET"
	})
	.done(function(serverResponse){
		$('#place-for-new-form').append(serverResponse)
	})
	})
}

function addStock(){
	$('#place-for-new-form').on('submit','#new-form',function(event){
		event.preventDefault();
		var stockForm = $(this);
		// console.log(stockForm)
		var pathway = $(this).attr('action');
		// console.log(pathway)
		var mydata = $(this).serialize();

		$.ajax({
			url: pathway,
			method: 'POST',
			data: mydata
		})
		.done(function(serverResponse){
			$(serverResponse).appendTo('#list-group')
			$(stockForm).hide();
			$('#new-stock').parent().show();
		})
	})
}

function nasdaq(){
	$("a#nasdaq-link").on('click',function(event){
		event.preventDefault();
	$("a#nasdaq-link").hide();	
	$.ajax({
	url: "/stock/nasdaq",
	method: "GET"
	})
	.done(function(serverResponse){
		$(serverResponse).appendTo("#nasdaq-pic")

	})
	})

}

function nyse(){
	$("a#nyse-link").on('click',function(event){
		event.preventDefault();
	$("a#nyse-link").hide();	
	$.ajax({
	url: "/stock/nyse",
	method: "GET"
	})
	.done(function(serverResponse){
		$(serverResponse).appendTo("#nyse-pic")
	})
	})

}

function dj(){
	$("a#dj-link").on('click',function(event){
		event.preventDefault();
	$("a#dj-link").hide();	
	$.ajax({
	url: "/stock/dj",
	method: "GET"
	})
	.done(function(serverResponse){
		$(serverResponse).appendTo("#dj-pic")
	})
	})

}

function map() {
  var mapProp = {
    center:new google.maps.LatLng(37.790426, -122.399158),
    zoom:90,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var myLatLng= {lat: 37.790426,lng: -122.399158}
  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
  var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'TD Ameritrade'
        });
}
// google.maps.event.addDomListener(window, 'load', initialize);
