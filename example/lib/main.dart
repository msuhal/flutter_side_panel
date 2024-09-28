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
