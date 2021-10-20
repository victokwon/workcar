$(document).ready(function () {
   $(".star_report_ing").on("click", function () {
      $(".main_box_star1").css({ "display": "flex" });
      $(".main_box_star2").css({ "display": "none" });
   })
   $(".star_report_ed").on("click", function () {
      $(".main_box_star2").css({ "display": "flex" });
      $(".main_box_star1").css({ "display": "none" });
   })
})
ratings = { RatingScore: 4.5 }
totalRating = 5; table = document.querySelector('.RatingStar'); function rateIt() { for (rating in ratings) { ratingPercentage = ratings[rating] / totalRating * 100; ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%'; star = table.querySelector(`.${rating} .inner-star`); numberRating = table.querySelector(`.${rating} .numberRating`); star.style.width = ratingRounded; numberRating.innerText = ratings[rating]; } } rateIt()
