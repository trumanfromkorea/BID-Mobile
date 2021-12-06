import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Feed/Category.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  String _category = "카테고리 선택";
  String priceText = "";
  int price = 0;
  String sellPrice = "가격 입력";

  TextEditingController priceController = TextEditingController(text: "");
  var f = NumberFormat('###,###,###,###');

  void onPressCategory() async {
    final String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CategoryScreen()));

    setState(() {
      _category = result;
    });
  }

  void showModalSheet() {
    setState(() {
      price = 0;
      priceController.text = price.toString() + ' 원';
    });
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: 3,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("가격 입력"),
              TextFormField(
                textAlign: TextAlign.right,
                controller: priceController,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffe0e0e0),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: mainThemeColor,
                    width: 1,
                  )),
                  hintText: "가격을 입력해주세요",
                  hintStyle: TextStyle(
                    color: Color(0xffc2c2c2),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  String valueText = value.replaceAll(',', '').split(' ')[0];
                  priceController.text = f.format(int.parse(valueText)) + ' 원';
                },
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        price = price + 50000;
                        priceController.text = f.format(price) + ' 원';
                      });
                    },
                    child: Text("+50,000원"),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        price = price + 10000;
                        priceController.text = f.format(price) + ' 원';
                      });
                    },
                    child: Text(
                      "+10,000원",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        price = price + 5000;
                        priceController.text = f.format(price) + ' 원';
                      });
                    },
                    child: Text("+5,000원"),
                  ),
                ],
              ),
              CupertinoButton.filled(
                onPressed: () {
                  setState(() {
                    sellPrice = priceController.text;
                  });
                  Navigator.pop(context);
                  
                },
                child:Text("확인"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "판매글 작성",
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          CupertinoButton(
            child: Text(
              "등록",
              style: TextStyle(fontFamily: 'NanumSquare'),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "제목",
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: onPressCategory,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _category,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
            const Divider(),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text("경매 시작가"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "가격 입력",
                          style: TextStyle(
                            color: mainThemeColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: GestureDetector(
                      onTap: showModalSheet,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text("즉시 판매가"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              sellPrice,
                              style: TextStyle(
                                color: mainThemeColor,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            TextField(
              maxLines: 15,
              minLines: 15,
              maxLength: 300,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "제품 설명을 적어주세요",
                hintStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
