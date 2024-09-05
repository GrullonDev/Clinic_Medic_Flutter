import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.children,
    this.blockBack = false,
  });

  final List<Widget> children;

  final bool blockBack;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: (!blockBack),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25, bottom: 10),
              padding: const EdgeInsets.fromLTRB(22, 35, 32, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              constraints: const BoxConstraints(
                maxWidth: 650,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),

            // Icon

            Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 35,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
