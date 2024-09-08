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
