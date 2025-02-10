import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/utils/utils.dart';

class RecentTransactionList extends StatelessWidget {
  const RecentTransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: remitters.isEmpty
          ? SizeConfig.screenWidth! / 7.5
          : SizeConfig.screenheigth! / 6.7,
      padding: const EdgeInsets.symmetric(horizontal: kborder),
      child: remitters.isEmpty
          ? Text(
              "Aucune transaction récent",
              style: koriTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transferts récents",
                  style: koriTextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.blockHorizontal! * 3.5,
                  ),
                ),
                SizedBox(height: SizeConfig.blockVertical! * 0.5),
                SizedBox(
                  height: SizeConfig.blockVertical! * 10.5,
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: remitters.length,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: HugeIcon(
                                  icon: HugeIcons.strokeRoundedUserSharing,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              // CachedNetworkImage(
                              //   imageUrl:
                              //       'https://images.pexels.com/photos/29560418/pexels-photo-29560418/free-photo-of-homme-elegant-avec-des-lunettes-sur-fond-urbain.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                              //   imageBuilder: (context, imageProvider) {
                              //     return Container(
                              //       width: SizeConfig.blockVertical! * 7.5,
                              //       height: SizeConfig.blockVertical! * 7.5,
                              //       decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           image: DecorationImage(
                              //             image: imageProvider,
                              //             fit: BoxFit.cover,
                              //           )),
                              //     );
                              //   },
                              // ),
                              Text("Grace Hopper")
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
