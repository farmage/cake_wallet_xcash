import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/yat_bar.dart';
import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/yat_page_indicator.dart';
import 'package:cake_wallet/src/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cake_wallet/palette.dart';

class ThirdIntroduction extends StatelessWidget {
  ThirdIntroduction({this.onClose, this.onGet, this.onConnect});

  final VoidCallback onClose;
  final VoidCallback onGet;
  final VoidCallback onConnect;
  final image = Image.asset('assets/images/emoji_third_intro.png');

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: 90,
                padding: EdgeInsets.only(top: 40, left: 24, right: 24),
                child: YatBar(onClose: onClose)
            ),
            Container(
                height: screenHeight - 90,
                padding: EdgeInsets.only(bottom: 24),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                              children: [
                                Flexible(
                                    flex: 1,
                                    child: Container()
                                ),
                                Flexible(
                                    flex: 5,
                                    child: image
                                ),
                                Flexible(
                                    flex: 1,
                                    child: Container()
                                )
                              ]
                          )
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                              children: [
                                Text(
                                    'Yat plays nicely with others',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                        'Yats live outside of Cake Wallet, too. Any wallet address on earth can be replaced with a Yat!',
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
                      Container(
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PrimaryIconButton(
                                    text: 'Get your Yat',
                                    textColor: Colors.white,
                                    color: Palette.protectiveBlue,
                                    borderColor: Palette.protectiveBlue,
                                    iconColor: Colors.white,
                                    iconBackgroundColor: Colors.transparent,
                                    iconData: CupertinoIcons
                                        .arrow_up_right_square,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    onPressed: onGet),
                                Padding(
                                  padding: EdgeInsets.only(top: 12),
                                  child: PrimaryIconButton(
                                    text: 'Connect an existing Yat',
                                    textColor: Colors.black,
                                    color: Palette.blueAlice,
                                    borderColor: Palette.blueAlice,
                                    iconColor: Colors.black,
                                    iconBackgroundColor: Colors.transparent,
                                    iconData: CupertinoIcons
                                        .arrow_up_right_square,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    onPressed: onConnect)
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: YatPageIndicator(filled: 2)
                                )
                              ]
                          )
                      )
                    ]
                )
            )
          ],
        )
    );
  }
}