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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

//フォームの全角英数字をフォーカスアウトで半角英数字に変換
$(function(){
  $('[id*="postal_code"],[id*=phone_number],[id*=item_price]').change(function(){
    var str = $(this).val();
    str = str.replace( /[Ａ-Ｚａ-ｚ０-９－！”＃＄％＆’（）＝＜＞，．？＿［］｛｝＠＾～￥]/g, function(s) {
      return String.fromCharCode(s.charCodeAt(0) - 65248);
    });
    $(this).val(str);
  }).change();
});

//商品登録、編集画面に画像プレビューを表示
$(function(){
  $('#file').change(function(){
    var file = $(this).prop('files')[0];
    if(!file.type.match('image.*')){
      return;
    }
    var fileReader = new FileReader();
    fileReader.onloadend = function() {
      $('#result').html('<img src="' + fileReader.result + '" width="300" height="200">');
    }
    fileReader.readAsDataURL(file);
  });
});