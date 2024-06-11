import 'package:flutter/material.dart';

import 'package:marvel_wikia/utils/utils.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  void initState() {
    super.initState();

    debugPrint('ErrorPage displayed: Page Not Found');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 128,
            color: const Color(0XFF151515),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Semantics(
                      label: MWKTranslate.of(context).translate('not-found'),
                      child: Text(MWKTranslate.of(context).translate('not-found')),
                    ),
                    MWKSizing.columnPadding8,
                    Semantics(
                      label: MWKTranslate.of(context).translate('not-found-desc'),
                      child: Text(MWKTranslate.of(context).translate('not-found-desc')),
                    ),
                    MWKSizing.columnPadding8,
                    Semantics(
                      label: MWKTranslate.of(context).translate('not-found-action'),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(MWKTranslate.of(context).translate('not-found-action')),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/not-found.png',
                  semanticLabel: MWKTranslate.of(context).translate('not-found-image'),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 128,
            color: const Color(0XFF151515),
          ),
        ],
      ),
    );
  }
}
