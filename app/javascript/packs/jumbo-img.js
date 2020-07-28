console.log("THIS TEXT SHOULD BE VISIBLE IN CONSOLE")

var jumbotronBG = ['/jumbo-img0.jpg', '/jumbo-img1.jpg', '/jumbo-img2.jpg'];
var changeImage = $(".jumbotron");
var i = 0;


function cycleImage() {
  changeImage.css({'background-image': 'url(' + jumbotronBG[i] + ")"});
  i = i + 1;
  if (i == jumbotronBG.length) {
    i = 0;
    console.log("THIS TEXT SHOULD BE VISIBLE IN CONSOLE")
  }
}

setInterval(cycleImage, 1000);
cycleImage();
