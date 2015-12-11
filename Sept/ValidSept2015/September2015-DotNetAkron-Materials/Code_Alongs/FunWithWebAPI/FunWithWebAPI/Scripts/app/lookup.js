$(document).ready(function() {
    $('#search').click(function() {
        var uri = '/api/contacts/';

        var id = $('#contactId').val();

        $.getJSON(uri + id)
            .done(function(data) {
                $('#contact').text(data.Name + ' - ' + data.PhoneNumber);
            })
            .fail(function(jqXhr, status, err) {
                $('#contact').text('Error: ' + err);
            });
    });
});