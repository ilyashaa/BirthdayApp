package com.example.birthday_app;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import com.yandex.mapkit.MapKitFactory;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    MapKitFactory.setLocale("ru_RU"); // Your preferred language. Not required, defaults to system language
    MapKitFactory.setApiKey("8669d0f0-eb5b-4544-aa5f-259ceb3d47f5"); // Your generated API key
    super.configureFlutterEngine(flutterEngine);
  }
}