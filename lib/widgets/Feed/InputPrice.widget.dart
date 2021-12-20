import 'package:bid_mobile/data/mainTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPriceModal extends StatefulWidget {
  const InputPriceModal({Key? key, required this.priceSetter}) : super(key: key);

  final Function priceSetter;

  @override
  _InputPriceModalState createState() => _InputPriceModalState();
}

class _InputPriceModalState extends State<InputPriceModal> {
  int price = 0;
  TextEditingController priceController = TextEditingController(text: "");
  var f = NumberFormat('###,###,###,###');

  @override
  Widget build(BuildContext context) {
    setState(() {
      priceController.text = f.format(price);
    });
    var marginBottom = MediaQuery.of(context).viewInsets.bottom;
    print(marginBottom);
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        10,
        20,
        MediaQuery.of(context).viewInsets.bottom + 40,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black26,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "가격 입력",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 10),
          TextFormField(
            textAlign: TextAlign.right,
            controller: priceController,
            decoration: InputDecoration(
              suffixText: "원",
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: mainThemeColor,
                width: 1,
              )),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              String valueText = value.replaceAll(',', '');
              priceController.text = f.format(int.parse(valueText));
            },
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      price = price + 50000;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "+50,000원",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      price = price + 10000;
                    });
                    priceController.text = f.format(price);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "+10,000원",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      price = price + 5000;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black38,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "+5,000원",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              widget.priceSetter(priceController.text);
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainThemeColor,
              ),
              child: const Text(
                "확인",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
