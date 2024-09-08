# SidePanel

`side_panel` is a Flutter package that provides a customizable panel widget that can be displayed on the left, right, top, or bottom sides of the screen. It supports animation for showing and hiding panels and can be controlled via a `SidePanelController`.

![example image](https://github.com/msuhal/flutter_side_panel/blob/master/images/example.gif?raw=true)

## Features

- Display panels on all four sides of the screen (left, right, top, bottom).
- Customizable panel size and content.
- Animation support for showing and hiding panels.
- Control panels programmatically using `SidePanelController`.

## Installation

To use this package, add `side_panel` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  side_panel: ^0.0.1
```

## Usage
Here's a basic example of how to use the `SidePanel` widget:

```dart
import 'package:flutter/material.dart';
import 'package:side_panel/side_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SidePanelController _controller = SidePanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidePanel(
        controller: _controller,
        right: Panel(
          child: Container(
            color: Colors.blueGrey.shade100,
            child: const Center(
              child: Text('Right Panel'),
            ),
          ),
        ),
        left: Panel(
          child: Container(
            color: Colors.pink.shade100,
            child: const Center(
              child: Text('Left Panel'),
            ),
          ),
        ),
        top: Panel(
          child: Container(
            color: Colors.orange.shade100,
            child: const Center(
              child: Text('Top Panel'),
            ),
          ),
        ),
        bottom: Panel(
          child: Container(
            color: Colors.blue.shade100,
            child: const Center(
              child: Text('Bottom Panel'),
            ),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            child: ListView(
              shrinkWrap: true,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.showRightPanel();
                  },
                  child: const Text('Show Right Panel'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    _controller.hideRightPanel();
                  },
                  child: const Text('Hide Right Panel'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _controller.showLeftPanel();
                  },
                  child: const Text('Show Left Panel'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    _controller.hideLeftPanel();
                  },
                  child: const Text('Hide Left Panel'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _controller.showTopPanel();
                  },
                  child: const Text('Show Top Panel'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    _controller.hideTopPanel();
                  },
                  child: const Text('Hide Top Panel'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    _controller.showBottomPanel();
                  },
                  child: const Text('Show Bottom Panel'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    _controller.hideBottomPanel();
                  },
                  child: const Text('Hide Bottom Panel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

This example creates a `SidePanel` with a main content area and a right panel. Clicking the button shows the right panel with its content.

### SidePanelController
The `SidePanelController` allows you to programmatically control the visibility of the panels. You can create a controller and assign its methods to functions that trigger panel visibility changes.

### Customization
- You can customize the animation duration using the `animatedDuration` property of the `SidePanel` widget.
- Each Panel can have its own `size` and content widget.
- You can use different widgets for the main content and panels.