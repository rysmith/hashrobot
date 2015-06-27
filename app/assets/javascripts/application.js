// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $.getJSON( "http://www.hashrobot.com/api/categories", function( data ) {
        for (i = 0; i < data.length; i++) {
            var categoryName = data[i].name;
            var shortCategoryName = categoryName.split(" ")[0];
            $('#dropdown1').append("<li><a href='#!' id='" + shortCategoryName +"'>" + categoryName + "</a></li>");

        }

        $("#Animals").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/1", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Beauty").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/2", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Business").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/3", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Computers").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/4", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Consumer").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/5", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Education").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/6", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Entertainment").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/7", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Environment").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/8", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Food").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/9", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Gardening").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/10", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Health").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/11", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Home").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/12", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Humanities").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/13", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });

        });

        $("#Science").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/14", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Society").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/15", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

        $("#Travel").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/16", function( data ) {
                for (i = 0; i < data.length; i++) {
                    var hashtag = data[i].name;
                    $('.tag-results').append("<div class='card'>" + hashtag + "</div>")
                }
            });
        });

    });


});