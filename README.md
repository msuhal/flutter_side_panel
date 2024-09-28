# SidePanel

`side_panel` is a Flutter package that provides a customizable panel widget that can be displayed on the left, right, top, or bottom sides of the screen. It supports animation for showing and hiding panels and can be controlled via a `SidePanelController`.

![example image](https://github.com/msuhal/flutter_side_panel/blob/main/images/example.gif?raw=true)
[Live Demo](https://msuhal.github.io/flutter_side_panel)

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
  final _controller = SidePanelController();
  var _isOverlay = false;

  // Visibility states of the panels
  bool _isRightPanelVisible = false;
  bool _isLeftPanelVisible = false;
  bool _isTopPanelVisible = false;
  bool _isBottomPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SidePanel(
        controller: _controller,
        right: Panel(
          overlay: _isOverlay,
          child: Container(
            color: Colors.blueGrey.shade100,
            child: const Center(
              child: Text('Right Panel'),
            ),
          ),
        ),
        left: Panel(
          overlay: _isOverlay,
          child: Container(
            color: Colors.pink.shade100,
            child: const Center(
              child: Text('Left Panel'),
            ),
          ),
        ),
        top: Panel(
          overlay: _isOverlay,
          child: Container(
            color: Colors.orange.shade100,
            child: const Center(
              child: Text('Top Panel'),
            ),
          ),
        ),
        bottom: Panel(
          overlay: _isOverlay,
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
                CheckboxListTile(
                  title: const Text('Overlay'),
                  value: _isOverlay,
                  onChanged: (value) {
                    setState(() {
                      _isRightPanelVisible = false;
                      _isLeftPanelVisible = false;
                      _isTopPanelVisible = false;
                      _isBottomPanelVisible = false;
                      _controller.hideRightPanel();
                      _controller.hideLeftPanel();
                      _controller.hideBottomPanel();
                      _controller.hideTopPanel();
                      _isOverlay = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),

                // Toggle button for the right panel
                ElevatedButton(
                  onPressed: () {
                    if (_isOverlay) {
                      _controller.showRightPanel();
                      return;
                    }

                    setState(() {
                      _isRightPanelVisible = !_isRightPanelVisible;
                      _isRightPanelVisible
                          ? _controller.showRightPanel()
                          : _controller.hideRightPanel();
                    });
                  },
                  child: Text(_isRightPanelVisible
                      ? 'Hide Right Panel'
                      : 'Show Right Panel'),
                ),

                const SizedBox(height: 24),

                // Toggle button for the left panel
                ElevatedButton(
                  onPressed: () {
                    if (_isOverlay) {
                      _controller.showLeftPanel();
                      return;
                    }

                    setState(() {
                      _isLeftPanelVisible = !_isLeftPanelVisible;
                      _isLeftPanelVisible
                          ? _controller.showLeftPanel()
                          : _controller.hideLeftPanel();
                    });
                  },
                  child: Text(_isLeftPanelVisible
                      ? 'Hide Left Panel'
                      : 'Show Left Panel'),
                ),

                const SizedBox(height: 24),

                // Toggle button for the top panel
                ElevatedButton(
                  onPressed: () {
                    if (_isOverlay) {
                      _controller.showTopPanel();
                      return;
                    }

                    setState(() {
                      _isTopPanelVisible = !_isTopPanelVisible;
                      _isTopPanelVisible
                          ? _controller.showTopPanel()
                          : _controller.hideTopPanel();
                    });
                  },
                  child: Text(
                      _isTopPanelVisible ? 'Hide Top Panel' : 'Show Top Panel'),
                ),

                const SizedBox(height: 24),

                // Toggle button for the bottom panel
                ElevatedButton(
                  onPressed: () {
                    if (_isOverlay) {
                      _controller.showBottomPanel();
                      return;
                    }

                    setState(() {
                      _isBottomPanelVisible = !_isBottomPanelVisible;
                      _isBottomPanelVisible
                          ? _controller.showBottomPanel()
                          : _controller.hideBottomPanel();
                    });
                  },
                  child: Text(_isBottomPanelVisible
                      ? 'Hide Bottom Panel'
                      : 'Show Bottom Panel'),
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
This Flutter app demonstrates the usage of the `SidePanel` widget with customizable panels on all four sides of the screen. The app includes a `SidePanelController` to programmatically control the visibility of panels on the right, left, top, and bottom. Users can toggle between normal and overlay modes, where the panels either push or float over the main content. The app provides buttons to show or hide each panel, and visibility states are managed within the `State` class. The panels are styled with different background colors to distinguish their positions.

### SidePanelController
The `SidePanelController` allows you to programmatically control the visibility of the panels. You can create a controller and assign its methods to functions that trigger panel visibility changes.

### Customization
- You can customize the animation duration using the `animatedDuration` property of the `SidePanel` widget.
- Each Panel can have its own `size` and content widget.
- You can use different widgets for the main content and panels.