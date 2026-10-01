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
      title: 'Nhiệm vụ giải cứu thư viện',
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
        title: Text('Giải cứu thư viện'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            List<Story> storyData = [
              Story(
                storyTitle: 'Cuốn sách cổ của thư viện đã biến mất. Bạn bắt đầu tìm kiếm từ đâu?',
                choice1: 'Kiểm tra phòng đọc',
                choice2: 'Đi xuống tầng hầm',
                choice1Destination: 1,
                choice2Destination: 2,
              ),
              Story(
                storyTitle: 'Trong phòng đọc, bạn phát hiện một mảnh giấy có ký hiệu hình ngôi sao.',
                choice1: 'Theo dấu ký hiệu',
                choice2: 'Hỏi người thủ thư',
                choice1Destination: 3,
                choice2Destination: 4,
              ),
              Story(
                storyTitle: 'Tầng hầm tối và lạnh. Bạn nghe thấy tiếng động phía sau những thùng sách.',
                choice1: 'Bật đèn pin và tiến lại gần',
                choice2: 'Gọi người giúp đỡ',
                choice1Destination: 5,
                choice2Destination: 6,
              ),
              Story(
                storyTitle: 'Ký hiệu dẫn bạn đến một kệ sách bí mật. Bạn tìm thấy cuốn sách cổ!',
                choice1: 'Mang sách về thư viện',
                choice2: 'Đọc lời nguyền trên sách',
                choice1Destination: 7,
                choice2Destination: 8,
              ),
              Story(
                storyTitle: 'Người thủ thư nhớ ra cuốn sách được cất trong chiếc rương ở phòng lưu trữ.',
                choice1: 'Tìm chìa khóa',
                choice2: 'Cạy ổ khóa',
                choice1Destination: 7,
                choice2Destination: 8,
              ),
              Story(
                storyTitle: 'Bạn tìm thấy một chú mèo đang mắc kẹt giữa các thùng sách. Nó đeo chiếc chìa khóa trên cổ!',
                choice1: 'Cứu chú mèo',
                choice2: 'Tiếp tục tìm sách',
                choice1Destination: 7,
                choice2Destination: 6,
              ),
              Story(
                storyTitle: 'Bạn gọi người thủ thư. Mọi người cùng tìm kiếm và phát hiện một cánh cửa bí mật.',
                choice1: 'Mở cánh cửa',
                choice2: 'Quay lại phòng đọc',
                choice1Destination: 7,
                choice2Destination: 1,
              ),
              Story(
                storyTitle: 'Chúc mừng! Cuốn sách cổ đã được đưa trở lại đúng chỗ. Thư viện được cứu!',
                choice1: 'Chơi lại',
                choice2: 'Bắt đầu lại',
                choice1Destination: 0,
                choice2Destination: 0,
              ),
              Story(
                storyTitle: 'Lời nguyền khiến toàn bộ sách bay lơ lửng. Bạn cần nhờ người thủ thư hóa giải.',
                choice1: 'Chơi lại',
                choice2: 'Bắt đầu lại',
                choice1Destination: 0,
                choice2Destination: 0,
              ),
            ];
