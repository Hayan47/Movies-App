import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieInfoList extends StatelessWidget {
  final String title;
  final List values;
  const MovieInfoList({
    Key? key,
    required this.title,
    required this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: GoogleFonts.nunito(
            color: Colors.red,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(values.length, (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                  ),
                  height: 25,
                  child: Center(
                    child: Text(
                      '${values[index].name}',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
