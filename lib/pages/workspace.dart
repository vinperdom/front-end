import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import '../widgets/header.dart';

class Workspace extends StatefulWidget {
  const Workspace({Key? key});

  @override
  _WorkspaceState createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  double leftWidth = 300.0; // Initial width of the left element
  double rightWidth = 300.0; // Initial width of the right element
  double dragSpeedFactor = 0.4; // Drag speed factor
  Offset mousePosition = Offset.zero; // Mouse position during dragging
  double snapDistance = 400.0; // Distance from center to trigger snap
  late VideoPlayerController _controller;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131516),
      appBar: Header(
        title: 'Introducao a Programacao - Funcoes e Variaveis',
      ),
      body: Card(
        color:
            isHovered ? Color(0xFF131516).withOpacity(0.1) : Color(0xFF131516),
        // color: const Color(0xFF131516),
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                flex: leftWidth.toInt(),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Card(
                    color: const Color(0xFF1F2122),
                    margin: EdgeInsets.zero,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                            ),
                            Text(
                              '''

You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable.

You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.

Return the answers to all queries. If a single answer cannot be determined, return -1.0.

Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

 

Example 1:

Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
Explanation: 
Given: a / b = 2.0, b / c = 3.0
queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
return: [6.0, 0.5, -1.0, 1.0, -1.0 ]
Example 2:

Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
Output: [3.75000,0.40000,5.00000,0.20000]
Example 3:

Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
Output: [0.50000,2.00000,-1.00000,-1.00000]
 

Constraints:

1 <= equations.length <= 20
equations[i].length == 2
1 <= Ai.length, Bi.length <= 5
values.length == equations.length
0.0 < values[i] <= 20.0
1 <= queries.length <= 20
queries[i].length == 2
1 <= Cj.length, Dj.length <= 5
Ai, Bi, Cj, Dj consist of lower case English letters and digits.
''',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                child: GestureDetector(
                  onPanEnd: (details) {
                    setState(() {
                      isHovered = false;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      isHovered = true;
                      double screenWidth = MediaQuery.of(context).size.width;
                      RenderBox renderBox =
                          context.findRenderObject() as RenderBox;
                      mousePosition =
                          renderBox.globalToLocal(details.globalPosition);

                      // Calculate the new position based on the mouse movement
                      double newPosition = mousePosition.dx - 12.0;
                      double maxPosition = screenWidth - 24.0;

                      // Check if the new position is within the limits
                      if (newPosition >= snapDistance &&
                          newPosition <= maxPosition - snapDistance) {
                        // Adjust the width of the blue container based on the new position
                        if (mousePosition.dx > (screenWidth / 2) + 16 ||
                            mousePosition.dx < (screenWidth / 2) - 16) {
                          leftWidth = newPosition;
                          rightWidth = maxPosition - newPosition;
                        } else {
                          leftWidth = 300;
                          rightWidth = 300;
                        }
                      }
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeColumn, // or resizeRow

                    onEnter: (_) {
                      setState(() {
                        isHovered = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHovered = false;
                      });
                    },
                    child: Container(
                      color: isHovered
                          ? Color(0xFF131516).withOpacity(0.1)
                          : Color(0xFF131516),
                      width: 8.0,
                      child: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Align the Column at the center vertically
                            children: [
                              Icon(
                                Icons.circle,
                                size: 3,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8.0),
                              Icon(
                                Icons.circle,
                                size: 3,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 8.0),
                              Icon(
                                Icons.circle,
                                size: 3,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: rightWidth.toInt(),
                child: Container(
                  child: Center(
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: const Color(0xFF131516),
                      child: Column(children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF252729),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            top: 2.0,
                            right: 16.0,
                            bottom: 2.0,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/a.png', // Replace with your image asset path
                                width:
                                    16.0, // Set the desired width of the image
                                height:
                                    16.0, // Set the desired height of the image
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Python',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Python code',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.top,
                              expands: true,
                              maxLines: null,
                              style: TextStyle(fontSize: 16),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
