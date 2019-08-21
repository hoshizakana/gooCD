// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require activestorage
//= require autocomplete-rails

//= require bootstrap-sprockets
//= require nested_form_fields
//= require_tree .



        
// $(document).ready(function() {
//     $(function(){
//         $('.product-index').mouseover(function(){
//             $(this).addClass('changeColor');
//             var img = $(this).children('img');
//             console.log(img.attr('src'));
//             $('body').fadeIn(3000);
//                 $('body').css('background-image','url('+img.attr('src')+')');
//                 $('body').css('background-repeat','no-repeat');
//                 $('body').css('background-size' ,'100%');
//                 $('body').css('background-position', 'center');
                
//                 $('.opacity').addClass('opacity_add')
//                 // $('.opacity').css('height' ,'100%');
//                 // $('.opacity').css('background' ,'rgba(255,255,255,0.4)');
                
            


//         });
//         $('.product-index').mouseout(function(){
//             $(this).removeClass('changeColor');
//             $('body').css('background-image','none');
//             $('.opacity').removeClass('opacity_add')
//         });
//      });

// });
$(function(){
  $("#Mottomiru").click(function(){
    $("#rest-of-ranking").show();
    $("#Mottomiru").hide();
  });
});

//トップページスライドショー//////////////
$(document).ready(function () {
  $("#theTarget").skippr({
      // スライドショーの変化 ("fade" or "slide")
      transition : 'slide',
      // 変化に係る時間(ミリ秒)
      speed : 1000,
      // easingの種類
      easing : 'easeOutQuart',
      // ナビゲーションの形("block" or "bubble")
      navType : 'block',
      // 子要素の種類("div" or "img")
      childrenElementType : 'div',
      // ナビゲーション矢印の表示(trueで表示)
      arrows : true,
      // スライドショーの自動再生(falseで自動再生なし)
      autoPlay : true,
      // 自動再生時のスライド切替間隔(ミリ秒)
      autoPlayDuration : 3000,
      // キーボードの矢印キーによるスライド送りの設定(trueで有効)
      keyboardOnAlways : true,
      // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
      hidePrevious : false
  });
});

$(function(){
  $(".cart").mouseover(function(){
      $(".cart-mouseover").slideDown(600);
  });

  $('.cart').mouseout(function(){

    $(".cart-mouseover").slideUp(600);
    });
});


// $(function(){
//   $(".users").mouseover(function(){
//       $(".users-mouseover").slideDown(600);
//   });

//   $('.users').mouseout(function(){

//     $(".users-mouseover").slideUp(600);
//     });
// });

// $(function(){
//   $(".log-out").mouseover(function(){
//       $(".cart-mouseover").slideDown(600);
//   });

//   $('.log-out').mouseout(function(){

//     $(".cart-mouseover").slideUp(600);
//     });
// });
