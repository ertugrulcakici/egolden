import 'package:egolden/core/services/navigation/navigation_service.dart';
import 'package:egolden/font_awesome_icons_icons.dart';
import 'package:egolden/product/constants/navigation_constants.dart';
import 'package:egolden/view/home/viewmodel/home_viewmodel.dart';
import 'package:egolden/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  ChangeNotifierProvider<HomeViewModel> homeProvider;
  ProfileView({Key? key, required this.homeProvider}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ChangeNotifierProvider<ProfileViewModel> provider =
      ChangeNotifierProvider<ProfileViewModel>((context) => ProfileViewModel());

  @override
  void initState() {
    NavigationService.setTitleAndUrl("Profil", NavigationConstants.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _hizliIslemler(),
              _hesapAyarlari(),
              const ListTile(
                title: Text("Çıkış yap"),
                trailing: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _hesapAyarlari() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Hesap ayarları",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp)))),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              ListTile(
                title: Text("Profil Bilgileri"),
                leading: Icon(Icons.account_circle_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Güvenlik ayarları"),
                  leading: Icon(Icons.lock)),
              ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Siparişlerim"),
                  leading: Icon(FontAwesomeIcons.inbox)),
              ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Adres bilgileri"),
                  leading: Icon(Icons.location_on)),
              ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Ödeme bilgileri"),
                  leading: Icon(Icons.payment))
            ],
          ),
        ],
      ),
    );
  }

  _hizliIslemler() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Hızlı işlemler",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp)))),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Icon(Icons.history),
                    SizedBox(height: 10),
                    Text("Geçmiş\nsiparişlerin", textAlign: TextAlign.center)
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.history),
                    SizedBox(height: 10),
                    Text("Baktığın\nürünler", textAlign: TextAlign.center)
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.assignment_return),
                    SizedBox(height: 10),
                    Text("İptal ve\niadelerin", textAlign: TextAlign.center)
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.replay_outlined),
                    SizedBox(height: 10),
                    Text("Tekrar\nsatın al", textAlign: TextAlign.center)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
