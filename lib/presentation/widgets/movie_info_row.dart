import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieInfo extends StatelessWidget {
  final String title;
  final String value;

  const MovieInfo({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.nunito(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
