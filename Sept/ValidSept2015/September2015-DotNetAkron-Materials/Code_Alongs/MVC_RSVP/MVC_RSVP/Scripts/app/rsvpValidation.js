$(document).ready(function() {
    $('#rsvpForm').validate({
        rules: {
            Name: {
                required: true
            },
            Email: {
                required: true,
                email: true
            },
            Phone: {
                required: true
            },
            FavoriteGame: {
                required: true,
                minlength: 3
            },
            WillAttend: {
                required: true
            }
        },
        messages: {
            Name: "Enter your Name",
            FavoriteGame: {
                minlength: $.validator.format("I dont know of any games with less than {0} characters!")
            }
        }
    });
});