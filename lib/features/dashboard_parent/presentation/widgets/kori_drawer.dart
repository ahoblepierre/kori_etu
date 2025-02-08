import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/services/storage_service.dart';

class KoriDrawer extends StatelessWidget {
  const KoriDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kscaffoldBackgroundColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: kprimary,
            ),
            accountName: Text("John Doe",
                style: koriTextStyle(
                  color: ksecondaryLigth,
                  fontSize: 20,
                )),
            accountEmail: Text("john.doe@example.com",
                style: koriTextStyle(
                  color: ksecondaryLigth,
                  fontSize: 15,
                )),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/30122027/pexels-photo-30122027/free-photo-of-un-photographe-en-veste-jaune-capture-la-nature-de-l-automne.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
            ),
          ),
          ListTile(
            leading: const Icon(
              HugeIcons.strokeRoundedHome11,
              color: ksecondary,
            ),
            title: Text("Acceuil",
                style: koriTextStyle(color: Colors.black, fontSize: 20)),
            onTap: () {
              Navigator.pop(context); // Ferme le drawer
            },
          ),
          ListTile(
            leading: const Icon(
              HugeIcons.strokeRoundedUser,
              color: ksecondary,
            ),
            title: Text("Profile",
                style: koriTextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              HugeIcons.strokeRoundedSettings01,
              color: ksecondary,
            ),
            title: Text("Paramètre",
                style: koriTextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(), // Ligne de séparation
          ListTile(
            leading: const Icon(
              HugeIcons.strokeRoundedLogout03,
              color: ksecondary,
            ),
            title: Text("Déconnexon",
                style: koriTextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            onTap: () {
              StorageService storageService = StorageService();
              storageService.removeAllCache();
              // Navigator.pop(context);
              context.pushReplacementNamed(REGISTER);
            },
          ),
        ],
      ),
    );
  }
}
