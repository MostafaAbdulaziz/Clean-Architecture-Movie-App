import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class ShaderMaskWidget extends StatelessWidget {
  final Widget widget;
  const ShaderMaskWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) => ShaderMask(
    shaderCallback: (rect) => createEffectOnPhoto(rect),
    blendMode: BlendMode.dstIn,
    child: widget,
  );
}

Shader createEffectOnPhoto(Rect rect) => const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    // fromLTRB
    ConstantColors.transparent,
    ConstantColors.black,
    ConstantColors.black,
    ConstantColors.transparent,
  ],
  stops: [0, 0.3, 0.5, 1],
).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
