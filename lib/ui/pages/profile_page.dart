import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: state.user.profilePicture == null
                                ? const AssetImage('assets/img_profile.png')
                                : NetworkImage(state.user.profilePicture!),
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: state.user.verified == 1
                            ? Align(
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
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // name
                      Text(
                        state.user.name.toString(),
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
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
                            Navigator.pushNamed(context, '/profile-edit');
                          }
                        },
                      ),
                      ProfileMenuItem(
                        title: 'My PIN',
                        iconUrl: 'assets/ic_pin.png',
                        onTap: () async {
                          if (await Navigator.pushNamed(context, '/pin') ==
                              true) {
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
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
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
            );
          }

          return Container();
        },
      ),
    );
  }
}
