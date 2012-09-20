<menu xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@+id/menu_settings"
        android:title="@string/menu_settings"
        android:orderInCategory="100"<#if buildApi gte 11>
        android:showAsAction="never"</#if> />
</menu>
