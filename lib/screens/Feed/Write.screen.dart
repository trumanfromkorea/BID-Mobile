import 'package:bid_mobile/data/mainTheme.dart';
import 'package:bid_mobile/screens/Feed/Category.screen.dart';
import 'package:bid_mobile/widgets/Feed/InputPrice.widget.dart';
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
  String? sellPrice;
  String? bidPrice;

  TextEditingController priceController = TextEditingController(text: "");
  var f = NumberFormat('###,###,###,###');

  onPressCategory() async {
    final String result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen()));

    setState(() {
      _category = result;
    });
  }

  priceSetter(String _price) {
    setState(() {
      sellPrice = _price;
    });
  }

  showPricePicker(String price) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return InputPriceModal(
          priceSetter: (value) {
            setState(() {
              if (price == "bid") {
                bidPrice = value;
              } else {
                sellPrice = value;
              }
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
              child: const Text(
                "등록",
                style: TextStyle(fontFamily: 'NanumSquare'),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
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
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
                const Divider(),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showPricePicker("bid");
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: const Text("경매 시작가"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  bidPrice == null ? "가격 입력" : "$bidPrice 원",
                                  style: TextStyle(
                                    color: mainThemeColor,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showPricePicker("sell");
                          },
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: const Text("즉시 판매가"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  sellPrice == null ? "가격 입력" : "$sellPrice 원",
                                  style: TextStyle(
                                    color: mainThemeColor,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
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
                const TextField(
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
        ),
      ),
    );
  }
}
