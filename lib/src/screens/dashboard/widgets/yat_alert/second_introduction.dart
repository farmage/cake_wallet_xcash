import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/yat_bar.dart';
import 'package:cake_wallet/src/screens/dashboard/widgets/yat_alert/yat_page_indicator.dart';
import 'package:cake_wallet/src/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cake_wallet/palette.dart';

class SecondIntroduction extends StatelessWidget {
  SecondIntroduction({this.onClose, this.onNext});

  final VoidCallback onClose;
  final VoidCallback onNext;
  final image = Image.asset('assets/images/emoji_second_intro.png');

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
                                  flex: 4,
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
                                    'One emoji address to rule them all',
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
                                        'Your Yat is a single unique emoji address that replaces all of your long hexadecimal addresses for all of your currencies.',
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
                                PrimaryButton(
                                    text: 'Next',
                                    textColor: Colors.white,
                                    color: Palette.protectiveBlue,
                                    onPressed: onNext
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: YatPageIndicator(filled: 1)
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