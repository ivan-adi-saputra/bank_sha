import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ProviderItem extends StatelessWidget {
  final OperatorCardModel data;
  final bool isSelected;

  const ProviderItem({
    super.key,
    this.isSelected = false,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(
                color: blueColor,
                width: 2,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            data.thumbnail!,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.name!,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                data.status!,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
