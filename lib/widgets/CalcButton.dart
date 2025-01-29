import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final int bgColor;
  final double textSize;
  const CalcButton(
      {super.key,
      required this.callback,
      required this.text,
      this.textSize = 28.0,
      this.bgColor = 0xFF283637});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: TextButton(
          onPressed: () {
            callback(text);
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(bgColor),
              foregroundColor: const Color.fromARGB(255, 247, 242, 242),
              padding: EdgeInsets.all(16.0),
              textStyle: TextStyle(fontSize: 20.0)),
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize)),
          ),
        ),
      ),
    );
  }
}
