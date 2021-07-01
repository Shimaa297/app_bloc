import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class TipsLogin extends StatefulWidget {
  @override
  _TipsLoginState createState() => _TipsLoginState();
}

class _TipsLoginState extends State<TipsLogin> {
  final myArray = [
    {
      'title': 'Easy Learning',
      'info':
          'Application steps offer you superior teachers explain the curriculum with easily',
      //'image': 'images/tips1.jpg'
    },
    {
      'title': 'Chatting With Teacher',
      'info':
          'Student speaks with  the teacher so if he has a question or part of the explanation did not understand ',
      //'image': 'images/tips2.jpg'
    },
    {
      'title': 'Exams',
      'info':
          'Teacher is doing exams to follow student level and sends grades for his parents.',
      //'image': 'images/tips1.jpg'
    },
    {
      'title': 'Competition',
      'info':
          'The superiors will be arranged in terms of the most accession to pass tests.',
      //'image': 'images/tips1.jpg'
    }
  ];
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenHeight / 1.3,
            child: PageIndicatorContainer(
              indicatorSpace: 15,
              padding: EdgeInsets.only(bottom: 40),
              shape: IndicatorShape.circle(size: 12),
              length: myArray.length,
              align: IndicatorAlign.bottom,
              indicatorColor: Colors.grey[400],
              indicatorSelectorColor: Colors.white,
              child: PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: myArray.length,
                itemBuilder: (BuildContext context, index) {
                  return SingleTips(
                    title: myArray[index]['title'],
                    info: myArray[index]['info'],
                    image: myArray[index]['image'],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                    elevation: 10,
                    //minimumSize: Size(88, 36),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape:  RoundedRectangleBorder(
                     // side: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Visitor',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 10,
                    //minimumSize: Size(88, 36),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape:  RoundedRectangleBorder(
                      side: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I\'m New User ? ',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: screenHeight* .05,),
              Text('Sign up', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 18,),)
            ],
          ),
        ],
      ),
    );
  }
}

class SingleTips extends StatelessWidget {
  String title;
  String info;
  String image;

  SingleTips({this.image, this.info, this.title});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      // height: screenHeight / 4,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * .03,
          ),
          Flexible(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
          Flexible(
              flex: 3,
              child: Image.network(
                  'https://png.pngtree.com/png-vector/20191030/ourmid/pngtree-men-and-women-online-chat-service-in-a-flat-design-with-png-image_1885479.jpg')),
          SizedBox(
            height: screenHeight * .04,
          ),
          Text(
            info,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
