import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/extensions/image_extensions.dart';

import '../../../../../core/constants/app/app_login_constants.dart';
import '../../../../../core/constants/contant_values/kvalues.dart';
import '../../../../../core/constants/enum/image_enum.dart';

class CubitLoginTabbar extends StatefulWidget {
  const CubitLoginTabbar({super.key});

  @override
  State<CubitLoginTabbar> createState() => _CubitLoginTabbarState();
}

class _CubitLoginTabbarState extends State<CubitLoginTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: AppLoginConstants.models.length,
        child: Scaffold(
          body: Column(
            children: [
              Stack(children: [
                const _LoginImage(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: TabBar(
                      //controller: controller,
                      tabs: AppLoginConstants.models.map((e) {
                    return Tab(text: e.title);
                  }).toList()),
                )
              ]),
              Expanded(
                flex: 6,
                child: TabBarView(
                    children: AppLoginConstants.models.map((e) {
                  return e.page;
                }).toList()),
              )
            ],
          ),
        ));
  }
}

class _LoginImage extends StatelessWidget {
  const _LoginImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(ContantsValues.containerBottomRadius)),
        color: Colors.white,
      ),
      child: Lottie.asset(ImageEnum.LOGIN.imagePath),
    );
  }
}
