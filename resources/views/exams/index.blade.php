@extends('layouts.app')

@section('content')
<div id="main">

    <div id="content" class="full">
        <div class="post manage_forms">
            <div class="content_header">
                <div class="content_header_title">
                    <div style="float: left">
                        <h2>Exam Manager
                        </h2>
                        <p>Create, edit and manage your exams</p>
                    </div>
                    @hasrole('manager')
                    <div style="float: right;margin-right: 0px">
                        <a href="#" title="Create New Exam" id="button_create_exam" class="button_primary">
                            <i class="fas fa-plus"></i>Create New Exam
                        </a>
                    </div>
                    @endhasrole
                    <div style="clear: both; height: 1px"></div>
                </div>
            </div>


            <div class="content_body">
<!--                <div class="content_body_sidebar ">-->
<!--                    <div id="smart_folder_container">-->
<!--                        <ul id="smart_folder_list">-->
<!--                            <li class="smart_folder_header">Smart Folders <a title="Manage Folders"-->
<!--                                                                             class="manage_folders"-->
<!--                                                                             href="manage_folders.php"><span-->
<!--                                        class="icon-cog"></span></a><a id="pin_folders" title="Pin/Unpin Smart Folders"-->
<!--                                                                       class="manage_folders "-->
<!--                                                                       href="javascript:toggle_pin_folders()"><span-->
<!--                                        class="icon-pushpin"></span></a></li>-->
<!---->
<!--                            <li class="selected_folder"><a href="manage_forms.php?folder=1"><span-->
<!--                                        class="icon-folder"></span> All Forms</a></li>-->
<!--                            <li class="smart_folder_new"><a href="edit_folder.php" title="Create New Folder"><span-->
<!--                                        class="icon-folder-plus"></span> New Folder</a></li>-->
<!--                        </ul>-->
<!--                    </div>-->
<!--                </div>-->
                <div class="content_body_main ">


