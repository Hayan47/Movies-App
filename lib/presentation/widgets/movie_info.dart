import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieInfo extends StatelessWidget {
  final String title;
  final String value;

  const MovieInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    //return  //Widget MovieInfo(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.karla(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Text(
          value,
          style: GoogleFonts.karla(
            color: Colors.white,
            fontSize: 16,
          ),
        )),
      ],
    );
  }
}
