// heder

//ページ内リンクスムーススクロール
$('a[href^="#"]').on('click', function () {
  var href = $(this).attr("href");
  var target = $(href == "#" || href == "" ? 'html' : href);
  var position = target.offset().top;
  $("html, body").animate({scrollTop: position}, 1000, "swing");
  return false;
});
