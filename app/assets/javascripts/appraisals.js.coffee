# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery.maskMoney.min
//= require jquery.carouFredSel-6.1.0-packed
//= require jquery.fancybox-1.3.4.pack
jQuery ->
	$(".currency-input").maskMoney()
	$("#supplemental_information").collapse({toggle:false})
	$('#foo').carouFredSel({height: 380, prev : {button : "#foo_prev",key : "left"},next : {button : "#foo_next",key : "right"}});
	$("#foo a").fancybox({ autoDimensions: false, autoScale: false, width:'95%', height:'95%', cyclic: true; onStart: `function() {$("#foo").trigger("pause");}`, onClosed: `function() {$("#foo").trigger("play");}`})
