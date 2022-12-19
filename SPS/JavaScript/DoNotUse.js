        // Start check workshop
/*$(document).ready(function () {

    $('#ContentPlaceHolder1_NameTextBox').keyup(function () {
        var userName = $(this).val();

        if (userName.length >= 3) {
            $.ajax({
                url: '../../RegistrationService.asmx/UserNameExists',
                method: 'post',
                data: { userName: userName },
                dataType: 'json',
                success: function (data) {
                    var divElement = $('#ContentPlaceHolder1_NameLabel');
                    if (data.UserNameInUse) {
                        divElement.text(data.UserName + ' already in use');
                        divElement.css('color', 'red');
                    }
                    else {
                        //divElement.text(data.UserName + ' available')
                        //divElement.css('color', 'green');
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });
        }
    });
});*/
        //End check workshop
        //Start validation
$(document).ready(function () {

    $('form').validate({
        onsubmit: false,
        rules: {

            ctl00$ContentPlaceHolder1$NameTextBox: {

                required: true

            },

            lname: {

                required: true

            },

            email: {

                required: true,

                email: true

            },

            phone: {

                required: true,

                number: true

            },

            Address: {

                required: true

            }

        },

        messages: {

            ctl00$ContentPlaceHolder1$NameTextBox: {

                required: 'fname is required'

            }

        }

    });

    $('#btnSubmit').on('click', function () {
        return $("#form").valid();
    });

});
//End validation*/