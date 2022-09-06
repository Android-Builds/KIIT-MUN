package com.kiit.mun

import android.os.Bundle
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import io.flutter.embedding.android.FlutterActivity
import android.app.Activity;

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
       val splashScreen = installSplashScreen()

       super.onCreate(savedInstanceState)
       //setContentView(R.layout.main_activity)
         
    }
}
