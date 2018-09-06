package com.swarmnyc.emergencynavigationlights;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    Window window = getWindow();
    WindowManager.LayoutParams layoutParams = window.getAttributes();
    layoutParams.screenBrightness = screenBrightnessValue / 255f;
    window.setAttributes(layoutParams);

    GeneratedPluginRegistrant.registerWith(this);
  }
}
