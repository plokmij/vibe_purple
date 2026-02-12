import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosAddTaskField extends StatefulWidget {
  const MacosAddTaskField({
    required this.onAddTask,
    super.key,
  });

  final void Function(String) onAddTask;

  @override
  State<MacosAddTaskField> createState() => _MacosAddTaskFieldState();
}

class _MacosAddTaskFieldState extends State<MacosAddTaskField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateField);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateField() {
    setState(() {
      _hasText = _controller.text.trim().isNotEmpty;
    });
  }

  void _addTask() {
    if (_hasText) {
      widget.onAddTask(_controller.text.trim());
      _controller.clear();
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: MacosTextField(
            controller: _controller,
            focusNode: _focusNode,
            placeholder: tr.addNewTaskInputPlaceholder,
            onSubmitted: _hasText ? (_) => _addTask() : null,
          ),
        ),
        const SizedBox(width: 8),
        PushButton(
          controlSize: ControlSize.regular,
          onPressed: _hasText ? _addTask : null,
          child: const Icon(CupertinoIcons.plus),
        ),
      ],
    );
  }
}
