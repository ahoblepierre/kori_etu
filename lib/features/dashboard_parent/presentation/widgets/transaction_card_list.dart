import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/controller/transaction_controller.dart';
import 'package:kori_etu/core/resources/transaction.dart';

class TransactionCardList extends StatefulWidget {
  const TransactionCardList({
    super.key,
  });

  @override
  State<TransactionCardList> createState() => _TransactionCardListState();
}

class _TransactionCardListState extends State<TransactionCardList> {
  final TransactionController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              subtitle:
                  Text("${allTransactions.length} transaction(s) d'aujourd'hui",
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
            Obx(() {
              if (controller.transactions.isEmpty) {
                return const CenterText();
              }
              return Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    Transaction transaction = controller.transactions[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: kborder,
                      ),
                      padding: const EdgeInsets.all(kborder),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kborder + 5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HugeIcon(
                            icon: HugeIcons
                                .strokeRoundedArrowDataTransferHorizontal,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Text(
                                    transaction.getNames,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  transaction.description,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Text(
                                  transaction.getCreatedAt,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Text(
                              transaction.amount,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
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
