import 'package:flutter/material.dart';
import 'package:ihun_jobfindie/configuration/constants/app_asset.dart';
import 'package:ihun_jobfindie/configuration/constants/app_spacing.dart';
import 'package:ihun_jobfindie/configuration/styles/palettes.dart';
import 'package:ihun_jobfindie/configuration/styles/text_styles.dart';

import '../../../core/widgets/app_appbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palettes.textWhite,
        appBar: buildPreferredSizeWidget(context),
        body: Column(
          children: [
            /// Profile card
            Container(
              height: 150,
              margin: allPadding16,
              padding: allPadding12,
              decoration: BoxDecoration(
                color: Palettes.textGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      AppAsset.profileBase,
                    ),
                  ),
                  horizontalMargin12,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyen Ngoc Linh',
                        style: TextStyles.customStyle.bold.mediumText.blackText,
                      ),
                      verticalMargin4,
                      Text(
                        'Human Resources Generalist',
                        style: TextStyles.customStyle2.blackText,
                      ),
                      verticalMargin4,
                      Text(
                        'Ho Chi Minh City, Vietnam',
                        style: TextStyles.customStyle2.smallText.blackText,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// User short bio

            Container(
              padding: allPadding12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Biography',
                    style: TextStyles.customStyle.mediumText.bold.blackText,
                  ),
                  verticalMargin4,
                  Text(
                    'I am a Human Resources Generalist with 5 years of experience assisting with and fulfilling organization staffing needs and requirements.',
                    style: TextStyles.customStyle2.blackText,
                  ),
                ],
              ),
            ),

            /// User stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: allPadding8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Apllied',
                        style: TextStyles.customStyle2.greyText.mediumText,
                      ),
                      Text(
                        '4',
                        style: TextStyles.customStyle.blackText.largeText,
                      ),
                    ],
                  ),
                ),
                horizontalMargin12,
                Container(
                  padding: allPadding8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Bookmarked',
                        style: TextStyles.customStyle2.greyText.mediumText,
                      ),
                      Text(
                        '190',
                        style: TextStyles.customStyle.blackText.largeText,
                      ),
                    ],
                  ),
                ),
                horizontalMargin12,
                Container(
                  padding: allPadding8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Shared',
                        style: TextStyles.customStyle2.greyText.mediumText,
                      ),
                      Text(
                        '2',
                        style: TextStyles.customStyle.blackText.largeText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
