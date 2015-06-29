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
            $('#dropdown1').append("<li><a href='#' id='" + shortCategoryName +"'>" + categoryName + "</a></li>");

        }

        $("#Animals").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/1", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#animals</div>")
                }
            });
        });

        $("#Beauty").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/2", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#beauty</div>")
                }
            });
        });

        $("#Business").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/3", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#business</div>")
                }
            });
        });

        $("#Computers").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/4", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#computers</div>")
                }
            });
        });

        $("#Consumer").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/5", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#electronics</div>")
                }
            });
        });

        $("#Education").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/6", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#education</div>")
                }
            });
        });

        $("#Entertainment").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/7", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#entertainment</div>")
                }
            });
        });

        $("#Environment").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/8", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#environment</div>")
                }
            });
        });

        $("#Food").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/9", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#food</div>")
                }
            });
        });

        $("#Gardening").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/10", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#gardening</div>")
                }
            });
        });

        $("#Health").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/11", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#health</div>")
                }
            });
        });

        $("#Home").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/12", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#home</div>")
                }
            });
        });

        $("#Humanities").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/13", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#humanities</div>")
                }
            });

        });

        $("#Science").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/14", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#science</div>")
                }
            });
        });

        $("#Society").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/15", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#society</div>")
                }
            });
        });

        $("#Travel").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/16", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card'>#travel</div>")
                }
            });
        });

    });

    $('.parallax').parallax();
});