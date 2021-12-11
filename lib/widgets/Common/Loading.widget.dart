import 'package:bid_mobile/data/mainTheme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black45,
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        color: mainThemeColor,
      ),
    );
  }
}