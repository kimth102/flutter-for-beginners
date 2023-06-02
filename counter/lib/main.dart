import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// StatefulWidget : 상태에 따라 데이터가 변하는 위젯
// - 실시간으로 UI가 변경됨.
// StatelessWidget : 상태를 가지지 않는 위젯
// - 단순하게 보여주기만 함.

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

// State : 위젯의 데이터, 상태를 저장
class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    // State 클래스에 상태가 변경됨을 알리는 함수
    // build를 다시 실행
    setState(() {
      // 데이터를 변경하는 코드를 setState 안에 넣을 필요는 없으나
      // 넣는게 가독성이 좋음.
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xfff4eddb),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Click Count',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  color: Colors.deepOrange[700],
                  onPressed: onClicked,
                  icon: const Icon(Icons.add_circle),
                )
              ],
            ),
          )),
    );
  }
}
