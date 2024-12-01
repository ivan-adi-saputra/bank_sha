import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_friendly_tips.dart';
import 'package:bank_sha/ui/widgets/home_send_again_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_transactions_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendlyTips(),
        ],
      ),
    );
  }

  Widget customBottomNavigationBar() {
    return BottomAppBar(
      color: whiteColor,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 6,
      elevation: 0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        elevation: 0,
        selectedItemColor: blueColor,
        unselectedItemColor: blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: blueTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 10,
        ),
        unselectedLabelStyle: blackTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 10,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_overview.png',
              height: 20,
              color: blueColor,
            ),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_history.png',
              height: 20,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_statistic.png',
              height: 20,
            ),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_reward.png',
              height: 20,
            ),
            label: 'Reward',
          ),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy,',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'ivanadisaputra',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              )
            ],
          ),
          // profile
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_profile.png'),
                ),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 16,
                  width: 16,
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
          )
        ],
      ),
    );
  }

  Widget buildWalletCard() {
    return Container(
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/img_bg_card.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ivan Adi Saputra',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 6574',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 18,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: whiteTextStyle,
          ),
          Text(
            'Rp 12.500',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          // text
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55% ',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'of Rp 20.000',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightGreyColor,
              minHeight: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                title: 'Top Up',
                iconUrl: 'ic_topup.png',
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                title: 'Send',
                iconUrl: 'ic_send.png',
                onTap: () {},
              ),
              HomeServiceItem(
                title: 'Withdraw',
                iconUrl: 'ic_withdraw.png',
                onTap: () {},
              ),
              HomeServiceItem(
                title: 'More',
                iconUrl: 'ic_more.png',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 14),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
              child: const Column(
                children: [
                  HomeTransactionsItem(
                    title: 'Top Up',
                    time: 'Yesterday',
                    value: '+ 450.000',
                    iconUrl: 'ic_transaction_cat1.png',
                  ),
                  HomeTransactionsItem(
                    title: 'Top Up',
                    time: 'Yesterday',
                    value: '+ 450.000',
                    iconUrl: 'ic_transaction_cat2.png',
                  ),
                  HomeTransactionsItem(
                    title: 'Top Up',
                    time: 'Yesterday',
                    value: '+ 450.000',
                    iconUrl: 'ic_transaction_cat3.png',
                  ),
                  HomeTransactionsItem(
                    title: 'Top Up',
                    time: 'Yesterday',
                    value: '+ 450.000',
                    iconUrl: 'ic_transaction_cat4.png',
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeSendAgainItem(
                  username: 'yuanita',
                  imageUrl: 'img_friend1.png',
                ),
                HomeSendAgainItem(
                  username: 'urip',
                  imageUrl: 'img_friend2.png',
                ),
                HomeSendAgainItem(
                  username: 'saputra',
                  imageUrl: 'img_friend3.png',
                ),
                HomeSendAgainItem(
                  username: 'john',
                  imageUrl: 'img_friend4.png',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
              HomeFriendlyTips(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/',
              ),
              HomeFriendlyTips(
                imageUrl: 'assets/img_tips2.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/',
              ),
              HomeFriendlyTips(
                imageUrl: 'assets/img_tips3.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/',
              ),
              HomeFriendlyTips(
                imageUrl: 'assets/img_tips4.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
