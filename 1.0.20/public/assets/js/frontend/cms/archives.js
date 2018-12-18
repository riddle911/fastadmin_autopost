define(['jquery', 'bootstrap', 'frontend', 'template', 'form'], function ($, undefined, Frontend, Template, Form) {
    var Controller = {
        my: function () {

        },
        post: function () {
            $(document).on('change', '#c-channel_id', function () {
                Fast.api.ajax({
                    url: 'cms.archives/get_channel_fields',
                    data: {channel_id: $(this).val(), archives_id: Config.archives_id}
                }, function (data) {
                    $("#extend").html(data.html);
                    Form.api.bindevent($("#extend"));
                    return false;
                });
                localStorage.setItem('last_channel_id', $(this).val());
            });
            Form.api.bindevent($("form[role=form]"), function (data, ret) {
                setTimeout(function () {
                    location.href = Fast.api.fixurl('cms.archives/my');
                }, 1500);
            });
            $("#c-channel_id").trigger("change");
        }
    };
    return Controller;
});