import 'package:flutter/material.dart';

import '../../theme/iqra_colors.dart';

/// مؤشر صوتي بصري (Waveform) يظهر أثناء استماع/تحدث المساعد — عنصر غير
/// نصي يوضح للمستخدم أن التطبيق "نشط"، وفق مكوّن Voice-Feedback Visuals.
///
/// في مرحلة الأساس هذه الرسوم متحركة فقط ولا ترتبط بمصدر صوت حقيقي بعد
/// (سيُربط بـ [TtsService] لاحقاً).
class VoiceWaveform extends StatefulWidget {
  const VoiceWaveform({
    super.key,
    this.isActive = true,
    this.barCount = 5,
    this.height = 48,
    this.color = IqraColors.voicePulseStart,
  });

  final bool isActive;
  final int barCount;
  final double height;
  final Color color;

  @override
  State<VoiceWaveform> createState() => _VoiceWaveformState();
}

class _VoiceWaveformState extends State<VoiceWaveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return SizedBox(
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.barCount, (index) {
              final phase = (_controller.value + (index / widget.barCount)) % 1.0;
              final scale = widget.isActive
                  ? 0.3 + 0.7 * (0.5 - (phase - 0.5).abs()) * 2
                  : 0.15;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Container(
                  width: 6,
                  height: widget.height * scale.clamp(0.15, 1.0),
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
