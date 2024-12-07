import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResult extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;
  final bool isVerified;
  final bool isSelected;

  const TransferResult({
    super.key,
    required this.name,
    required this.username,
    required this.imgUrl,
    this.isVerified = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 155,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_profile.png'),
              ),
              shape: BoxShape.circle,
            ),
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/ic_check.png'),
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: whiteColor,
                          width: 2,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 13,
          ),
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
    );
  }
}
