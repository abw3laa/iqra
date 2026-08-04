package com.abw3laa.iqra

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * نشاط Flutter الرئيسي. يسجّل قنوات التواصل (Method Channels) مع طبقة
 * Kotlin الأصلية، لكن **دون منطق تنفيذي فعلي بعد** — هذه المرحلة (Foundation)
 * تقتصر على تجهيز الجسر البرمجي فقط.
 *
 * القنوات مطابقة للثوابت المعرَّفة في `lib/core/constants/app_constants.dart`:
 * - [OVERLAY_CHANNEL] لخدمة الزر العائم.
 * - [SCREEN_CAPTURE_CHANNEL] لخدمة التقاط الشاشة (MediaProjection).
 *
 * في المرحلة القادمة، سيُستبدل `notImplemented()` بمنطق حقيقي يستدعي
 * `OverlayForegroundService` و`ScreenCaptureForegroundService` (لم تُنشآ بعد).
 */
class MainActivity : FlutterActivity() {

    companion object {
        private const val OVERLAY_CHANNEL = "com.abw3laa.iqra/overlay"
        private const val SCREEN_CAPTURE_CHANNEL = "com.abw3laa.iqra/screen_capture"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, OVERLAY_CHANNEL)
            .setMethodCallHandler { call, result ->
                // TODO(Phase 2): تنفيذ hasPermission / requestPermission / show / hide
                // عبر ربط حقيقي بـ Settings.canDrawOverlays() وWindowManager.
                result.notImplemented()
            }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            SCREEN_CAPTURE_CHANNEL,
        ).setMethodCallHandler { call, result ->
            // TODO(Phase 2): تنفيذ requestCapturePermission / captureRegion / stopCapture
            // عبر ربط حقيقي بـ MediaProjectionManager وForeground Service من نوع
            // mediaProjection (إلزامي على Android 14+).
            result.notImplemented()
        }
    }
}
