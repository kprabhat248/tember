import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tember/record.dart'; // Import Google Fonts package
import 'videoplayer.dart'; // Import the VideoPlayerPage file

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> videoPaths = [
    'assets/videos/1.mp4',
    'assets/videos/2.mp4',
    'assets/videos/3.mp4',
    // Add more video paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text(
          'Explore',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {
              // Add your notification functionality here
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoSearchTextField(
                    placeholder: 'Search...',
                    onChanged: (value) {
                      // Implement search functionality here
                    },
                    onSubmitted: (value) {
                      // Handle search submission
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.line_horizontal_3),
                  onPressed: () {
                    // Add your filter functionality here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: videoPaths.length,
        itemBuilder: (context, index) {
          String videoPath = videoPaths[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: VideoPlayerPage(videoPath: videoPath),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                title: Text('Username'),
                subtitle: Text('Views • Timestamp Posted'),
                trailing: Chip(
                  label: Text('Category: Culture'),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.explore),
              onPressed: () {
                // Add functionality for Explore button
              },
            ),
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraPage()),
    );

                // Add functionality for recording video
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHome(),
  ));
}
