#!/bin/bash
set -e
M=android/app/src/main/AndroidManifest.xml
sed -i -E 's/minSdkVersion = [0-9]+/minSdkVersion = 26/' android/variables.gradle
sed -i 's|<application|<uses-permission android:name="android.permission.CAMERA"/>\n    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>\n    <uses-permission android:name="android.permission.health.READ_HEALTH_DATA_HISTORY"/>\n    <application|' "$M"
