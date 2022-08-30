import 'package:flutter/material.dart';
import 'donation_info.dart';
import 'donation_list.dart';


class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('메인화면 앱바'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                    child: Text(
                      '급구',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
                height: 140.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  children: <Widget>[
                    MainDonationCard('assets/images/yuri.png', '대한민국', '태풍피해복구', 'Dona1'),
                    MainDonationCard('assets/images/yuri.png', '콜롬비아', '지진피해복구', '2'),
                    MainDonationCard('assets/images/yuri.png', '일본', '해일피해복구', '3'),
                    MainDonationCard('assets/images/yuri.png', '콩고', '코로나백신지원', '4'),
                    MainDonationCard('assets/images/yuri.png', '중국', '응애응애응애', '5'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 30, 0, 0),
                    child: Text(
                      '도움의 손길',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 3,
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          MainPageBox('assets/images/nativeDonation.png', '1'),
                          MainPageBox('assets/images/foreDonation.png', '1'),
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          MainPageBox('assets/images/reviewImg.png', '1'),
                          MainPageBox('assets/images/fundingImg.png', '1'),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page),
          ]),
        ),
      ),
    );
  }
}

class MainDonationCard extends StatefulWidget {
  final String imageName, country, explanation, donationPage;

  const MainDonationCard(this.imageName, this.country, this.explanation,
      this.donationPage);

  @override
  State<MainDonationCard> createState() => _MainDonationCardState();
}

class _MainDonationCardState extends State<MainDonationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(3.0, 3.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      width: 150,
      margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationInfoScreen(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 3.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      widget.imageName,
                    ),
                  ),
                ),
              ),
            ),
            flex: 6,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 3, left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.country,
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.explanation,
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class MainPageBox extends StatelessWidget {
  final String imageName, pageString;

  const MainPageBox(this.imageName, this.pageString);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DonationList(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 3,
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageName,
              ),
            ),
          ),
        ),
      ),
      flex: 1,
    );
  }
}
