// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  //表示設定
  $(".date-picker").datepicker({
    dateFormat: 'yy/mm/dd',
    showButtonPanel: true,
    // buttonImage: 'icon.jpg',
    buttonImageOnly: true,
    buttonText: "",
    showOn: "both",
    closeText: '閉じる',
    prevText: '前へ',
    nextText: '次へ',
    currentText: '今月',
    monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
    monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
    dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
    dayNamesShort: ['日曜','月曜','火曜','水曜','木曜','金曜','土曜'],
    dayNamesMin: ['日','月','火','水','木','金','土'],
    yearSuffix: '年',
    firstDay: 0
  });
});