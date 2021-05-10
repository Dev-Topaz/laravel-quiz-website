@extends('layouts.quiz')

@section('content')
    <div id="main" class="quiz">
        <h2>{{ $exam->name }}</h2>

        <nav data-role="ribbonmenu">
            <ul class="tabs-holder">
                <li id="section_home_form"><a href="#section_Home_FormView">Home</a></li>
                <li id="section_home_slide" style="display: none;"><a href="#section_Home_SlideView">Home</a></li>
                <li id="section_insert" style="display: none;"><a href="#section_Insert">Insert</a></li>
                <li id="section_design" style="display: none;"><a href="#section_Design">Design</a></li>
                <li id="section_animation" style="display: none;"><a href="#section_Animation">Animation</a></li>
                <li id="section_help"><a href="#section_Help">Help</a></li>
            </ul>
            <div class="content-holder">
                <div class="section" id="section_main">
                    <div class="group">
                        <button class="ribbon-button"><span class="icon"><span class="mif-share"></span></span><span
                                class="caption">Share</span></button>
                        <button class="ribbon-button"><span class="icon"><span class="mif-envelop"></span></span><span
                                class="caption">Email</span></button>
                        <div>
                            <button class="ribbon-button dropdown-toggle">
                    <span class="icon">
                      <span class="mif-file-zip fg-cyan"></span>
                    </span>
                                <span class="caption">Compress</span>
                            </button>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">

                            </ul>
                        </div>
                        <div class="group-divider"></div>
                        <div class="pl-1 pr-1 d-flex flex-column">
                            <button class="ribbon-tool-button">
                                <span class="mif-location"></span>
                            </button>
                            <div>
                                <button class="ribbon-tool-button dropdown-toggle">
                                    <span class="mif-alarm fg-red"></span>
                                </button>
                                <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">

                                </ul>
                            </div>
                        </div>
                        <div class="group-divider"></div>
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <span class="mif-cogs"></span>
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Options</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">

                            </ul>
                        </div>
                        <div class="group-divider"></div>
                        <div class="d-flex flex-column">
                            <button class="ribbon-icon-button" disabled>
                    <span class="icon">
                      <span class="mif-apple"></span>
                    </span>
                                <span class="caption">Apple</span>
                            </button>
                            <div>
                                <button class="ribbon-icon-button dropdown-toggle">
                      <span class="icon">
                        <span class="mif-apps"></span>
                      </span>
                                    <span class="caption">Apps</span>
                                </button>
                                <ul class="ribbon-dropdown" data-role="dropdown">

                                </ul>
                            </div>
                        </div>
                        <div class="ribbon-toggle-group">
                            <button class="ribbon-icon-button" disabled>
                    <span class="icon">
                      <span class="mif-list"></span>
                    </span>
                                <span class="caption">List</span>
                            </button>
                            <button class="ribbon-icon-button disabled">
                    <span class="icon">
                      <span class="mif-apps"></span>
                    </span>
                                <span class="caption">Content</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <span class="mif-table"></span>
                    </span>
                                <span class="caption">Icons</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <span class="mif-image"></span>
                    </span>
                                <span class="caption">Small icons</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <span class="mif-images"></span>
                    </span>
                                <span class="caption">Large icons</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <span class="mif-windows"></span>
                    </span>
                                <span class="caption">Tiles</span>
                            </button>
                        </div>
                        <span class="title">ribbon controls</span>
                    </div>
                </div>
                <div class="section" id="section_Help">
                    <div class="group">
                        <div data-role="button-group" data-cls-active="active">
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-1.png") }}">
                    </span>
                                <span class="caption">Tutorials</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-2.png") }}">
                    </span>
                                <span class="caption">Help</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-3.png") }}">
                    </span>
                                <span class="caption">Community</span>
                            </button>
                        </div>
                        <span class="title">Help</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div data-role="button-group" data-cls-active="active">
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-4.png") }}">
                    </span>
                                <span class="caption">About</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-5.png") }}">
                    </span>
                                <span class="caption">Feedback</span>
                            </button>
                        </div>
                        <span class="title">About</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div data-role="button-group" data-cls-active="active">
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-6.png") }}">
                    </span>
                                <span class="caption">Updates</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-7.png") }}">
                    </span>
                                <span class="caption">Ask a question</span>
                            </button>
                        </div>
                        <span class="title">Support</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div data-role="button-group" data-cls-active="active">
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/help-8.png") }}">
                    </span>
                                <span class="caption">Log in</span>
                            </button>
                        </div>
                        <span class="title">iSpring Space</span>
                        <div class="group-divider" style="margin-left: 17px;"></div>
                    </div>
                    <div class="group">
                    </div>
                </div>
                <div class="section" id="section_Design">
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/design-1.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Themes</span>
                            <div id="design_themes_panel_holder" class="ribbon-dropdaown" data-role="dropdown"
                                 data-duration="100">
                                <div>
                                    <div class="design_themes_panels_divider">This Quiz</div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels_divider">Office</div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels_divider">Built In</div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                    <div class="design_themes_panels"><span>Aa</span></div>
                                </div>
                            </div>
                        </div>
                        <span class="title">Themes</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div data-role="button-group" data-cls-active="active">
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/design-2.png") }}">
                    </span>
                                <span class="caption">Format <br> Background</span>
                            </button>
                        </div>
                        <span class="title">Settings</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/design-3.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Preview</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <li class="design_preview_submenu"
                                    style="background-image: url({{ url("/images/ribbon_ imgs/design-pre-1.png") }});">
                                    Preview
                                    Slide
                                </li>
                                <li class="design_preview_submenu">Preview Group</li>
                                <li class="design_preview_submenu">Preview Quiz</li>
                            </ul>
                        </div>
                        <span class="title">Publish</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                    </div>
                </div>
                <div class="section" id="section_Animation">
                    <div class="group">
                        <div data-role="button-group" data-cls-active="active">
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/ani-1.png") }}">
                    </span>
                                <span class="caption">None</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/ani-2.png") }}">
                    </span>
                                <span class="caption">Appear</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/ani-3.png") }}">
                    </span>
                                <span class="caption">Fade</span>
                            </button>
                            <button class="ribbon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/ani-4.png") }}">
                    </span>
                                <span class="caption">Float in</span>
                            </button>
                        </div>
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/ani-5.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Options</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">

                            </ul>
                        </div>
                        <span class="title">Answer animation</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group"
                         style="display: flex; flex-wrap: wrap; flex: 0 0 130px; justify-content: flex-start;">
                        <div
                            style="display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between;">
                            <label style="font-size: 12px;" for="duration">Duration:</label>
                            <input style="font-size: 12px;width: 60px;outline: none;" type="number" name="duration"
                                   id="duration"
                                   value="01.00" step="0.01">
                            <label style="font-size: 12px;" for="duration">Delay:</label>
                            <input style="font-size: 12px;width: 60px;outline: none;" type="number" name="delay"
                                   id="delay"
                                   value="00.00" step="0.01">
                        </div>
                        <span class="title">Timing</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <button class="ribbon-button">
                  <span class="icon">
                    <img src="{{ url("/images/ribbon_imgs/ani-6.png") }}">
                  </span>
                            <span class="caption">Play Animation</span>
                        </button>
                        <span class="title"></span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                    </div>
                </div>
                <div class="section" id="section_Insert">
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-1.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Question</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <div id="quiz_types_panel">
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_01.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_01.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_02.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_02.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_03.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_03.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_04.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_04.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_05.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_05.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_06.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_06.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_07.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_07.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_08.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_08.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_09.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_09.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_10.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_10.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_11.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_11.png") }}">
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <button class="ribbon-button">
                  <span class="icon">
                    <img src="{{ url("/images/ribbon_imgs/insert-2.png") }}">
                  </span>
                            <span class="caption">Info Slide</span>
                        </button>
                        <span class="title">Slides</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <button class="ribbon-button">
                  <span class="icon">
                    <img src="{{ url("/images/ribbon_imgs/insert-3.png") }}">
                  </span>
                            <span class="caption">Picture</span>
                        </button>
                        <span class="title">Images</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-4.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Shape</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <div id="insert_shape_panel">
                                    Shapes
                                    <div>
                                        <div><img class="shape_icon"
                                                  src="{{ url("/images/ribbon_imgs/shapes/Untitled-1_03.png") }}"></div>
                                        <div><img class="shape_icon"
                                                  src="{{ url("/images/ribbon_imgs/shapes/Untitled-1_04.png") }}"></div>
                                        <div><img class="shape_icon"
                                                  src="{{ url("/images/ribbon_imgs/shapes/Untitled-1_05.png") }}"></div>
                                        <div><img class="shape_icon"
                                                  src="{{ url("/images/ribbon_imgs/shapes/Untitled-1_06.png") }}"></div>
                                        <div><img class="shape_icon"
                                                  src="{{ url("/images/ribbon_imgs/shapes/Untitled-1_08.png") }}"></div>
                                        <div><img class="shape_icon"
                                                  src="{{ url("/images/ribbon_imgs/shapes/Untitled-1_09.png") }}"></div>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <span class="title">Illustrations</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <button class="ribbon-button">
                  <span class="icon">
                    <img src="{{ url("/images/ribbon_imgs/insert-5.png") }}">
                  </span>
                            <span class="caption">TextBox</span>
                        </button>
                        <div style="display: flex; flex-direction: column;">
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-6.png") }}">
                    </span>
                                <span class="caption">Hyperlink</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-7.png") }}">
                    </span>
                                <span class="caption">Equation</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-8.png") }}">
                    </span>
                                <span class="caption">Symbol</span>
                            </button>
                        </div>
                        <span class="title">Text</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <button class="ribbon-button">
                  <span class="icon">
                    <img src="{{ url("/images/ribbon_imgs/insert-9.png") }}">
                  </span>
                            <span class="caption">Video</span>
                        </button>
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-10.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Audio</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100"
                                style="width: 150px; text-align: left;">
                                <li class="insert_audio"
                                    style="background-image: url({{ url("/images/ribbon_imgs/insert/audio-1.png") }});">
                                    From
                                    File...
                                </li>
                                <li class="insert_audio"
                                    style="background-image: url({{ url("/images/ribbon_imgs/insert/audio-2.png") }}); border-bottom: 1px dotted gainsboro;">
                                    Record Mic...
                                </li>
                                <li class="insert_audio"
                                    style="background-image: url({{ url("/images/ribbon_imgs/insert/audio-3.png") }});">
                                    Microphone Settings
                                </li>
                            </ul>
                        </div>
                        <span class="title">Media</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/insert-11.png") }}">
                    </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Preview</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <li class="design_preview_submenu"
                                    style="background-image: url({{ url("/images/ribbon_ imgs/design-pre-1.png") }});">
                                    Preview
                                    Slide
                                </li>
                                <li class="design_preview_submenu" disabled>Preview Group</li>
                                <li class="design_preview_submenu">Preview Quiz</li>
                            </ul>
                        </div>
                        <span class="title">Publish</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                    </div>
                </div>
                <div class="section" id="section_Home_SlideView">
                    <div class="group" style="flex: 0 0 170px;">
                        <button class="ribbon-button">
                  <span class="icon">
                    <img src="{{ url("/images/ribbon_imgs/home-1.png") }}">
                  </span>
                            <span class="caption">Paste</span>
                        </button>
                        <div style="display: flex; flex-direction: column;">
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/home-2.png") }}">
                    </span>
                                <span class="caption">Cut</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/home-3.png") }}">
                    </span>
                                <span class="caption">Copy</span>
                            </button>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/home-4.png") }}">
                    </span>
                                <span class="caption">Format Painter</span>
                            </button>
                        </div>
                        <span class="title">Clipboard</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div style="display: flex;flex-direction: column;">
                            <div class="ribbon-split-button" style="display: flex; flex-direction: column;">
                                <button class="ribbon-icon-button">
                      <span class="icon">
                        <img src="{{ url("/images/ribbon_imgs/home-5.png") }}" style="width: 100%; height: 100%;">
                      </span>
                                    <span class="caption dropdown-toggle" style="margin-top: 0; margin-left: 3px;">Layout</span>
                                </button>
                                <div class="ribbon-dropdown" data-role="dropdown" data-duration="100"
                                     style="position: absolute; width: 600px;">
                                    <div style="display: flex;flex-wrap: wrap;">
                                        <div class="layout_panel_divider">Default</div>
                                        <div class="layout_panel_img_holder"><img
                                                src="{{ url("/images/ribbon_imgs/images/layout_ver_01.png") }}"></div>
                                        <div class="layout_panel_divider">Horizontal</div>
                                        <div class="layout_panel_img_holder"><img
                                                src="{{ url("/images/ribbon_imgs/images/layout_hor_03.png") }}"></div>
                                        <div class="layout_panel_img_holder"><img
                                                src="{{ url("/images/ribbon_imgs/images/layout_hor_04.png") }}"></div>
                                    </div>
                                </div>
                            </div>
                            <button class="ribbon-icon-button">
                    <span class="icon">
                      <img src="{{ url("/images/ribbon_imgs/home-6.png") }}">
                    </span>
                                <span class="caption">Reset</span>
                            </button>
                            <div class="ribbon-split-button" style="display: flex; flex-direction: column;">

                                <button class="ribbon-icon-button" disabled>
                      <span class="icon">
                        <img src="{{ url("/images/ribbon_imgs/home-7.png") }}" style="width: 100%; height: 100%;">
                      </span>
                                    <span class="caption dropdown-toggle" style="margin-left: 5px; margin-top: 0;">Columns</span>
                                </button>
                                <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                </ul>
                            </div>
                        </div>
                        <span class="title">Layout</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group" style="flex: 0 0 273px; flex-wrap: wrap;">
                        <div style="display: flex; align-items: center;">
                            <select style="font-size: 12px; outline: none; width: 131px; height: 25px;">
                                <option value="">Core i3 (hp)</option>
                                <option value="">Pentium (hp)</option>
                                <option value="">Smart Core i3 (hp)</option>
                                <option value="">Mini</option>
                                <option value="">Site</option>
                                <option value="">Portal</option>
                                <option value="">eVPS-TEST (30 дней)</option>
                                <option value="" selected="selected">Open Sans Semibold</option>
                                <option value="">eVPS-2</option>
                            </select>
                            <select style="font-size: 12px; outline: none; height: 25px; margin-right: 7px;">
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="10">10</option>
                                <option value="12">12</option>
                                <option value="14">14</option>
                                <option value="16" selected="selected">16</option>
                                <option value="18">18</option>
                            </select>
                            <div data-role="">
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-8.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-9.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-10.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                            </div>
                        </div>
                        <div style="display: flex;">
                            <div data-role="buttongroup" data-mode="multi" data-cls-active="bg-grey fg-white">
                                <button class="button"
                                        style="background-image: url('{{ url('/images/ribbon_imgs/home/bold.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                            "></button>
                                <button class=" button"
                                        style="background-image: url('{{ url('/images/ribbon_imgs/home/ital.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                            "></button>
                                <button class=" button"
                                        style="background-image: url('{{ url('/images/ribbon_imgs/home/under.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                            "></button>
                            </div>
                        </div>
                        <div style=" display: flex; margin-left: 10px;">
                            <div data-role=" buttongroup" style="margin-left: 11px; ">
                                <button class="button"
                                        style="background-image: url('{{ url('/images/ribbon_imgs/home/sub.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                            "></button>
                                <button class=" button"
                                        style="background-image: url('{{ url('/images/ribbon_imgs/home/sup.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                            "></button>
                            </div>
                        </div>
                        <span class=" title">Font</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group" style="flex: 0 0 200px;">
                        <div>
                            <style>
                                .group button.button {
                                    width: 25px;
                                    height: 25px;
                                }
                            </style>
                            <div data-role="">
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-11.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-12.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-13.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-14.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                            </div>
                            <div data-role="">
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-15.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-16.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-17.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                                <button class="button"
                                        style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-18.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                            </div>
                        </div>
                        <div class="dropdown-button">
                            <button class="button dropdown-toggle"
                                    style="margin-left: 10px; width: 44px; margin-top: 3px; height: 23px; background-image: url({{ url("/images/ribbon_ imgs/home-19.png") }}); background-repeat: no-repeat; background-position-y: center; background-position-x: 5px;"></button>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100"
                                style="transform: translate(10px, -10px);">
                                <li><a>1,0</a></li>
                                <li><a>1,15</a></li>
                                <li><a>1,5</a></li>
                                <li><a>2,0</a></li>
                                <li><a>Spacing Options</a></li>
                                <li class="list_divider"></li>
                                <li><a>Add Space Before Paragraph</a></li>
                                <li><a>Add Space After Paragraph</a></li>
                            </ul>
                        </div>
                        <span class="title">Paragraph</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-20.png") }}">
                            </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Arrange</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">

                            </ul>
                        </div>
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-21.png") }}">
                            </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Quick Styles</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">

                            </ul>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-22.png") }}">
                            </span>
                                <span class="caption dropdown-toggle">Shape Fill</span>
                            </button>
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-23.png") }}">
                            </span>
                                <span class="caption dropdown-toggle">Shape Outline</span>
                            </button>
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-24.png") }}">
                            </span>
                                <span class="caption dropdown-toggle">Shape Effects</span>
                            </button>
                        </div>
                        <span class="title">Drawing</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <button class="ribbon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-25.png") }}">
                          </span>
                            <span class="caption">Properties</span>
                        </button>
                        <button class="ribbon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-26.png") }}">
                          </span>
                            <span class="caption">Player</span>
                        </button>
                        <span class="title">Quiz</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-27.png") }}">
                            </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Preview</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <li class="design_preview_submenu"
                                    style="background-image: url({{ url("/images/ribbon_ imgs/design-pre-1.png") }});">
                                    Preview
                                    Slide
                                </li>
                                <li class="design_preview_submenu">Preview Group</li>
                                <li class="design_preview_submenu">Preview Quiz</li>
                            </ul>
                        </div>
                        <button class="ribbon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-28.png") }}">
                          </span>
                            <span class="caption">Publish</span>
                        </button>
                        <span class="title">Publish</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                    </div>
                </div>
                <div class="section" id="section_Home_FormView">
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/insert-1.png") }}">
                          </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Question</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <div id="quiz_types_panel_2">
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_01.png") }}"
                                             onclick="create_quiz(1, {{$exam->id}})">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_01.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_02.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_02.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_03.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_03.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_04.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_04.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_05.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_05.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_06.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_06.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_07.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_07.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_08.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_08.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_09.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_09.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_10.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_10.png") }}">
                                    </div>
                                    <div>
                                        <img class="quiz_types" src="{{ url("/images/ribbon_imgs/slices/1_11.png") }}">
                                        <img class="tooltip_pic" src="{{ url("/images/ribbon_imgs/tip_11.png") }}">
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <div style="display: flex;flex-direction: column;">
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/insert-2.png") }}">
                          </span>
                                <span class="caption">Info Slide</span>
                            </button>
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home/qgroup.png") }}">
                          </span>
                                <span class="caption">Question Group</span>
                            </button>
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home/intro.png") }}">
                          </span>
                                <span class="caption dropdown-toggle">Introduction</span>
                                <div class="ribbon-dropdown" data-role="dropdown" data-duration="100"
                                     style="position: absolute; width: 500px;;">
                                    <div style="display: flex;">
                                        <div style="background-color: rgb(71, 114, 255);">
                                            <img class="introduction_slide"
                                                 src="{{ url("/images/ribbon_imgs/home/introduc.png") }}">
                                        </div>
                                    </div>
                                </div>
                            </button>
                        </div>
                        <span class="title">Insert</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div style="display: flex;flex-direction: column;">
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home/dupli.png") }}">
                          </span>
                                <span class="caption">Duplicate</span>
                            </button>
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home/link.png") }}">
                          </span>
                                <span class="caption dropdown-toggle">Link</span>
                                <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                    <li class="form_view_home_link"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/images/Untitled-1_03.png") }});">
                                        To
                                        Slide Above
                                    </li>
                                    <li class="form_view_home_link"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/images/Untitled-1_05.png") }}); border-bottom: 1px dotted grey;">
                                        To
                                        Slide Below
                                    </li>
                                    <li class="form_view_home_link"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/images/Untitled-1_06.png") }});">
                                        To
                                        Top of Group
                                    </li>
                                    <li class="form_view_home_link"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/images/Untitled-1_07.png") }}); border-bottom: 1px dotted grey;">
                                        To
                                        Bottom of Group
                                    </li>
                                    <li class="form_view_home_link"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/images/Untitled-1.png") }});"
                                        disabled>Unlink
                                    </li>
                                </ul>
                            </button>
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home/importq.png") }}">
                          </span>
                                <span class="caption ">Import Questions</span>
                            </button>
                        </div>
                        <span class="title">Slide</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div style="display: flex;flex-direction: column;">
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-2.png") }}">
                          </span>
                                <span class="caption">Cut</span>
                            </button>
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-3.png") }}">
                          </span>
                                <span class="caption">Copy</span>
                            </button>
                            <button class="ribbon-icon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-1.png") }}">
                          </span>
                                <span class="caption ">Paste</span>
                            </button>
                        </div>
                        <span class="title">Clipboard</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group" style="display: flex; flex-wrap: wrap; flex: 0 0 180px;">
                        <div data-role="">
                            <button class="button"
                                    style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-11.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                            <button class="button"
                                    style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-12.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                            <button class="button"
                                    style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-13.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                            <button class="button"
                                    style="padding: 7px;height: 25px; background-image: url('{{ url('/images/ribbon_imgs/home-14.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;"></button>
                        </div>
                        <div data-role="buttongroup" data-mode="multi" data-cls-active="bg-grey fg-white">
                            <button class="button"
                                    style="background-image: url('{{ url('/images/ribbon_imgs/home/bold.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                        "></button>
                            <button class=" button"
                                    style="background-image: url('{{ url('/images/ribbon_imgs/home/ital.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                        "></button>
                            <button class=" button"
                                    style="background-image: url('{{ url('/images/ribbon_imgs/home/under.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                        "></button>
                        </div>
                        <div data-role=" buttongroup" style="margin-left: 11px; ">
                            <button class="button"
                                    style="background-image: url('{{ url('/images/ribbon_imgs/home/sub.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                        "></button>
                            <button class=" button"
                                    style="background-image: url('{{ url('/images/ribbon_imgs/home/sup.png') }}'); background-repeat: no-repeat; background-position-x: center;background-position-y: center;
                                        "></button>
                        </div>
                        <span class=" title">Text</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div style="display: flex; flex-direction: column;">
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/insert-6.png") }}">
                            </span>
                                <span class="caption">Hyperlink</span>
                            </button>
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/insert-7.png") }}">
                            </span>
                                <span class="caption">Equation</span>
                            </button>
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/insert-8.png") }}">
                            </span>
                                <span class="caption">Symbol</span>
                            </button>
                        </div>
                        <div style="display: flex; flex-direction: column;">
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/insert-3.png") }}">
                            </span>
                                <span class="caption">Picture</span>
                            </button>
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/insert-9.png") }}">
                            </span>
                                <span class="caption">Video</span>
                            </button>
                            <button class="ribbon-icon-button">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/insert-10.png") }}">
                            </span>
                                <span class="caption dropdown-toggle">Audio</span>
                                <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100"
                                    style="width: 150px; text-align: left;">
                                    <li class="insert_audio"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/insert/audio-1.png") }});">
                                        From
                                        File...
                                    </li>
                                    <li class="insert_audio"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/insert/audio-2.png") }}); border-bottom: 1px dotted gainsboro;">
                                        Record Mic...
                                    </li>
                                    <li class="insert_audio"
                                        style="background-image: url({{ url("/images/ribbon_ imgs/insert/audio-3.png") }});">
                                        Microphone
                                        Settings
                                    </li>
                                </ul>
                            </button>
                        </div>
                        <span class="title">Insert</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <button class="ribbon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-25.png") }}">
                          </span>
                            <span class="caption">Properties</span>
                        </button>
                        <button class="ribbon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-26.png") }}">
                          </span>
                            <span class="caption">Player</span>
                        </button>
                        <span class="title">Quiz</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                        <div class="ribbon-split-button">
                            <button class="ribbon-main">
                            <span class="icon">
                              <img src="{{ url("/images/ribbon_imgs/home-27.png") }}">
                            </span>
                            </button>
                            <span class="ribbon-split dropdown-toggle">Preview</span>
                            <ul class="ribbon-dropdown" data-role="dropdown" data-duration="100">
                                <li class="design_preview_submenu"
                                    style="background-image: url({{ url("/images/ribbon_imgs/design-pre-1.png") }});">
                                    Preview
                                    Slide
                                </li>
                                <li class="design_preview_submenu">Preview Group</li>
                                <li class="design_preview_submenu">Preview Quiz</li>
                            </ul>
                        </div>
                        <button class="ribbon-button">
                          <span class="icon">
                            <img src="{{ url("/images/ribbon_imgs/home-28.png") }}">
                          </span>
                            <span class="caption">Publish</span>
                        </button>
                        <span class="title">Publish</span>
                        <div class="group-divider"></div>
                    </div>
                    <div class="group">
                    </div>
                </div>
            </div>
        </nav>

        <div class="window-content p-2">


            <div id="content" class="full">
                <div class="post manage_forms">
                    <div class="content_header">
                        <div class="content_header_title">
                            <div style="float: left">
                                <p>{{ $exam->description }}</p>
                                <p>Attempt Number: {{ $exam->attempt_number }}, Passing
                                    Score: {{ $exam->passing_score }}</p>
                            </div>
                            <div style="clear: both; height: 1px"></div>
                        </div>
                    </div>

                    <div class="content_body">
                        <div class="row">
                            <div class="cell-3">
                                <div style="display: flex;">
                                    <div id="form_view_btn" class="view_switch_btn clicked form_view"
                                         style="background-image: url('{{ url('/images/ribbon_imgs/form_view.png') }}');">Form View
                                    </div>
                                    <div id="slide_view_btn" class="view_switch_btn slide_view"
                                         style="background-image: url('{{ url('/images/ribbon_imgs/slide_show.png') }}');">Slide View
                                    </div>
                                </div>
                                <div class="content_body_main " style="overflow-y: scroll;height: 650px;">
                                    <ul data-role="listview" data-view="content" id="quiz_list"
                                        data-on-node-click="onNodeClick">
                                        <li data-caption="Question Group">
                                            <ul>
                                                @foreach($exam->quizes as $quiz)
                                                    <li id="{{ $quiz->id }}"
                                                        data-caption="{{ substr(strip_tags($quiz->question), 0,  29) }}{{ strlen(strip_tags($quiz->question)) < 30 ? '' : '...' }}"
                                                        data-content="<i>{{ $quiz->Quiz_type->name }}</i>"></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <form method="POST" action="#" class="create_form"
                                      id="quiz_form">
                            <div class="cell-9" id="quiz_form" style="padding: 0;"></div>
                            <div class="cell-9" id="quiz_slide" style="padding: 0;"></div>
                            </form>
                        </div>
                    </div>

                </div><!-- /.post -->
            </div><!-- /#content -->
        </div>
        <script>
            function onNodeClick(node) {
                const quizId = node.attr('id');
                {{--$.get("{{ url('/quizes') }}/" + quizId + "/edit", function (data, status) {--}}
                {{--    $('#quiz_form').html(data);--}}
                {{--});--}}
                $.get("{{ url('/quizes_form_view') }}/" + quizId + "/edit", function (data, status) {
                    $('#quiz_form').html(data);
                });
                $.get("{{ url('/quizes_slide_view') }}/" + quizId + "/edit", function (data, status) {
                    $('#quiz_slide').html(data);
                });
            }

            function create_quiz(quiz_type, exam_id) {

                let quizId;
                const lv = Metro.getPlugin('#quiz_list', 'listview');
                const node = $('#quiz_list ul li:last-child');

                switch (quiz_type) {
                    case(1):
                        lv.insertAfter(node, {
                            caption: 'Select the correct answer option:',
                            content: '<i>Multiple Choice<i>'
                        });
                        $('#quiz_list').find('.current').removeClass('current current-select');
                        node.next().addClass('current current-select');
                        node.next().attr('id', quizId);

                        $.post("{{ url('/quizes') }}", {
                                '_token': "{{ csrf_token() }}",
                                'type_id': quiz_type,
                                'exam_id': exam_id,
                                'question': 'Select the correct answer option:',
                                'answer': '1',
                                'feedback_correct': 'That\'s right! You answered correctly.',
                                'feedback_incorrect': 'You did not choose the correct response.',
                                'feedback_try_again': 'Try again.',
                                'is_feedback': true,
                                'answer_content_array': 'Option 1;Option 2;Option 3;',
                                'choice_id_array': '1;2;3;'
                            },
                            function (data, status) {
                                quizId = data;
                                node.next().attr('id', quizId);
                            }).catch((XHttpResponse) => {
                            console.log(XHttpResponse);
                        });
                        break;

                    case(2):
                        lv.insertAfter(node, {
                            caption: 'Select the correct answer option:',
                            content: '<i>Multiple Choice<i>'
                        });
                        $('#quiz_list').find('.current').removeClass('current current-select');
                        node.next().addClass('current current-select');
                        node.next().attr('id', quizId);

                        $.post("{{ url('/quizes') }}", {
                                '_token': "{{ csrf_token() }}",
                                'type_id': quiz_type,
                                'exam_id': exam_id,
                                'question': 'Select one or more correct answers:',
                                'answer': '1',
                                'feedback_correct': 'That\'s right! You answered correctly.',
                                'feedback_incorrect': 'You did not choose the correct response.',
                                'feedback_try_again': 'Try again.',
                                'is_feedback': true,
                                'answer_content_array': 'Option 1;Option 2;Option 3;',
                                'response_id_array': '1;2;3;'
                            },
                            function (data, status) {
                                quizId = data;
                                node.next().attr('id', quizId);
                            }).catch((XHttpResponse) => {
                            console.log(XHttpResponse);
                        });
                        break;

                    default:
                }

                $.get("{{ url('/quizes') }}/" + quiz_type + "/exam/" + exam_id, function (data, status) {
                    $('#quiz_form').html(data);
                });

            }

            var userSelection = document.getElementsByClassName('quiz_types');
            for (var i = 0; i < userSelection.length; i++) {
                (function (index) {
                    userSelection[index].addEventListener("mousemove", function () {
                        console.log("Clicked index: " + index);
                        if ($('.tooltip_pic').eq(index).css("display") == 'block') return;
                        for (let j = 0; j < 22; j++) {
                            if (j == index) $('.tooltip_pic').eq(j).fadeIn();
                            else $('.tooltip_pic').eq(j).fadeOut();
                        }
                    })
                })(i);
            }


            $('#form_view_btn').click(function () {
                $('#quiz_form').show();
                $('#quiz_slide').hide();

                if ($(this).hasClass('clicked')) return;

                $(this).toggleClass('clicked');
                $('#slide_view_btn').toggleClass('clicked');

                $("#section_home_form").addClass('active');

                $("#section_Home_SlideView").removeClass('active');
                $("#section_Insert").removeClass('active');
                $("#section_Design").removeClass('active');
                $("#section_Animation").removeClass('active');
                $("#section_Help").removeClass('active');
                $("#section_Home_FormView").addClass('active');

                $("#section_home_slide").hide();
                $("#section_home_form").show();
                $("#section_insert").hide();
                $("#section_design").hide();
                $("#section_animation").hide();
                $("#section_help").show();


            });

            $('#slide_view_btn').click(function () {
                $('#quiz_form').hide();
                $('#quiz_slide').show();

                if ($(this).hasClass('clicked')) return;

                $(this).toggleClass('clicked');
                $('#form_view_btn').toggleClass('clicked');//for main branch comment


                $("#section_home_slide").addClass('active');

                $("#section_Home_FormView").removeClass('active');
                $("#section_Insert").removeClass('active');
                $("#section_Design").removeClass('active');
                $("#section_Animation").removeClass('active');
                $("#section_Help").removeClass('active');

                $("#section_Home_SlideView").addClass('active');

                $("#section_home_slide").show();
                $("#section_home_form").hide();
                $("#section_insert").show();
                $("#section_design").show();
                $("#section_animation").show();
                $("#section_help").hide();
            });
        </script>
@endsection
