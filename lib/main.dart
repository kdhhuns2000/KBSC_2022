import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domestic & Overseas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Explore(title: 'Explore'),
    );
  }
}

class Explore extends StatefulWidget {
  const Explore({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExploreAppBar(widget: widget),
      body: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10.0),
                hintText: '검색...',
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.network(
                    'https://www.sc.or.kr/webPub/0_sck2014/images/microsite/onechild/main_visual.jpg'),
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('세이브 더 칠드런'),
                  subtitle: Text(
                    '홍길동',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '이 친구 소개.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('정보'),
                    ),
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('기부'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Image.network(
                    'https://www.sc.or.kr/webPub/0_sck2014/images/microsite/onechild/main_visual.jpg'),
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('세이브 더 칠드런'),
                  subtitle: Text(
                    '홍길동',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '이 친구 소개.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('정보'),
                    ),
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('기부'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExploreAppBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Explore widget;

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black54,
                iconSize: 40.0,
                onPressed: () {},
              ),
              const SizedBox(
                width: 30.0,
              ),
            ],
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                color: Colors.black54,
                iconSize: 30.0,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.location_on_sharp),
                color: Colors.black54,
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
