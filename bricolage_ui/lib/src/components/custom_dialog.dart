import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// A customizable dialog component with smooth fade and slide animations
class CustomDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String description,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return _AnimatedDialog(
          title: title,
          description: description,
          confirmText: confirmText,
          cancelText: cancelText,
          onConfirm: onConfirm,
        );
      },
    );
  }
}

class _AnimatedDialog extends StatefulWidget {
  final String title;
  final String description;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;

  const _AnimatedDialog({
    required this.title,
    required this.description,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
  });

  @override
  State<_AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<_AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: 'Dialog: ${widget.title}',
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UIRadius.lg),
            ),
            elevation: 8,
            shadowColor: UIColors.black.withValues(alpha: 0.15),
            child: Padding(
              padding: const EdgeInsets.all(UISpacing.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: UITypography.fontSizeLG,
                        fontWeight: UITypography.fontWeightSemiBold,
                        color: UIColors.foreground,
                      ),
                    ),
                  ),
                  const SizedBox(height: UISpacing.md / 1.33),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: UITypography.fontSizeSM,
                      color: UIColors.mutedForeground,
                    ),
                  ),
                  const SizedBox(height: UISpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.cancelText != null)
                        Semantics(
                          button: true,
                          label: '${widget.cancelText}, button',
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              foregroundColor: UIColors.mutedForeground,
                            ),
                            child: Text(widget.cancelText!),
                          ),
                        ),
                      if (widget.cancelText != null)
                        const SizedBox(width: UISpacing.sm),
                      Semantics(
                        button: true,
                        label: '${widget.confirmText ?? 'OK'}, button',
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.onConfirm != null) widget.onConfirm!();
                            Navigator.of(context).pop(true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: UIColors.primary,
                            foregroundColor: UIColors.primaryForeground,
                          ),
                          child: Text(widget.confirmText ?? 'OK'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
