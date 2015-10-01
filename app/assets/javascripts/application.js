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
//= require_tree .

//build the dropdown category list from the categories API endpoint
$(document).ready(function(){
    $.getJSON( "http://www.hashrobot.com/api/categories", function( data ) {
        for (var i = 0; i < data.length; i++) {
            var categoryName = data[i].name;
            var shortCategoryName = categoryName.split(" ")[0];
            $('#dropdown1').append("<li><a href='#' id='" + shortCategoryName +"'>" + categoryName + "</a></li>");
        }

        //each click function below displays the hashtags for it's appropriate category
        //if there are no hashtags found at the API endpoint, it returns a default hashtag

        $("#Animals").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/1", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#animals</div>")
                }
            });
            Materialize.toast('Category: Animals', 6000)
        });


        $("#Beauty").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/2", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#beauty</div>")
                }
            });
            Materialize.toast('Category: Beauty &amp; Style', 6000)
        });

        $("#Business").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/3", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#business</div>")
                }
            });
            Materialize.toast('Category: Business &amp; Finance', 6000)
        });

        $("#Computers").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/4", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#computers</div>")
                }
            });
            Materialize.toast('Category: Computers &amp; Internet', 6000)
        });

        $("#Consumer").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/5", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#electronics</div>")
                }
            });
            Materialize.toast('Category: Consumer Electronics', 6000)
        });

        $("#Education").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/6", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#education</div>")
                }
            });
            Materialize.toast('Category: Education', 6000)
        });

        $("#Entertainment").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/7", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#entertainment</div>")
                }
            });
            Materialize.toast('Category: Entertainment & Recreation', 6000)
        });

        $("#Environment").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/8", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#environment</div>")
                }
            });
            Materialize.toast('Category: Environment', 6000)
        });

        $("#Food").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/9", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#food</div>")
                }
            });
            Materialize.toast('Category: Food &amp; Drink', 6000)
        });

        $("#Gardening").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/10", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#gardening</div>")
                }
            });
            Materialize.toast('Category: Gardening', 6000)
        });

        $("#Health").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/11", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#health</div>")
                }
            });
            Materialize.toast('Category: Health &amp; Medicine', 6000)
        });

        $("#Home").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/12", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#home</div>")
                }
            });
            Materialize.toast('Category: Home', 6000)
        });

        $("#Humanities").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/13", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#humanities</div>")
                }
            });
            Materialize.toast('Category: Humanities', 6000)
        });

        $("#Science").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/14", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#science</div>")
                }
            });
            Materialize.toast('Category: Science &amp; Mathematics', 6000)
        });

        $("#Society").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/15", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#society</div>")
                }
            });
            Materialize.toast('Category: Society', 6000)
        });

        $("#Travel").click(function () {
            $.getJSON( "http://www.hashrobot.com/api/categories/16", function( data ) {
                $('.tag-results').html("");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var hashtag = data[i].name;
                        $('.tag-results').append("<span class='card animated bounceInDown'>" + hashtag + "</span>")
                    }
                } else {
                    $('.tag-results').append("<div class='card animated bounceInDown'>#travel</div>")
                }
            });
            Materialize.toast('Category: Travel', 6000)
        });
    });

    $('.parallax').parallax();
});
