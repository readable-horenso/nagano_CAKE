const opt = {
  autoplay: {
    delay: 3000, // スライド切り替えの間隔をミリ秒で指定
    disableOnInteraction: false, // ユーザーの操作後も自動再生を続ける
  },
  loop: true,
  pagination: {
    el: '.swiper-pagination',
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
};

$(document).on('turbolinks:load', function() {
  let swiper = new Swiper('.swiper', opt);
});
