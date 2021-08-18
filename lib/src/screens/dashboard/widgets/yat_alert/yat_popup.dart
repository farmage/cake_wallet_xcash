import 'package:cake_wallet/palette.dart';
import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/first_introduction.dart';
import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/second_introduction.dart';
import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/third_introduction.dart';
import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/yat_close_button.dart';
import 'package:cake_wallet/src/widgets/alert_background.dart';
import 'package:cake_wallet/src/widgets/primary_button.dart';
import 'package:cake_wallet/view_model/dashboard/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class YatPopup extends StatelessWidget {
  YatPopup({this.dashboardViewModel, this.onClose});

  final DashboardViewModel dashboardViewModel;
  final VoidCallback onClose;
  final image = Image.asset('assets/images/emoji_popup.png');

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        AlertBackground(
          child: Container()
        ),
        SlideInUp(
          from: 420,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)),
              child: Container(
                height: 420,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(24, 15, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            YatCloseButton(onClose: onClose)
                          ]
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 64,
                              width: 165,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius
                                    .all(Radius.circular(32)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 15,
                                    offset: Offset(0, 5)
                                  )
                                ]
                              ),
                              child: image
                            )
                          ]
                        )
                      ]
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 6, right: 6),
                      child: Column(
                          children: [
                            Text(
                                'Your wallet address is now emojified.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                    'You can now send and receive crypto in Cake Wallet with your Yat - a short, emoji-based username',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    )
                                )
                            )
                          ]
                      )
                    ),
                    PrimaryButton(
                      text: 'Learn More',
                      textColor: Colors.white,
                      color: Palette.protectiveBlue,
                      onPressed: () => dashboardViewModel
                          .isShowFirstYatIntroduction = true
                    )
                  ],
                )
              )
          ),
        ),
        Observer(builder: (_) => dashboardViewModel.isShowFirstYatIntroduction
            ? SlideInRight(
                from: screenWidth,
                child: FirstIntroduction(
                  onClose: onClose,
                  onNext: () => dashboardViewModel
                      .isShowSecondYatIntroduction = true
                ))
            : Container()
        ),
        Observer(builder: (_) => dashboardViewModel.isShowSecondYatIntroduction
            ? SlideInRight(
                from: screenWidth,
                child: SecondIntroduction(
                  onClose: onClose,
                  onNext: () => dashboardViewModel
                      .isShowThirdYatIntroduction = true
                ))
            : Container()
        ),
        Observer(builder: (_) => dashboardViewModel.isShowThirdYatIntroduction
            ? SlideInRight(
                from: screenWidth,
                child: ThirdIntroduction(
                  onClose: onClose,
                  onGet: () {},
                  onConnect: () {}
                ))
            : Container()
        )
      ],
    );
  }
  
}