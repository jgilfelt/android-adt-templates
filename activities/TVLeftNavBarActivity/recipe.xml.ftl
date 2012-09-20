<?xml version="1.0"?>
<recipe>
    <merge from="AndroidManifest.xml.ftl" />

    <instantiate from="res/menu/main.xml.ftl"
            to="res/menu/${menuName}.xml" />

    <merge from="res/values/strings.xml.ftl" />
    
    <copy from="res/drawable" />
    <copy from="res/drawable-hdpi" />

    <instantiate from="res/layout/activity.xml.ftl"
                     to="res/layout/${layoutName}.xml" />

    <instantiate from="src/app_package/Activity.java.ftl"
                       to="${srcOut}/${activityClass}.java" />

    <open file="res/layout/${layoutName}.xml" />
</recipe>
