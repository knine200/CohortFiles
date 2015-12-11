var manipulate = function() {
    var divs = document.getElementsByTagName("p");
    var pa = document.getElementById("id");
    var ya = document.getElementById("no");
    var ha = document.getElementById("kos");
    var par = document.createElement("p");
    ha.appendChild(par);

    for (var i = 0; i < divs.length; i++) {
        //do something to each div like
        var x = divs[i].innerHTML = "My name is Kooshin";
        var y = pa.style.color = "yellow";
        var z = ya.style.fontSize = "xx-large";

    }
}
manipulate();