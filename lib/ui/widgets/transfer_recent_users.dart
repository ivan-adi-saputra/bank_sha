import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUsers extends StatelessWidget {
  final UserModel user;

  const TransferRecentUsers({
    super.key,
    required this.user,
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
                image:
                    user.profilePicture == null || user.profilePicture!.isEmpty
                        ? const AssetImage(
                            'assets/img_profile.png',
                          )
                        : NetworkImage(user.profilePicture!) as ImageProvider,
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
                user.name.toString(),
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@${user.username}',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          // verified badge
          if (user.verified == 1) verified(),
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
