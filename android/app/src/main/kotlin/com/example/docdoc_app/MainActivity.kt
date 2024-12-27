
package com.example.docdoc_app

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
      override fun onCreate(savedInstanceState: Bundle?) {
            super.onCreate(savedInstanceState)
            GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
          }
}



