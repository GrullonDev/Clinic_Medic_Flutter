import 'package:flutter/material.dart';
import 'package:proyecto_graduacion/widgets/utils/buttons/elevated_button.dart';
import 'package:proyecto_graduacion/widgets/utils/buttons/text_button.dart';
import 'package:proyecto_graduacion/widgets/utils/dialogs/base_dialog.dart';
import 'package:proyecto_graduacion/widgets/utils/ui/button_theme.dart';

/// Dialog to show text with yes and no button
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    this.title,
    required this.content,
    this.subContent,
    this.okText,
    this.onCancel,
    this.onOk,
    this.cancelText,
    this.hideCancelButton = false,
    this.blockBack = false,
    this.expandOkButton = false,
  });

  final String? title;
  final String content;
  final String? subContent;

  final String? okText;
  final String? cancelText;

  final VoidCallback? onOk;
  final VoidCallback? onCancel;

  final bool hideCancelButton;
  final bool blockBack;
  final bool expandOkButton;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      blockBack: blockBack,
      children: [
        if (title != null)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (subContent != null && subContent!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            subContent!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!hideCancelButton) ...[
              Expanded(
                child: AppTextButton(
                  style: UIButtonStyle.textButtonStyle(
                    primary: Colors.grey,
                  ),
                  title: cancelText ?? 'Cancelar',
                  onTap: () {
                    Navigator.pop(context);

                    onCancel?.call();
                  },
                ),
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              flex: expandOkButton ? 2 : 1,
              child: AppElevatedButton(
                title: okText ?? 'Guardar',
                onTap: () {
                  Navigator.pop(context);

                  onOk?.call();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
