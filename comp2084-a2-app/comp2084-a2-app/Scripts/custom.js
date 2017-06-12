if ($('#default')) {
    hideAlert('MainContent_login_msg')
}

if ($('#register')) {
    hideAlert('MainContent_registration_msg')
}

if ($('#add-user')) {
    hideAlert('MainContent_add_user_msg')
}

if ($('#add-asset')) {
    hideAlert('MainContent_add_asset_msg')
}

if ($('#add-log')) {
    hideAlert('MainContent_add_log_msg')
}

// Hide form alerts unless populated
function hideAlert(id) {
    var text = $('#' + id).text();
    if (text.length <= 0)
        $('#' + id).hide()
}

// Delete confirmation for forms
$('.confirm').on('click', function () {
    return confirm('Delete this object?')
})