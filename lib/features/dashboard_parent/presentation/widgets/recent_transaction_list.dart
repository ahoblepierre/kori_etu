import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class RecentTransactionList extends StatelessWidget {
  const RecentTransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenheigth! / 6.7,
      padding: const EdgeInsets.symmetric(horizontal: kborder),
      child: Column(
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              'https://images.pexels.com/photos/29560418/pexels-photo-29560418/free-photo-of-homme-elegant-avec-des-lunettes-sur-fond-urbain.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              width: SizeConfig.blockVertical! * 7.5,
                              height: SizeConfig.blockVertical! * 7.5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        ),
                        const Text("Grace Hopper")
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
