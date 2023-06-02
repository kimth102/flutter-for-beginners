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
  bool showTitle = true;
  List<int> numbers = [];

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    // State 클래스에 상태가 변경됨을 알리는 함수
    // build를 다시 실행
    setState(() {
      // 데이터를 변경하는 코드를 setState 안에 넣을 필요는 없으나
      // 넣는게 가독성이 좋음.

      numbers.add(numbers.length + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme : 어플리케이션을 위한 스타일시트 지정
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
          backgroundColor: const Color(0xfff4eddb),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showTitle
                    ? const MyTitle()
                    : const Text(
                        ':)',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                for (var n in numbers) Text('$n'),
                IconButton(
                  iconSize: 40,
                  color: Colors.deepOrange[700],
                  onPressed: onClicked,
                  icon: const Icon(Icons.add_circle),
                ),
                IconButton(
                  iconSize: 40,
                  color: Colors.grey[700],
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ],
            ),
          )),
    );
  }
}

class MyTitle extends StatefulWidget {
  const MyTitle({
    super.key,
  });

  @override
  State<MyTitle> createState() => _MyTitleState();
}

class _MyTitleState extends State<MyTitle> {
  // 대부분의 경우 여기서 변수 초기화

  @override
  void initState() {
    // initState
    // 부모 요소를 통해 데이터를 초기화하는 경우 사용
    // build 보다 먼저 호출되어야 함.
    // 단 한번만 호출
    super.initState();
    print('init state!');
  }

  @override
  void dispose() {
    // dispose
    // 위젯이 화면에서(위젯 트리에서) 제거되는 경우 호출됨.
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');

    // BuildContext : 상위 요소들에 대한 정보, 위젯의 위치 등을 담고있다.
    // context를 통해 상위 MaterialApp에서 지정한 ThemeData에 접근
    return Text(
      'Click Count',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
