/* Start Enter Only Numbers */
function OnlyNumbers(event) {
    var ikeycode = (event.which) ? event.which : event.keyCode
    if ((ikeycode < 48 || ikeycode > 57)) {
        return false;
    }
    else {
        return true;
    }
}
/* End Enter Only Numbers */

/* Start Enter Only Letters */
function OnlyLetters(event) {
    var ikeycode = (event.which) ? event.which : event.keyCode
    if (ikeycode < 65 || ikeycode > 90 && ikeycode < 97 || ikeycode > 122) {
        return false;
    }
    else {
        return true;
    }
}
/* End Enter Only Letters */

/* Start Enter Emaill */
function Email(event) {
    var ikeycode = (event.which) ? event.which : event.keyCode
    if (!(ikeycode == 46) && !(ikeycode > 47 && ikeycode < 58) && !(ikeycode == 64) && !(ikeycode > 64 && ikeycode < 91) && !(ikeycode == 95) && !(ikeycode > 96 && ikeycode < 123)) {
        return false;
    }
    else {
        return true;
    }
}
/* End Enter Email */

/* Start Match Years */
function OnlyNumbersAndSpecificSymbols(event) {
    var ikeycode = (event.which) ? event.which : event.keyCode
    if (!(ikeycode > 47 && ikeycode < 58) && !(ikeycode == 124) && !(ikeycode == 45) && !(ikeycode == 32)) {
        return false;
    }
    else {
        return true;
    }
}
/* End Match Years */

/* Start Deatails */
function Deatails(event) {
    var ikeycode = (event.which) ? event.which : event.keyCode
    if (!(ikeycode > 47 && ikeycode < 58) && !(ikeycode > 64 && ikeycode < 91) && !(ikeycode == 95) && !(ikeycode > 96 && ikeycode < 123) && !(ikeycode == 32) && !(ikeycode == 40) && !(ikeycode == 41) && !(ikeycode == 46) && !(ikeycode == 64) && !(ikeycode == 43) && !(ikeycode == 45) && !(ikeycode == 58) && !(ikeycode == 59) && !(ikeycode == 60) && !(ikeycode == 61) && !(ikeycode == 62) && !(ikeycode == 63) && !(ikeycode == 44) && !(ikeycode == 36)) {
        return false;
    }
    else {
        return true;
    }
}
/* End Deatails */
