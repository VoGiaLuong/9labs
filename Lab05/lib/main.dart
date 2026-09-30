import 'package:audioplayers/audioplayers.dart'; // Import phiên bản mới
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // Tạo một đối tượng AudioPlayer duy nhất để sử dụng lại
  final AudioPlayer _player = AudioPlayer();
  final AudioCache _audioCache = AudioCache(); // Tạo AudioCache để xử lý âm thanh từ assets


  // Phương thức để phát âm thanh
  void playSound(int soundNumber) async {
    // Dùng phương thức play để phát âm thanh từ asset
    await _audioCache.play('assets/note$soundNumber.wav');  // Chỉ định nguồn âm thanh từ assets
    // await _player.play('assets/note1.wav');
  }

  // Xây dựng nút cho mỗi phím đàn
  Expanded buildKey(Color color, int soundNumber) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () => playSound(soundNumber),  // Khi nhấn sẽ phát âm thanh
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.teal, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}

