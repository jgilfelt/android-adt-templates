<?xml version="1.0"?>
<recipe>
    <copy from="res/drawable-mdpi" />
    <copy from="res/drawable-hdpi" />
    <copy from="res/drawable-xhdpi" />

    <instantiate from="res/layout/list_item.xml.ftl"
                   to="res/layout/list_item_${objectKind?lower_case}.xml" />

    <instantiate from="src/app_package/Adapter.java.ftl"
                   to="${srcOut}/${objectKind}Adapter.java" />
    <instantiate from="src/app_package/dummy/DummyListContent.java.ftl"
                   to="${srcOut}/dummy/Dummy${objectKind}Content.java" />
</recipe>
