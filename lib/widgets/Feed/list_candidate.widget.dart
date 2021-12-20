import 'package:bid_mobile/screens/Feed/Details.screen.dart';
import 'package:flutter/material.dart';

class ListCandidate extends StatefulWidget {
  const ListCandidate({Key? key, required this.dataList}) : super(key: key);

  final List dataList;

  @override
  _ListCandidateState createState() => _ListCandidateState();
}

class _ListCandidateState extends State<ListCandidate> {
  TextStyle keyText = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.black45,
  );

  TextStyle valueText = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:5,
      itemBuilder: (context, int index) {
        // String dateString = widget.dataList[index]['expireDate'].split('T')[0];

        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsScreen()));
          },
          child: Container(
            alignment: Alignment.center,
            // margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: 0.5,
                ),
              ),
              // borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "상품 이름",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'NanumSquare',
                          ),
                          children: [
                            TextSpan(
                              text: "입찰가   ",
                              style: keyText,
                            ),
                            TextSpan(
                              text: "10000 원",
                              style: valueText,
                            )
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'NanumSquare',
                          ),
                          children: [
                            TextSpan(
                              text: "좋아요   ",
                              style: keyText,
                            ),
                            TextSpan(
                              text: "100 회",
                              style: valueText,
                            )
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'NanumSquare',
                          ),
                          children: [
                            TextSpan(
                              text: "마감일   ",
                              style: keyText,
                            ),
                            TextSpan(
                              text: "2021.12.31 23:59",
                              style: valueText,
                            )
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
