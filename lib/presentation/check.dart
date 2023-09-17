import 'package:flutter/material.dart';

class TextAnimationDemo extends StatefulWidget {
  const TextAnimationDemo({super.key});

  @override
  _TextAnimationDemoState createState() => _TextAnimationDemoState();
}

class _TextAnimationDemoState extends State<TextAnimationDemo>
    with TickerProviderStateMixin {
  String fullText = 'Hello, Flutter Animation Example';
  String displayedText = '';
  int textIndex = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _controller.forward().then((_) {
      if (textIndex <= fullText.length) {
        setState(() {
          displayedText = fullText.substring(0, textIndex);
          textIndex++;
        });
        _controller.reset();
        _startTypingAnimation();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Animation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Text(
                  displayedText,
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
