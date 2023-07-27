# alovoiceuz

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


android   1:851159425558:android:39b39ab609132957454b37
ios       1:851159425558:ios:27685fea2a402709454b37


<manifest xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:tools="http://schemas.android.com/tools"
package="com.technounitgroup.alovoiceuz">
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.USE_SIP" />
<uses-permission android:name="android.permission.CONFIGURE_SIP" />
<uses-feature
android:name="android.hardware.wifi"
android:required="false"/>
<uses-feature
android:name="android.hardware.microphone"
android:required="true"/>
<uses-feature
android:name="android.hardware.touchscreen"
android:required="false"/>
<uses-feature
android:name="android.hardware.bluetooth"
android:required="false"/>
<uses-feature
android:name="android.hardware.screen.portrait"
android:required="false"/>
<application
android:label="AloVoice"
android:name="org.abtollc.sdk.AbtoApplication"
android:icon="@mipmap/ic_launcher"
tools:ignore="MissingClass">
<activity
android:name=".MainActivity"
android:exported="true"
android:launchMode="singleTop"
android:theme="@style/LaunchTheme"
android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
android:hardwareAccelerated="true"
android:windowSoftInputMode="adjustResize">
<!-- Specifies an Android theme to apply to this Activity as soon as
     the Android process has started. This theme is visible to the user
     while the Flutter UI initializes. After that, this theme continues
     to determine the Window background behind the Flutter UI. -->
<meta-data
android:name="io.flutter.embedding.android.NormalTheme"
android:resource="@style/NormalTheme"
/>
<intent-filter>
<action android:name="android.intent.action.MAIN"/>
<category android:name="android.intent.category.LAUNCHER"/>
</intent-filter>
</activity>
<!-- Don't delete the meta-data below.
     This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
<meta-data
android:name="flutterEmbedding"
android:value="2" />
<service
android:name="org.abtollc.service.ABTOSipService"
android:exported="true"
tools:replace="android:exported"
android:stopWithTask="true">
<intent-filter>
<action android:name="org.abtollc.service.ABTOSipService" />
<action android:name="org.abtollc.service.SipConfiguration" />
</intent-filter>
</service>
<service
android:name=".IncomingCallService"
android:enabled="true">
</service>
<service
android:name=".java.MyFirebaseMessagingService"
android:exported="false">
<intent-filter>
<action android:name="com.google.firebase.MESSAGING_EVENT" />
</intent-filter>
</service>
</application>
</manifest>
#   F i r e b a s e D y n a m i c L i n k  
 