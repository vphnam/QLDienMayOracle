$('input[name="paymentMethod"]').off('click').on('click', function () {
    if ($(this).val() == 'NL') {
        $('#nganLuongContent').show();
    }
    else if ($(this).val() == 'ATM_ONLINE') {
        $('#bankContent').show();
    }
    else {
        $('#nganLuongContent').hide();
        $('#bankContent').hide();
    }
});