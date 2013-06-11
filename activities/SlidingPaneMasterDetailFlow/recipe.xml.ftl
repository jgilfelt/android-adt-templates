<?xml version="1.0"?>
<recipe>
    <merge from="AndroidManifest.xml.ftl" />

    <merge from="res/values/strings.xml.ftl" />
    <copy from="res/menu/" />

    <instantiate from="res/layout/activity_content_main.xml.ftl"
                   to="res/layout/activity_main.xml" />
    <instantiate from="res/layout/fragment_content_detail.xml.ftl"
                   to="res/layout/fragment_${detail_name}.xml" />

    <instantiate from="src/app_package/ContentDetailFragment.java.ftl"
                   to="${srcOut}/${DetailName}Fragment.java" />
    <instantiate from="src/app_package/ContentMainActivity.java.ftl"
                   to="${srcOut}/MainActivity.java" />
    <instantiate from="src/app_package/ContentListFragment.java.ftl"
                   to="${srcOut}/${CollectionName}Fragment.java" />
    <instantiate from="src/app_package/dummy/DummyContent.java.ftl"
                   to="${srcOut}/dummy/DummyContent.java" />

    <open file="${srcOut}/MainActivity.java" />
</recipe>
