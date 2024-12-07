import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/provider_item.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, '/data-package');
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                height: 55,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Balance: ${formatCurrency(18000000)}',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const ProviderItem(
            name: 'Telkomsel',
            imgUrl: 'assets/img_provider_telkomsel.png',
            isSelected: true,
          ),
          const ProviderItem(
            name: 'Indosat Ororedoo',
            imgUrl: 'assets/img_provider_indosat.png',
          ),
          const ProviderItem(
            name: 'Singtel ID',
            imgUrl: 'assets/img_provider_singtel.png',
          ),
        ],
      ),
    );
  }
}
