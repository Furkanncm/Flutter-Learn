import 'package:flutter/material.dart';

class ImageAdvanced extends StatefulWidget {
  const ImageAdvanced({super.key});

  @override
  State<ImageAdvanced> createState() => ImageAdvancedState();
}

class ImageAdvancedState extends State<ImageAdvanced>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isVisible = false;
  bool _isOpacity = false;
  bool _isComplete = false;
  bool _isComplete2 = false;

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
      _controller.animateTo(_isVisible ? 1 : 0);
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: DurationUtils()._duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Advanced')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //_ImageEnum.indir.getImage(),
            //_ImageEnum.dog.getImage(),
            AnimatedIcon(icon: AnimatedIcons.home_menu, progress: _controller),

            Card(
              child: ListTile(
                leading: Checkbox.adaptive(
                    value: _isComplete,
                    onChanged: (bool? isCompleted) {
                      setState(() {
                        _isComplete = isCompleted ?? false;
                        _changeOpacity();
                      });
                    }),
                title: AnimatedOpacity(
                  opacity: _isOpacity ? 1 : 0,
                  duration: DurationUtils()._duration,
                  child: const Text("Furkan"),
                ),
              ),
            ),
            Card(
                child: ListTile(
              title: AnimatedSwitcher(
                key: ValueKey<bool>(_isComplete2),
                duration: DurationUtils()._duration,
                child: Text(
                  "Ödev Yap",
                  style: TextStyle(
                    decoration: _isComplete2
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              leading: Checkbox.adaptive(
                  value: _isComplete2,
                  onChanged: (bool? isCompleted) {
                    setState(() {
                      _isComplete2 = isCompleted ?? false;
                    });
                  }),
            )),
            ElevatedButton(
                onPressed: () {
                  _changeOpacity();
                },
                child: const Text("Change")),
            // AnimatedCrossFade with different widgets to prevent infinite loop
            AnimatedCrossFade(
              firstChild: Container(
                color: Colors.red,
                width: 100,
                height: 100,
                child: const Center(child: Text('First')),
              ),
              secondChild: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
                child: const Center(child: Text('Second')),
              ),
              crossFadeState: (_isVisible
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond),
              duration: DurationUtils()._duration,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisibility();
        },
      ),
    );
  }
}

enum _ImageEnum { indir, dog }

extension _ImageExtension on _ImageEnum {
  Widget getImage() {
    return Image.asset("asset/$name.png"); // Correct path
  }
}

class DurationUtils {
  final Duration _duration = const Duration(seconds: 3);
}
