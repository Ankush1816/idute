import 'package:flutter/material.dart';

class TwoTextsColumn extends StatelessWidget {
  final String text1;
  final String text2;

  const TwoTextsColumn({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width*0.43,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text1,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,

                ),
              ),
              SizedBox(height: 8),
              Text(
                text2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
