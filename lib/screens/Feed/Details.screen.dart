import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_add),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 130,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "입찰",
                        style: TextStyle(color: Colors.white),
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "39,000",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "현재 입찰가",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ]),
                decoration: BoxDecoration(
                  color: Color(0xff0064FF),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 130,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "구매",
                        style: TextStyle(color: Colors.white),
                      ),
                      const VerticalDivider(
                        color: Colors.white,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "50,000",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "즉시 구매가",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ]),
                decoration: BoxDecoration(
                  color: Color(0xffb90000),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: Column(),
    );
  }
}
