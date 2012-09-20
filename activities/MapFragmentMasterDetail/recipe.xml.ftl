<?xml version="1.0"?>
<recipe>
    <merge from="AndroidManifest.xml.ftl" />

    <merge from="res/values-land/refs.xml.ftl" />
    <merge from="res/values/strings.xml.ftl" />

    <instantiate from="res/layout/activity_content.xml.ftl"
                   to="res/layout/activity_${objectKind?lower_case}.xml" />
    <instantiate from="res/layout/activity_content_landscape.xml.ftl"
                   to="res/layout/activity_${objectKind?lower_case}_landscape.xml" />
    <instantiate from="res/layout/fragment_content_detail.xml.ftl"
                   to="res/layout/fragment_${detail_name}.xml" />
    
    <instantiate from="res/layout/fragment_map.xml.ftl"
                   to="res/layout/fragment_map.xml" />
    <instantiate from="res/layout/support_map_fragment.xml.ftl"
                   to="res/layout/support_map_fragment.xml" />

    <instantiate from="src/app_package/ContentItemizedOverlay.java.ftl"
                   to="${srcOut}/${objectKind}ItemizedOverlay.java" />
    <instantiate from="src/app_package/ContentDetailFragment.java.ftl"
                   to="${srcOut}/${DetailName}Fragment.java" />
    <instantiate from="src/app_package/ContentMapActivity.java.ftl"
                   to="${srcOut}/${CollectionName}Activity.java" />
    <instantiate from="src/app_package/ContentMapFragment.java.ftl"
                   to="${srcOut}/${CollectionName}Fragment.java" />
    <instantiate from="src/app_package/dummy/DummyGeoContent.java.ftl"
                   to="${srcOut}/dummy/DummyGeoContent.java" />
                   
    <instantiate from="src/app_package/support/LocalActivityManagerFragment.java.ftl"
            to="${srcOut}/support/LocalActivityManagerFragment.java" />
    <instantiate from="src/app_package/support/SupportMapActivity.java.ftl"
            to="${srcOut}/support/SupportMapActivity.java" />
    <instantiate from="src/app_package/support/SupportMapFragment.java.ftl"
            to="${srcOut}/support/SupportMapFragment.java" />
            
    <copy from="res/drawable-xhdpi" />          
                   
</recipe>
