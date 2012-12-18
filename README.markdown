ADT Templates
=============

A small collection of ADT templates for Android development to help quickly scaffold common Activity and UI patterns.

Read more about ADT templates and their format here: https://plus.google.com/113735310430199015092/posts/XTKTamk4As8 

To use these templates you will need Eclipse and ADT version ~~20~~ 21 or above. Copy the appropriate folders into `<android-sdk-folder>/tools/templates/` and they will appear in the project explorer context menu under: 

**New > Other... > Android > Android Object**

ADT 21 is currently in beta. Developers can install it via the preview channel: http://tools.android.com/preview-channel

![templates](http://jeffgilfelt.com/img/templates.png "templates")

Note that ADT templates do not manage external dependencies for you (outside of the official support library). For the Sherlock templates you should ensure your projects include the ActionBarSherlock library dependency and the application theme inherits from a Theme.Sherlock.* base before using them.

EfficientListAdapter
====================

This template creates an efficient list adapter using the view holder pattern, a sample list item layout and an optional alphabetic section indexer.

MapFragmentMasterDetail
=======================

![template](http://jeffgilfelt.com/img/map_template2.png "template")

This template creates an API 4+ compatible map based master/detail activity using a LocalActivityManager hack to enable MapView within a support fragment. Ensure that your project builds against a Google APIs platform version before using this template.

ParcelableType
==============

This template creates a new class implementing Parcelable (including the required static CREATOR object boilerplate) for temporal high-performance IPC serialization and transport.

SherlockBlankActivity
=====================

This template is an API 7+ ActionBarSherlock compatible version of the official BlankActivity template. It creates a new blank activity, with optional inner navigation (list, tabs, swipe tabs or pager strip).

SherlockMasterDetailFlow
========================

This template is an API 7+ ActionBarSherlock compatible version of the official MasterDetailFlow template. It creates a new master/detail flow, which is two columns on tablets, and one column on smaller screens. This creates a master fragment, detail fragment, and two activities.

TVLeftNavBarActivity
====================

![template](http://jeffgilfelt.com/img/tv_template.png "template")

This template creates a new blank activity with a left navigation/action bar implementation optimized for Google TV. You can select different visual behaviors (expanded, collapsed, or expand on focus) and navigation modes (standard, tabs or list). This template has a dependency on the Google TV LeftNavBarLibrary project which is available [here](http://code.google.com/p/googletv-android-samples/).



Credits
-------

Author: Jeff Gilfelt

License
-------

    Copyright 2012 readyState Software Limited

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
