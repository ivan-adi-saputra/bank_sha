import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel data;
  final bool isSelected;

  const PackageItem({
    super.key,
    required this.data,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171,
      width: 155,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.name!,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            formatCurrency(data.price!),
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
