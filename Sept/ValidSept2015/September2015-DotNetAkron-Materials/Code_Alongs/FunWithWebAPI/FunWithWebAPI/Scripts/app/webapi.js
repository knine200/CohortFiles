var uri = "/api/contacts/";

$(document).ready(function() {
    loadContacts();
});

function loadContacts() {
    $.getJSON(uri)
        .done(function(data) {
            $('#contacts tbody tr').remove();

            $.each(data, function(index, contact) {
                $(createRow(contact)).appendTo($('#contacts tbody'));
            });
        });
};

function createRow(contact) {
    return '<tr><td>' + contact.ContactId + '</td><td>' + contact.Name +
        '</td><td>' + contact.PhoneNumber + '</td></tr>';
}