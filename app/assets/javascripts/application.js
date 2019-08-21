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
//= require cocoon
//= require activestorage
//= require autocomplete-rails
//= require bootstrap-sprockets
//= require nested_form_fields
//= require_tree .

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
  $("#Mottomiru").click(function(){
    $("#rest-of-ranking").show();
    $("#Mottomiru").hide();
  });
});


//動的にフォーム追加チャレンジしたけど。。。gem使います
//$(function(){
//  var song_num = $('.js-product-song').length;
//  $(document).on('click', "#add_item_button", function(){
//    var input =
//    + '</tr>'
//    + '<tr class="js-product-song">'
//    + '<td><input type="text" name="product[songs_attributes][' + song_num + '][name]" id="product_song_attributes_' + song_num + '_name" ></td> '
//    + '<td><input type="text" name="product[songs_attributes][' + song_num + '][disk]" id="product_song_attributes_' + song_num + '_disk" ></td> '
//    + '<td><button type="button" id="song_delete">削除</button></td> '
//    + '</tr>'
//    $('.product_song_table').append(input);
//  });
//});
//$(function(){
//  $('#song_delete').on('click', function(){
//    $('#song_delete').remove();
//  });
//});
////////////////////////////////////////////////////////
