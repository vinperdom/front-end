import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';

// Import the language & theme
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeEditor extends StatefulWidget {
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = "x = 'asrt'\nprint('arsta')\nprint(x)\n";
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: python,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CodeTheme(
        data: const CodeThemeData(styles: monokaiSublimeTheme),
        child: CodeField(
          controller: _codeController!,
          textStyle: const TextStyle(
              fontFamily: 'FiraCode', fontWeight: FontWeight.bold),
          background: Theme.of(context).cardColor,
          lineNumberStyle: const LineNumberStyle(
            margin: 16,
            textStyle: const TextStyle(
                fontFamily: 'FiraCode', fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
