import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:marvel_wikia/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/loading.gif',
          semanticLabel: MWKTranslate.of(context).translate('loading-image'),
          scale: 0.8,
        ),
        MWKSizing.columnPadding32,
        Semantics(
          label: MWKTranslate.of(context).translate('loading'),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.secondary,
            highlightColor: Theme.of(context).colorScheme.primary,
            child: Text(
              MWKTranslate.of(context).translate('loading').toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}
