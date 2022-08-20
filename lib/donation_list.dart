import 'package:flutter/material.dart';
import 'donation_info.dart';
import 'donation_status.dart';

class DonationList extends StatelessWidget {
  const DonationList({Key? key}) : super(key: key);

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
  final ScrollController _scrollController = ScrollController();

  bool favoriteActivate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  icon: (favoriteActivate == false)
                      ? const Icon(Icons.favorite_outline)
                      : const Icon(Icons.favorite_outlined),
                  color: Colors.black54,
                  iconSize: 30.0,
                  onPressed: () => setState(() {
                    favoriteActivate = !favoriteActivate;
                  }),
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
      ),
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
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DonationItemCard(index: index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonationItemCard extends StatelessWidget {
  DonationItemCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  bool isFavorite = false;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
              'https://www.sc.or.kr/webPub/0_sck2014/images/microsite/onechild/main_visual.jpg'),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle),
            title: Text('세이브 더 칠드런$index'),
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
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonationInfoScreen(),
                    ),
                  );
                  // Perform some action
                },
                child: const Text('정보'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    color: Color(0xFF6200EE),
                  ),
                ),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('기부'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
