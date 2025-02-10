// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/core/services/storage_service.dart';

import '../../../../config/theme/style.dart';

class DashboardAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
    required this.identification,
  });
  final bool identification;

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        SizeConfig.screenWidth!,
        SizeConfig.screenheigth! * 0.20,
      );
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  bool estIdentifie = false;
  StorageService storageService = StorageService();
  final GetStorage _box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInd();
  }

  Future<void> getInd() async {
    setState(() {
      estIdentifie = _box.read("identification") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("IDENTIFICATION ${widget.identification}");

    /// Screeen size  config
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: kprimary,
      leading: IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        icon: const Icon(Icons.menu_open, size: 30, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer(); //
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kborder),
          bottomRight: Radius.circular(kborder),
        ),
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.all(kborder),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.blockHorizontal! * 10.0),
            Text("Bienvenue chez Kori",
                style: koriTextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockHorizontal! * 5.0,
                  fontWeight: FontWeight.w400,
                )),
            !widget.identification
                ? Row(
                    children: [
                      Text(
                        "Identifiez votre compte Kori. ",
                        style: koriTextStyle(
                          color: ksecondary.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        " Identification ",
                        style: koriTextStyle(color: ksecondary),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.pushNamed(IDENTIFICATION);
                        },
                        icon: const Icon(
                          HugeIcons.strokeRoundedArrowRight04,
                          color: ksecondary,
                        ),
                      )
                    ],
                  )
                : const Text(''),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: kborder),
            //   width: double.infinity,
            //   child: KoriButtonIcon(
            //     labelText: "Envoyer de l'argent",
            //     onPressed: () {
            //       if (!widget.identification) {
            //         koriScaffoldMessage(
            //           context,
            //           "Accéss limité au service. Complèté votre KYC",
            //           statut: Statut.WARNING,
            //         );
            //       } else {
            //         context.pushNamed(ENVOYERARGENT);
            //       }
            //     },
            //     icon: HugeIcons.strokeRoundedMoneySend01,
            //     color: kprimary,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
