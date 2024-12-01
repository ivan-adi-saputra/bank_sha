import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // profile
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 26,
                      width: 26,
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
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // name
                Text(
                  'Ivan Adi Saputra',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // menu
                ProfileMenuItem(
                  title: 'Edit Profile',
                  iconUrl: 'assets/ic_edit_profile.png',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamed(context, '/profile-edit');
                    }
                  },
                ),
                ProfileMenuItem(
                  title: 'My PIN',
                  iconUrl: 'assets/ic_pin.png',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamed(context, '/profile-edit-pin');
                    }
                  },
                ),
                ProfileMenuItem(
                  title: 'Wallet Settings',
                  iconUrl: 'assets/ic_wallet.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'My Rewards',
                  iconUrl: 'assets/ic_my_rewards.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Help Center',
                  iconUrl: 'assets/ic_help.png',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  title: 'Log Out',
                  iconUrl: 'assets/ic_logout.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: CustomTextButton(
              title: 'Report a Problem',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
