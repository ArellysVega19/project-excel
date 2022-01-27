import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: builBoxDecoration(),
      height: 60,
      child: Row(
        children: [
          Container(
            child: Image(
              image: AssetImage('logoSinFondo.png'),
              width: 150,
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Exportar excel',
                    style: GoogleFonts.montserratAlternates(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  'Comercial Japonesa Automotriz Cía. Ltda.',
                  style: GoogleFonts.montserratAlternates(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration builBoxDecoration() => BoxDecoration(color: Color(0xD9b22222));
}
