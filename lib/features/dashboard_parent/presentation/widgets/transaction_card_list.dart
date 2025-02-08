import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class TransactionCardList extends StatelessWidget {
  const TransactionCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Flexible(
      child: Container(
        height: SizeConfig.screenheigth! * 0.7,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kborder),
            topRight: Radius.circular(kborder),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Transaction d'aujourd'hui",
                  style: koriTextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.blockHorizontal! * 4.5,
                  )),
              subtitle: Text("0 transaction d'aujourd'hui",
                  style: koriTextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.blockHorizontal! * 3.5,
                  )),
              trailing: Container(
                padding: EdgeInsets.all(SizeConfig.blockHorizontal! * 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  shape: BoxShape.circle,
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowUpRight01,
                  color: kprimary.withOpacity(0.5),
                  size: 24.0,
                ),
              ),
            ),
            // const CenterText(),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: kborder,
                    ),
                    padding: const EdgeInsets.all(kborder),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kborder + 15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://placeholderimage.eu/api/800/600"),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Payer loyer",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Argent sortant",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "11/22/24 08:23",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                            "24000",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CenterText extends StatelessWidget {
  const CenterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Vous n'avez pas encore effectué de transactions.",
        style: koriTextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          fontSize: SizeConfig.blockHorizontal! * 3.5,
        ),
      ),
    );
  }
}
