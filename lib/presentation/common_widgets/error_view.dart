
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/debug_logger.dart';
import 'package:movie_app/presentation/common_widgets/text_view.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final double? height;
  final Color color;
  final Function()? onRetry;

  const ErrorView(
      {super.key,
      required this.message,
      this.onRetry,
      this.height,
      this.color = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    debuggerAdvance(tag: 'Error View', value: message);
    return Container(
      color: color,
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      child: Builder(
        builder: (context) {
          if (message.toString() == "Internal Server Error") {
            /// Can customize  widget as per the message
            return const TextView(
              title: "Internal Server Error !!",
              maxLine: 5,
              padding: EdgeInsets.symmetric(horizontal: 20),
            );
          } else {
            return TextView(
              title: message,
              maxLine: 5,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            );
          }
        },
      ),
    );
  }
}
