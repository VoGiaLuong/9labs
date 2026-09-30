import 'package:flutter/material.dart';

void main() => runApp(DestiniApp());

class Story {
  String storyTitle;
  String choice1;
  String choice2;
  int choice1Destination;
  int choice2Destination;

  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
    required this.choice1Destination,
    required this.choice2Destination,
  });
}

class DestiniApp extends StatelessWidget {
  const DestiniApp({Key? key}) : super(key: key); // Sử dụng key cho các widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
      title: 'Destini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key); // Sử dụng key cho các widget

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int storyIndex = 0; // Biến theo dõi câu chuyện hiện tại

  // Dữ liệu câu chuyện
  List<Story> storyData = [
    Story(
      storyTitle: 'You are on a path in the woods when you come to a fork. Do you go left or right?',
      choice1: 'Left',
      choice2: 'Right',
      choice1Destination: 2,
      choice2Destination: 3,
    ),
    Story(
      storyTitle: 'You walk down the left path and find a house. Do you knock on the door or keep walking?',
      choice1: 'Knock on the door',
      choice2: 'Keep walking',
      choice1Destination: 4,
      choice2Destination: 5,
    ),
    Story(
      storyTitle: 'You walk down the right path and come to a cliff. Do you climb down or turn back?',
      choice1: 'Climb down',
      choice2: 'Turn back',
      choice1Destination: 6,
      choice2Destination: 7,
    ),
    Story(
      storyTitle: 'You knock on the door and a monster answers. Do you run or try to fight?',
      choice1: 'Run',
      choice2: 'Fight',
      choice1Destination: 8,
      choice2Destination: 9,
    ),
    Story(
      storyTitle: 'You keep walking and reach a dead end. Do you turn back or try to climb?',
      choice1: 'Turn back',
      choice2: 'Climb',
      choice1Destination: 10,
      choice2Destination: 11,
    ),
    Story(
      storyTitle: 'You climb down the cliff and find treasure! Congratulations!',
      choice1: 'Restart',
      choice2: 'Exit',
      choice1Destination: 0,
      choice2Destination: 0,
    ),
    Story(
      storyTitle: 'You turn back and find a way out of the forest. You are safe.',
      choice1: 'Restart',
      choice2: 'Exit',
      choice1Destination: 0,
      choice2Destination: 0,
    ),
    Story(
      storyTitle: 'You ran away, but the monster caught you. Game over.',
      choice1: 'Restart',
      choice2: 'Exit',
      choice1Destination: 0,
      choice2Destination: 0,
    ),
    Story(
      storyTitle: 'You fought the monster and won! You’re a hero!',
      choice1: 'Restart',
      choice2: 'Exit',
      choice1Destination: 0,
      choice2Destination: 0,
    ),
    Story(
      storyTitle: 'You reached a safe house and survived. You win!',
      choice1: 'Restart',
      choice2: 'Exit',
      choice1Destination: 0,
      choice2Destination: 0,
    ),
  ];

  // Hàm chuyển câu chuyện dựa trên lựa chọn
  void nextStory(int choice) {
    setState(() {
      storyIndex = (choice == 1)
          ? storyData[storyIndex].choice1Destination
          : storyData[storyIndex].choice2Destination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destini'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              storyData[storyIndex].storyTitle,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => nextStory(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Thay đổi từ `primary` thành `backgroundColor`
              ),
              child: Text(storyData[storyIndex].choice1),  // Đảm bảo `child` là tham số cuối cùng
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => nextStory(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Thay đổi từ `primary` thành `backgroundColor`
              ),
              child: Text(storyData[storyIndex].choice2),  // Đảm bảo `child` là tham số cuối cùng
            ),
          ],
        ),
      ),
    );
  }
}
