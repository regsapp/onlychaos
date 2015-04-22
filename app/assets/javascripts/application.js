// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require ckeditor/init
//= require social-share-button
//= require questions
// require_tree .

$(document).ready(function() {

	$('.A2').hide();
	$('.OCR').hide();

	$('.AS-link').click(function(e) {
		e.preventDefault();
		$('.AS').show();
		$('.A2').hide();
		$('.tab-AS').addClass('active');
		$('.tab-A2').removeClass('active');
	});

	$('.A2-link').click(function(e) {
		e.preventDefault();
		$('.A2').show();
		$('.AS').hide();
		$('.tab-A2').addClass('active');
		$('.tab-AS').removeClass('active');
	});

	$('.Edexcel').hide();
	$('.AQA').hide();

	$('.OCR-link').click(function(e) {
		e.preventDefault();
		$('.OCR').show();
		$('.Edexcel').hide();
		$('.AQA').hide();
		$('.tab-OCR').addClass('active');
		$('.tab-Edexcel').removeClass('active');
		$('.tab-AQA').removeClass('active');
	});

	$('.Edexcel-link').click(function(e) {
		e.preventDefault();
		$('.Edexcel').show();
		$('.OCR').hide();
		$('.AQA').hide();
		$('.tab-Edexcel').addClass('active');
		$('.tab-OCR').removeClass('active');
		$('.tab-AQA').removeClass('active');
	});

	$('.AQA-link').click(function(e) {
		e.preventDefault();
		$('.AQA').show();
		$('.OCR').hide();
		$('.Edexcel').hide();
		$('.tab-AQA').addClass('active');
		$('.tab-OCR').removeClass('active');
		$('.tab-Edexcel').removeClass('active');
	});

	$(".formulas").hover(
   function(e){
       $("#formulatip").show();
   },
   function(e){
       $("#formulatip").hide();
  });

});
