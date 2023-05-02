import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const AccountTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 85,
      width: 330,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Row(
          children: [
            Container(
              height: 50,
              width: 55,
              decoration: BoxDecoration(
                  color: const Color(0xFF0E0E52),
                  borderRadius: BorderRadius.circular(12)),
              child:  Center(
                child: SvgPicture.asset(imagePath, color: Colors.white,)
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            //x
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  title,
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
//XX