<!--                    <div id="mf_top_pane">-->
<!--                        <div id="mf_filters_toggle">-->
<!--                            <a id="mf_filters_toggle_button" href="#" title="Show/Hide Folders">-->
<!--                                <span class="icon-menu2"></span>-->
<!--                            </a>-->
<!--                        </div>-->
<!--                        <div id="mf_search_pane">-->
<!--                            <div id="mf_search_box" class="">-->
<!--                                <input name="filter_form_input" id="filter_form_input" type="text" class="text"-->
<!--                                       value="find form...">-->
<!--                                <div id="mf_search_title" class="mf_pane_selected"><a href="#">⇢ form title</a></div>-->
<!--                                <div id="mf_search_tag"><a href="#">form tags</a></div>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                        <div id="mf_sort_pane">-->
<!--                            <a id="mf_sort_pane_button" href="javascript:;" title="Sort Forms">-->
<!--                                <span class="icon-sort-amount-asc"></span>-->
<!--                            </a>-->
<!--                        </div>-->
<!--                        <template id="mf_sort_pane_content" style="display: none">-->
<!--                            <ul id="mf_sort_pane_list">-->
<!--                                <li class="sub_separator">Sort Ascending</li>-->
<!--                                <li><a id="sort_date_created_link" href="manage_forms.php?sortby=date_created-asc">Date-->
<!--                                        Created </a></li>-->
<!--                                <li><a id="sort_form_title_link" href="manage_forms.php?sortby=form_title-asc">Form-->
<!--                                        Title </a></li>-->
<!--                                <li><a id="sort_form_tag_link" href="manage_forms.php?sortby=form_tags-asc">Form-->
<!--                                        Tags </a></li>-->
<!--                                <li><a id="sort_today_entries_link" href="manage_forms.php?sortby=today_entries-asc">Today's-->
<!--                                        Entries </a></li>-->
<!--                                <li><a id="sort_total_entries_link" href="manage_forms.php?sortby=total_entries-asc">Total-->
<!--                                        Entries </a></li>-->
<!--                                <li class="sub_separator">Sort Descending</li>-->
<!--                                <li><a id="sort_date_created_link" href="manage_forms.php?sortby=date_created-desc">Date-->
<!--                                        Created <span class="icon-checkmark-circle" style="margin-left: 5px"></span></a>-->
<!--                                </li>-->
<!--                                <li><a id="sort_form_title_link" href="manage_forms.php?sortby=form_title-desc">Form-->
<!--                                        Title </a></li>-->
<!--                                <li><a id="sort_form_tag_link" href="manage_forms.php?sortby=form_tags-desc">Form-->
<!--                                        Tags </a></li>-->
<!--                                <li><a id="sort_today_entries_link" href="manage_forms.php?sortby=today_entries-desc">Today's-->
<!--                                        Entries </a></li>-->
<!--                                <li><a id="sort_total_entries_link" href="manage_forms.php?sortby=total_entries-desc">Total-->
<!--                                        Entries </a></li>-->
<!--                            </ul>-->
<!--                        </template>-->
<!--                    </div>-->
<!--                    <div id="filtered_result_box">-->
<!--                        <div style="float: left">Filtered Results for ⇢ <span class="highlight"></span></div>-->
<!--                        <div id="filtered_result_box_right">-->
<!--                            <ul>-->
<!--                                <li><a href="#" id="mf_filter_reset" title="Clear filter"><span-->
<!--                                            class="icon-cancel-circle"></span></a></li>-->
<!--                                <li id="filtered_result_total">Found 0 forms</li>-->
<!--                            </ul>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                    <div id="filtered_result_none">-->
<!--                        There are no forms in this folder-->
<!--                        <br><a href="manage_forms.php?folder=1" class="blue_dotted" style="font-size: 14px">view all-->
<!--                            forms</a>-->
<!--                    </div>-->
                    <ul id="mf_form_list" style="text-align: center;">
                        @if (count($exams) > 0)
                            @foreach($exams as $exam)
                                <li data-theme_id="26" id="liform_42152" class="form_visible">

                                <div class="middle_form_bar">
                                    <h3>MINI OFFLINE - App Test Only</h3>
                                    <div class="form_meta">


                                        <div class="form_actions">
                                            <a class="form_actions_toggle" data-formid="42152" id="form_action_42152"
                                               href="javascript:;"><span class="icon-cog"></span></a>
                                        </div>
                                        <div id="action_toggle_content_42152" style="display: none">
                                            <div class="form_action_item mf_link_delete"><a href="#"><span
                                                        class="icon-trash2"></span> Delete</a></div>

                                            <div class="form_action_item mf_link_duplicate"><a href="#"><span
                                                        class="icon-copy1"></span> Duplicate</a></div>

                                            <div class="form_action_item mf_link_disable">
                                                <a href="#"><span class="icon-pause-circle"></span> Disable</a></div>

                                            <div class="form_action_item"><a title="View Form Info"
                                                                             href="form_info.php?id=42152"><span
                                                        class="icon-file-charts"></span> Info</a></div>

                                            <div class="form_action_item mf_link_export"><a title="Export Form Template"
                                                                                            class="exportform"
                                                                                            id="exportform_42152"
                                                                                            href="#"><span
                                                        class="icon-exit-up"></span> Export</a></div>
                                        </div>

                                        <div class="form_tag">
                                            <ul class="form_tag_list">

                                                <li class="form_tag_list_icon">
                                                    <a title="Add a Tag Name" class="addtag" id="addtag_42152"
                                                       href="#"><span class="icon-tag"></span></a>
                                                </li>


                                            </ul>
                                        </div>
                                    </div>
                                    <div style="height: 0px; clear: both;"></div>
                                </div>
                                <div class="bottom_form_bar" style="display: block;">

                                    <div class="form_option">
                                        <a href="manage_entries.php?id=42152"><span class="icon-server"></span>Entries</a>
                                    </div>

                                    <div class="form_option">
                                        <a href="edit_form.php?id=42152"><span class="icon-pencil3"></span>Edit</a>
                                    </div>

                                    <div class="form_option_separator"></div>

                                    <div class="form_option option_expandable">
                                        <a class="mf_link_theme" href="#" title="Theme"><span
                                                class="icon-palette1"></span><span class="option_text">Theme</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a href="notification_settings.php?id=42152" title="Notifications"><span
                                                class="icon-envelope-open"></span><span
                                                class="option_text">Notifications</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a href="embed_code.php?id=42152" title="Code"><span
                                                class="icon-paste1"></span><span class="option_text">Code</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a href="payment_settings.php?id=42152" title="Payment"><span
                                                class="icon-cart1"></span><span class="option_text">Payment</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a href="logic_settings.php?id=42152" title="Logic"><span
                                                class="icon-arrows-split"></span><span class="option_text">Logic</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a href="integration_settings.php?id=42152" title="Integrations"><span
                                                class="icon-puzzle1"></span><span
                                                class="option_text">Integrations</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a href="manage_report.php?id=42152" title="Report"><span
                                                class="icon-chart-growth"></span><span class="option_text">Report</span></a>
                                    </div>

                                    <div class="form_option option_expandable">
                                        <a target="_blank" href="view.php?id=42152" title="View"><span
                                                class="icon-magnifier"></span><span class="option_text">View</span></a>
                                    </div>


                                </div>

                                <div style="height: 0px; clear: both;"></div>
                            </li>
                            @endforeach
                        @else
                            <span>No exam</span>
                        @endif
                    </ul>

<!--                    <div id="result_set_show_more">-->
<!--                        <a href="#">Show More Results...</a>-->
<!--                    </div>-->

                    <!-- start pagination -->


                    <!-- end pagination -->


                    <!-- start dialog boxes -->


                    <!-- end dialog boxes -->
                </div>
            </div> <!-- /end of content_body -->

        </div><!-- /.post -->
    </div><!-- /#content -->


    <div class="clear"></div>

</div>
@endsection
