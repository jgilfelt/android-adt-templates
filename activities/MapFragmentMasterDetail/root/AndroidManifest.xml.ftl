<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <application>
        <activity android:name=".${CollectionName}Activity"
            <#if isNewProject>
            android:label="@string/app_name"
            <#else>
            android:label="@string/title_${collection_name}"
            </#if>
            <#if buildApi gte 16 && parentActivityClass != "">android:parentActivityName="${parentActivityClass}"</#if>>
            <#if parentActivityClass != "">
            <meta-data android:name="android.support.PARENT_ACTIVITY"
                android:value="${parentActivityClass}" />
            </#if>
            <#if isLauncher>
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
            </#if>
        </activity>

        <activity android:name=".support.SupportMapActivity" />

        <uses-library android:name="com.google.android.maps" />
        
    </application>

</manifest>
