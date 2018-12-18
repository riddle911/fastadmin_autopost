define(['jquery', 'bootstrap', 'backend', 'table', 'form', 'template'], function ($, undefined, Backend, Table, Form, Template) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'cms/archives/index',
                    add_url: 'cms/archives/add',
                    edit_url: 'cms/archives/edit',
                    del_url: 'cms/archives/del',
                    multi_url: 'cms/archives/multi',
                    dragsort_url: '',
                    table: 'archives',
                }
            });

            var table = $("#table");

            //在表格内容渲染完成后回调的事件
            table.on('post-body.bs.table', function (e, settings, json, xhr) {
                //当为新选项卡中打开时
                if (Config.cms.archiveseditmode == 'addtabs') {
                    $(".btn-editone", this)
                        .off("click")
                        .removeClass("btn-editone")
                        .addClass("btn-addtabs")
                        .prop("title", __('Edit'));
                }
            });
            //当双击单元格时
            table.on('dbl-click-row.bs.table', function (e, row, element, field) {
                $(".btn-addtabs", element).trigger("click");
            });

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                searchFormVisible: Fast.api.query("model_id") ? true : false,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id'), sortable: true},
                        {
                            field: 'user_id',
                            title: __('User_id'),
                            visible: false,
                            addclass: 'selectpage',
                            extend: 'data-source="user/user/index" data-field="nickname"',
                            operate: '=',
                            formatter: Table.api.formatter.search
                        },
                        {
                            field: 'channel_id',
                            title: __('Channel_id'),
                            visible: false,
                            operate: false,
                            formatter: Table.api.formatter.search
                        },
                        {
                            field: 'channel.name',
                            title: __('Channel'),
                            operate: false,
                            formatter: function (value, row, index) {
                                return '<a href="javascript:;" class="searchit" data-field="channel_id" data-value="' + row.channel_id + '">' + value + '</a>';
                            }
                        },
                        {
                            field: 'model_id', title: __('Model'), visible: false, align: 'left', addclass:"selectpage", extend:"data-source='cms/modelx/index' data-field='name'"
                        },
                        {
                            field: 'title', title: __('Title'), align: 'left', formatter: function (value, row, index) {
                                return '<div class="tdtitle"><a href="' + row.url + '" target="_blank">' + value + '</a></div>' + Table.api.formatter.flag.call(this, row['flag'], row, index);
                            }
                        },
                        {field: 'image', title: __('Image'), operate: false, formatter: Table.api.formatter.image},
                        {field: 'views', title: __('Views'), operate: 'BETWEEN', sortable: true},
                        {field: 'comments', title: __('Comments'), operate: 'BETWEEN', sortable: true},
                        {field: 'weigh', title: __('Weigh'), operate: false},
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            visible: false,
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'updatetime',
                            title: __('Updatetime'),
                            sortable: true,
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {field: 'status', title: __('Status'), searchList: {"normal": __('Status normal'), "hidden": __('Status hidden'), "rejected": __('Status rejected'), "pulloff": __('Status pulloff')}, formatter: Table.api.formatter.status},
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            //当为新选项卡中打开时
            if (Config.cms.archiveseditmode == 'addtabs') {
                $(".btn-add").off("click").on("click", function () {
                    Fast.api.addtabs('cms/archives/add', __('Add'));
                    return false;
                });
            }

            $(document).on("click", "a.btn-channel", function () {
                $("#archivespanel").toggleClass("col-md-9", $("#channelbar").hasClass("hidden"));
                $("#channelbar").toggleClass("hidden");
            });

            require(['jstree'], function () {
                //全选和展开
                $(document).on("click", "#checkall", function () {
                    $("#channeltree").jstree($(this).prop("checked") ? "check_all" : "uncheck_all");
                });
                $(document).on("click", "#expandall", function () {
                    $("#channeltree").jstree($(this).prop("checked") ? "open_all" : "close_all");
                });
                $('#channeltree').on("changed.jstree", function (e, data) {
                    var options = table.bootstrapTable('getOptions');
                    options.pageNumber = 1;
                    options.queryParams = function (params) {
                        params.filter = JSON.stringify(data.selected.length > 0 ? {channel_id: data.selected.join(",")} : {});
                        params.op = JSON.stringify(data.selected.length > 0 ? {channel_id: 'in'} : {});
                        return params;
                    };
                    table.bootstrapTable('refresh', {});
                    return false;
                });
                $('#channeltree').jstree({
                    "themes": {
                        "stripes": true
                    },
                    "checkbox": {
                        "keep_selected_style": false,
                    },
                    "types": {
                        "channel": {
                            "icon": "fa fa-th",
                        },
                        "list": {
                            "icon": "fa fa-list",
                        },
                        "link": {
                            "icon": "fa fa-link",
                        },
                        "disabled": {
                            "check_node": false,
                            "uncheck_node": false
                        }
                    },
                    'plugins': ["types", "checkbox"],
                    "core": {
                        "multiple": true,
                        'check_callback': true,
                        "data": Config.channelList
                    }
                });
            });

            $(document).on('click', '.btn-move', function () {
                var ids = Table.api.selectedids(table);
                Layer.open({
                    title: __('Move'),
                    content: Template("channeltpl", {}),
                    btn: [__('Move')],
                    yes: function (index, layero) {
                        var channel_id = $("select[name='channel']", layero).val();
                        if (channel_id == 0) {
                            Toastr.error(__('Please select channel'));
                            return;
                        }
                        Fast.api.ajax({
                            url: "cms/archives/move/ids/" + ids.join(","),
                            type: "post",
                            data: {channel_id: channel_id},
                        }, function () {
                            table.bootstrapTable('refresh', {});
                            Layer.close(index);
                        });
                    },
                    success: function (layero, index) {
                    }
                });
            });
        },
        content: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'cms/archives/content/model_id/' + Config.model_id,
                    add_url: '',
                    edit_url: 'cms/archives/edit',
                    del_url: 'cms/archives/del',
                    multi_url: '',
                    table: '',
                }
            });

            var table = $("#table");
            //在表格内容渲染完成后回调的事件
            table.on('post-body.bs.table', function (e, settings, json, xhr) {
                $(".btn-editone", this)
                    .off("click")
                    .removeClass("btn-editone")
                    .addClass("btn-addtabs")
                    .prop("title", __('Edit'));
            });
            //默认字段
            var columns = [
                {checkbox: true},
                //这里因为涉及到关联多个表,因为用了两个字段来操作,一个隐藏,一个搜索
                {field: 'main.id', title: __('Id'), visible: false},
                {field: 'id', title: __('Id'), operate: false},
                {
                    field: 'channel_id',
                    title: __('Channel_id'),
                    addclass: 'selectpage',
                    extend: 'data-source="cms/channel/index"',
                    formatter: Table.api.formatter.search
                },
                {field: 'channel_name', title: __('Channel_name'), operate: false}
            ];
            //动态追加字段
            $.each(Config.fields, function (i, j) {
                var data = {field: j.field, title: j.title, operate: 'like'};
                //如果是图片,加上formatter
                if (j.type == 'image') {
                    data.formatter = Table.api.formatter.image;
                } else if (j.type == 'images') {
                    data.formatter = Table.api.formatter.images;
                } else if (j.type == 'radio' || j.type == 'check' || j.type == 'select' || j.type == 'selects') {
                    data.formatter = Controller.api.formatter.content;
                    data.extend = j.content;
                }
                columns.push(data);
            });
            //追加操作字段
            columns.push({
                field: 'operate',
                title: __('Operate'),
                table: table,
                events: Table.api.events.operate,
                formatter: Table.api.formatter.operate
            });

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: columns
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        diyform: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'cms/archives/diyform/diyform_id/' + Config.diyform_id,
                    add_url: '',
                    edit_url: 'cms/archives/edit',
                    del_url: 'cms/archives/del',
                    multi_url: '',
                    table: '',
                }
            });

            var table = $("#table");
            //在表格内容渲染完成后回调的事件
            table.on('post-body.bs.table', function (e, settings, json, xhr) {
                $(".btn-editone", this)
                    .off("click")
                    .removeClass("btn-editone")
                    .addClass("btn-addtabs")
                    .prop("title", __('Edit'));
            });
            //默认字段
            var columns = [
                {checkbox: true},
                {field: 'id', title: __('Id'), operate: false},
            ];
            //动态追加字段
            $.each(Config.fields, function (i, j) {
                var data = {field: j.field, title: j.title, operate: 'like'};
                //如果是图片,加上formatter
                if (j.type == 'image') {
                    data.formatter = Table.api.formatter.image;
                } else if (j.type == 'images') {
                    data.formatter = Table.api.formatter.images;
                } else if (j.type == 'radio' || j.type == 'check' || j.type == 'select' || j.type == 'selects') {
                    data.formatter = Controller.api.formatter.content;
                    data.extend = j.content;
                }
                columns.push(data);
            });
            //追加操作字段
            columns.push({
                field: 'operate',
                title: __('Operate'),
                table: table,
                events: Table.api.events.operate,
                formatter: Table.api.formatter.operate
            });

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: columns
            })
            ;

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    'dragsort_url': ''
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'cms/archives/recyclebin',
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'title', title: __('Title'), align: 'left'},
                        {field: 'image', title: __('Image'), operate: false, formatter: Table.api.formatter.image},
                        {
                            field: 'deletetime',
                            title: __('Deletetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            width: '130px',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'Restore',
                                    text: __('Restore'),
                                    classname: 'btn btn-xs btn-info btn-restoreit',
                                    icon: 'fa fa-rotate-left',
                                    url: 'cms/archives/restore'
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'cms/archives/destroy'
                                }
                            ],
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            $(document).on('click', '.btn-destroyall', function () {
                var that = this;
                Layer.confirm(__('Are you sure you want to truncate?'), function () {
                    Fast.api.ajax($(that).attr("href"), function () {
                        Layer.closeAll();
                        table.bootstrapTable('refresh');
                    }, function () {
                        Layer.closeAll();
                    });
                });
                return false;
            });
            $(document).on('click', '.btn-restoreall,.btn-restoreit,.btn-destroyit', function () {
                Fast.api.ajax($(this).attr("href"), function () {
                    table.bootstrapTable('refresh');
                });
                return false;
            });
        },
        add: function () {
            $(document).on('change', '#c-channel_id', function () {
                Fast.api.ajax({
                    url: 'cms/archives/get_channel_fields',
                    data: {channel_id: $(this).val()}
                }, function (data) {
                    $("#extend").html(data.html);
                    Form.api.bindevent($("#extend"));
                    return false;
                });
                localStorage.setItem('last_channel_id', $(this).val());
            });
            var last_channel_id = localStorage.getItem('last_channel_id');
            if (last_channel_id) {
                $("#c-channel_id option[value='" + last_channel_id + "']").prop("selected", true);
            }
            $("#c-channel_id").trigger("change");
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
            Fast.api.ajax({
                url: 'cms/archives/get_channel_fields',
                data: {channel_id: $("#c-channel_id").val(), archives_id: $("#archive-id").val()}
            }, function (data) {
                $("#extend").html(data.html);
                Form.api.bindevent($("#extend"));
                return false;
            });
        },
        api: {
            formatter: {
                content: function (value, row, index) {
                    var extend = this.extend;
                    if (!value) {
                        return '';
                    }
                    var valueArr = value.toString().split(/,/);
                    var result = [];
                    $.each(valueArr, function (i, j) {
                        result.push(typeof extend[j] !== 'undefined' ? extend[j] : j);
                    });
                    return result.join(',');
                }
            },
            bindevent: function () {
                $.validator.config({
                    rules: {
                        diyname: function (element) {
                            if (element.value.toString().match(/^\d+$/)) {
                                return __('Can not be digital');
                            }
                            return $.ajax({
                                url: 'cms/archives/check_element_available',
                                type: 'POST',
                                data: {id: $("#archive-id").val(), name: element.name, value: element.value},
                                dataType: 'json'
                            });
                        }
                    }
                });
                Form.api.bindevent($("form[role=form]"), function () {
                    if (Config.cms.archiveseditmode == 'addtabs') {
                        var obj = top.window.$("ul.nav-addtabs li.active");
                        top.window.Toastr.success(__('Operation completed'));
                        top.window.$(".sidebar-menu a[url$='/cms/archives'][addtabs]").click();
                        top.window.$(".sidebar-menu a[url$='/cms/archives'][addtabs]").dblclick();
                        obj.find(".fa-remove").trigger("click");
                    }
                });
            }
        }
    };
    return Controller;
});