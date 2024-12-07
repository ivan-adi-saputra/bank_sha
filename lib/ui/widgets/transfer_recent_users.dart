import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUsers extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;

  const TransferRecentUsers({
    super.key,
    required this.name,
    required this.username,
    required this.imgUrl,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          // image
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          // name and username
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@$username',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          // verified badge
          if (isVerified) verified(),
        ],
      ),
    );
  }

  Widget verified() {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          size: 14,
          color: greenColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          'Verified',
          style: greenTextStyle.copyWith(
            fontSize: 11,
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
