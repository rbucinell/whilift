
document.addEventListener("DOMContentLoaded", function () {

    const ACCEPTED = "cookie_terms_accepted";
    const DISMISSED = "cookie_warning_dismissed";

    const getCookie = (cookiename) =>
    {
        let  cookiestring = RegExp(cookiename+"=[^;]+").exec(document.cookie);
        return decodeURIComponent(!!cookiestring ? cookiestring.toString().replace(/^[^=]+./,"") : "");
    }

    const evaluateDialog = () => {
        let accpetedValue  = getCookie(ACCEPTED);
        let dismissedValue = getCookie(DISMISSED);    
        let cookiePolicyDialog = document.querySelector('.cookie-policy');    
        if( accpetedValue || dismissedValue ) cookiePolicyDialog.classList.add('collapse');
    }

    document.querySelector('.cookie-policy .btn').addEventListener('click', event => {
        document.cookie = `${ACCEPTED}=true`;
        document.cookie = `${DISMISSED}=true`;
        evaluateDialog();
    });

    evaluateDialog();    
});
