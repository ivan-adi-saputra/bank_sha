import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_users.dart';
import 'package:bank_sha/ui/widgets/transfer_result.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController searchController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
            controller: searchController,
          ),
          // buildRecentUsers(),
          buildResult(),
          const SizedBox(
            height: 270,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          )
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUsers(
            name: 'Yoanna Jie',
            username: 'yoenna',
            imgUrl: 'assets/img_friend1.png',
            isVerified: true,
          ),
          const TransferRecentUsers(
            name: 'John Hi',
            username: 'jhi',
            imgUrl: 'assets/img_friend2.png',
          ),
          const TransferRecentUsers(
            name: 'Masayoshi',
            username: 'form',
            imgUrl: 'assets/img_friend3.png',
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            runSpacing: 17,
            spacing: 17,
            children: [
              TransferResult(
                name: 'Yoanna Jie',
                username: 'yoenna',
                imgUrl: 'assets/img_friend1.png',
                isVerified: true,
              ),
              TransferResult(
                name: 'John Hi',
                username: 'jhi',
                imgUrl: 'assets/img_friend2.png',
              ),
              TransferResult(
                name: 'Masayoshi',
                username: 'form',
                imgUrl: 'assets/img_friend3.png',
              ),
            ],
          )
        ],
      ),
    );
  }
}
