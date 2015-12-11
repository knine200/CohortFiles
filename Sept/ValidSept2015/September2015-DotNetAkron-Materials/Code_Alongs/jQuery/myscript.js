$(document).ready(function () {
    $('#btnjson').click(function(event) {
        copyJSONData();
    });

    $('#btnSelector').click(function(event) {
        highlightBlue();
    });
});

var copyJSONData = function() {
    // get our JSON input
    var text = $('#jsonIN').val();

    // parse it to a JavaScript object
    var obj = JSON.parse(text);

    // create some HTML to display
    var htmlOutput = "<ul><h2>Movie</h2><li>" + obj.title +
        "</li><li>" + obj.year + "</li><li>" + obj.rating + "</li></ul>";

    // write the HTML to the result div
    $('#jsonOUT').html(htmlOutput);
};

var highlightBlue = function() {
    // remove any instance of my highlight
    $('.blue').removeClass('blue');

    // find all the elements I asked for in the selectorInput
    var selectors = $('#selectorInput').val();

    // add my css class to all those elements
    $(selectors).addClass('blue');
}