import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeSendAgainItem extends StatelessWidget {
  final String username;
  final String imageUrl;
  final VoidCallback? onTap;

  const HomeSendAgainItem({
    super.key,
    required this.username,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 90,
        margin: const EdgeInsets.only(right: 17),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profile
            Container(
              height: 45,
              width: 45,
              margin: const EdgeInsets.only(bottom: 13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // username
            Text(
              '@$username',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
