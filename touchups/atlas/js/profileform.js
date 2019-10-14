//Once the document is ready
$(function() {
    // jQuery plugin to prevent double submission of forms
    jQuery.fn.preventDoubleSubmission = function() {
        $(this).bind('submit', function(e) {

            if ($(this).data('submitted') === true) {
                // Previously submitted - don't submit again
                e.preventDefault();
            } else {
                // Mark this so that the next submit can be ignored
                $(this).data('submitted', true);
            }
        });
        // Keep chainability
        return $(this);
    };
    $('form').preventDoubleSubmission();
});

function submitForm() {
    document.getElementById("newProfileMulti").submit();
}

function checkUserName()
{
    fetch( `/atlas/userReg/ajax/userNameExists?userName=${document.querySelector('#user\\.username').value}`, {
        method: 'POST',
    })
    .then( response => response.text())
    .then( data => document.querySelector('#userNameExists').innerHTML ='<span id="userNameExists">' + data + '</span>' );
}

function checkEmail()
{
    fetch( `/atlas/userReg/ajax/emailExists?email=${document.querySelector('#email\\.email').value}`, {
        method: 'POST',
    })
    .then( response => response.text())
    .then( data => document.querySelector('#emailExists').innerHTML ='<span id="emailExists">' + data + '</span>' );
}

function validateFields( fields )
{
    let isOK = true;
    let errorMsg = "";
    fields.forEach( element => {
        let el = document.getElementById( element.id );
        if( !el || !el.value )
        {
            errorMsg += element.msg + "\n";
            isOK = false;
        }
    });
    if( errorMsg)
        alert( errorMsg );
    return isOK;
}

function validateListField( fields )
{
    let isOK = true;
    let errorMsg = "";
    fields.forEach( element => {
        let el = document.getElementById( element.id );
        if( !el || el.selectedIndex === "0")
        {
            errorMsg += element.msg + "\n";
            isOK = false;
        }
    });
    if( errorMsg)
        alert( errorMsg );
    return isOK;
}

function validate1() {
    return validateFields( [
        { id: 'email.email',   msg: 'Email must have a value'},
    ]);
}

function validate2() {
    return validateFields([
        { id: 'person.firstName',   msg: 'First Name must have a value'},
        { id: 'person.lastName',    msg: 'Last Name must have a value'},
        { id: 'person.birthYear',   msg: 'Please select a Birth Year.'},
        { id: 'user.username',      msg: 'User Name must have a value'},
        { id: 'user.password',      msg: 'Password must have a value'},
        { id: 'user.confirmPassword',   msg: 'Comfirm Password must have a value'}
    ]);
}

function validate3() {
    let isOK = validateFields([
        { id: 'lifter.experienceLifting',   msg: 'Lifter Experience must have a value'},
        { id: 'lifter.federationCode',    msg: 'Please select a Federation.'},
        { id: 'person.weight',   msg: 'Lifter Weight must have a value'},
        { id: 'person.height',      msg: 'Lifter Height must have a value'},
        { id: 'lifter.bio',      msg: 'Lifter Bio must have a value'},
        { id: 'user.password',      msg: 'Password must have a value'},
        { id: 'user.password',      msg: 'Password must have a value'},
        { id: 'user.password',      msg: 'Password must have a value'},
        { id: 'user.password',      msg: 'Password must have a value'},
        { id: 'user.password',      msg: 'Password must have a value'},
    ])
    if( !isOK ) return false;

    isOK = validateListField([
        { id: 'person.heightUnitsCode',      msg: 'Please select a Lifter Height Units Code.'},
        { id: 'person.weightUnitsCode',      msg: 'Please select a Lifter Weight Units Code.'},
        { id: 'person.nationality',      msg: 'Please select a Country.'},
    ]);
    if( !isOK ) return false;

    if( document.getElementById("pictureExtList[0].pictureFile").files.length === 0 ){
        alert('Please Select one primary picture for your Profile');
        return false;
    }

    if( !document.getElementById('tosCheckbox').checked )
    {
        alert( 'Please agree to the terms and conditions')
        return false;
    }

    if (!document.getElementById("tosCheckbox").checked) {
        alert('Please confirm the Photo Agreement');
        return false;
    }    
    return true;
}