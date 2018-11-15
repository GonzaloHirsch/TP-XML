function hashCode(s, m) {
    for(var i = 0, h = 0; i < s.length; i++)
        h += s.charCodeAt(i);
    return (h % m) + 1;
}

window.onload = function () {
    var imgs = document.getElementsByName("badge-img");
    imgs.forEach(function (elem) {
        elem.src = "Resources/Badges/Badge_" + hashCode(elem.nextElementSibling.innerHTML, 9) + ".png";
    });
}
