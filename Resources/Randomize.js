window.onload = function () {
    var imgs = document.getElementsByName("badge-img");
    imgs.forEach(function (elem) {
        elem.src = "Resources/Badges/Badge_" + Math.floor((Math.random() * 9) + 1) + ".png";
    });
}
