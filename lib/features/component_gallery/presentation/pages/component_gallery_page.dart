import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/theme/iqra_typography.dart';
import '../../../../core/widgets/widgets.dart';

/// شاشة تطويرية داخلية (غير مخصصة للمستخدم النهائي) تعرض كل مكوّنات نظام
/// التصميم في مكان واحد لمراجعتها بصرياً بسرعة، ومطابقتها مع تصدير Stitch.
/// يمكن الوصول إليها عبر المسار `/dev/component-gallery` مباشرة.
class ComponentGalleryPage extends StatefulWidget {
  const ComponentGalleryPage({super.key});

  @override
  State<ComponentGalleryPage> createState() => _ComponentGalleryPageState();
}

class _ComponentGalleryPageState extends State<ComponentGalleryPage> {
  bool _toggleValue = true;
  bool _chipSelected = true;

  @override
  Widget build(BuildContext context) {
    final typography = IqraTypography.of(context);

    return Scaffold(
      backgroundColor: IqraColors.background,
      appBar: const IqraAppBar(title: 'معرض المكوّنات'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(IqraSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle('Typography', typography),
            Text('display-reading 48/60', style: typography.displayReading),
            Text('headline-lg 32/40', style: typography.headlineLarge),
            Text(
              'headline-lg-mobile 28/36',
              style: typography.headlineLargeMobile,
            ),
            Text('body-xl 24/36', style: typography.bodyExtraLarge),
            Text('body-lg 20/30', style: typography.bodyLarge),
            Text('label-bold 18/24', style: typography.labelBold),
            const SizedBox(height: IqraSpacing.xxl),
            _SectionTitle('Buttons', typography),
            const IqraButton(label: 'زر أساسي (Primary)'),
            const SizedBox(height: IqraSpacing.sm),
            const IqraButton(
              label: 'زر ثانوي (Secondary)',
              variant: IqraButtonVariant.secondary,
            ),
            const SizedBox(height: IqraSpacing.sm),
            const IqraButton(
              label: 'زر محدد (Outlined)',
              variant: IqraButtonVariant.outlined,
            ),
            const SizedBox(height: IqraSpacing.sm),
            const IqraButton(
              label: 'زر نصي (Text)',
              variant: IqraButtonVariant.text,
            ),
            const SizedBox(height: IqraSpacing.sm),
            const IqraButton(label: 'زر معطّل', onPressed: null),
            const SizedBox(height: IqraSpacing.sm),
            const IqraButton(label: 'جارٍ التحميل', isLoading: true),
            const SizedBox(height: IqraSpacing.xxl),
            _SectionTitle('Cards', typography),
            IqraCard(
              child: Text('بطاقة عادية (Solid Card)', style: typography.bodyLarge),
            ),
            const SizedBox(height: IqraSpacing.sm),
            IqraCard(
              glass: true,
              child: Text('بطاقة زجاجية (Glass Card)', style: typography.bodyLarge),
            ),
            const SizedBox(height: IqraSpacing.xxl),
            _SectionTitle('Chips', typography),
            Wrap(
              spacing: IqraSpacing.sm,
              children: [
                IqraChip(
                  label: 'استمع',
                  icon: Icons.volume_up_rounded,
                  selected: _chipSelected,
                  onTap: () => setState(() => _chipSelected = !_chipSelected),
                ),
                const IqraChip(label: 'اشرح', icon: Icons.lightbulb_outline),
                const IqraChip(label: 'ترجم', icon: Icons.translate_rounded),
              ],
            ),
            const SizedBox(height: IqraSpacing.xxl),
            _SectionTitle('Toggle Row', typography),
            IqraToggleRow(
              title: 'مثال تبديل',
              description: 'وصف قصير يوضح الخيار.',
              icon: Icons.tune_rounded,
              value: _toggleValue,
              onChanged: (v) => setState(() => _toggleValue = v),
            ),
            const SizedBox(height: IqraSpacing.xxl),
            _SectionTitle('Voice Waveform', typography),
            const Center(child: VoiceWaveform()),
            const SizedBox(height: IqraSpacing.xxl),
            _SectionTitle('Dialog / Sheet / Snackbar', typography),
            Wrap(
              spacing: IqraSpacing.sm,
              runSpacing: IqraSpacing.sm,
              children: [
                IqraButton(
                  label: 'عرض حوار',
                  expand: false,
                  onPressed: () => IqraDialog.show(
                    context,
                    title: 'عنوان الحوار',
                    message: 'هذا نص تجريبي لمعاينة مكوّن الحوار.',
                    primaryActionLabel: 'حسناً',
                    icon: Icons.info_outline_rounded,
                  ),
                ),
                IqraButton(
                  label: 'عرض ورقة سفلية',
                  expand: false,
                  onPressed: () => IqraBottomSheet.show(
                    context,
                    builder: (_) => Text(
                      'محتوى الورقة السفلية هنا.',
                      style: typography.bodyLarge,
                    ),
                  ),
                ),
                IqraButton(
                  label: 'عرض تنبيه نجاح',
                  expand: false,
                  onPressed: () => IqraSnackbar.show(
                    context,
                    message: 'تمت العملية بنجاح!',
                    type: IqraSnackbarType.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: IqraSpacing.xxxl),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title, this.typography);

  final String title;
  final IqraTypography typography;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: IqraSpacing.md),
      child: Text(
        title,
        style:
            typography.labelBold.copyWith(color: IqraColors.primary),
      ),
    );
  }
}
