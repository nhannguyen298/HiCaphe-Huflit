import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class LienHe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // lienheCgp (107:232)
          padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 19*fem, 27*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
            image: DecorationImage (
              fit: BoxFit.cover,
              image: AssetImage (
                'assets/page-1/images/hinhnen1-bg.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupuch6bDA (8Q6qY9xtJeHtV4SJARUCh6)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // vectorUGx (107:248)
                      margin: EdgeInsets.fromLTRB(0*fem,30*fem, 81*fem, 0*fem),
                      width: 32*fem,
                      height: 32*fem,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);

                        },
                        child: Image.asset(
                          'assets/page-1/images/vector.png',
                          width: 32*fem,
                          height: 32*fem,
                        ),
                      ),
                    ),
                    Container(
                      // autogroupgvsznoS (8Q6qez6qaGjs8ux3s3Gvsz)
                      margin: EdgeInsets.fromLTRB(0*fem, 16*fem, 0*fem, 0*fem),
                      width: 120*fem,
                      height: 133*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // logomauJmn (107:234)
                            left: 1*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 100*fem,
                                height: 100*fem,
                                child: Image.asset(
                                  'assets/page-1/images/logomau.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // txtilgioithieu4pVE (107:237)
                            left: 0*fem,
                            top: 98*fem,
                            child: Align(
                              child: SizedBox(
                                width: 210*fem,
                                height: 35*fem,
                                child: Text(
                                  'Liên hệ',
                                  style: SafeGoogleFont (
                                    'Quicksand',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25*ffem/fem,
                                    letterSpacing: 1*fem,
                                    color: Color(0xff993300),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroup44jj6he (8Q6qm4m3HmehT3xNFm44jJ)
                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 81*fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // emailmarketingRzp (107:243)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                      width: 35*fem,
                      height: 32*fem,
                      child: Image.asset(
                        'assets/page-1/images/email-marketing.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // txtilgioithieu4k1W (107:238)
                      margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 3*fem),
                      child: ElevatedButton(
                        onPressed: () async{
                          String? encodeQueryParameters(Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }
                          final Uri email = Uri(
                            scheme: 'mailto',
                            path: "khachhang@hicaphe.onmicrosoft.com",
                            query: encodeQueryParameters(<String, String>{
                              'subject': 'Ý kiến của khách hàng',
                              'body':'Nhập ý kiến của bạn'
                            }),
                          );
                          if(await canLaunchUrl(email)){
                            await launchUrl(email);
                          }
                          else{
                            print('Cannot contact to HiCaPhe');
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: LinearBorder(side: BorderSide(width: 0)),

                        ),
                        child: Text(
                          '@hicaphe.onmicrosoft.com',
                          style: SafeGoogleFont (
                            'Quicksand',
                            fontSize: 12*ffem,
                            textStyle: TextStyle(
                              overflow: TextOverflow.ellipsis
                            ),
                            fontWeight: FontWeight.w400,
                            height: 1.25*ffem/fem,
                            letterSpacing: 1*fem,
                            color: Color(0xff993300),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),//Emaill
              Container(
                // autogroupqcacr4Y (8Q6qs9RF1GZXmBxgeUqCac)
                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 79*fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // facebookBMi (107:244)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                      width: 32*fem,
                      height: 32*fem,
                      child: Image.asset(
                        'assets/page-1/images/facebook.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // txtilgioithieu46ja (107:242)
                      'fb.com/hicaphe',
                      style: SafeGoogleFont (
                        'Quicksand',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25*ffem/fem,
                        letterSpacing: 1*fem,
                        color: Color(0xff993300),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupqw2qqSG (8Q6qyZQDrbw6SykJjNqw2Q)
                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 77*fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // instagramxFz (107:245)
                      margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 22*fem, 0*fem),
                      width: 32*fem,
                      height: 32*fem,
                      child: Image.asset(
                        'assets/page-1/images/instagram.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // txtilgioithieu4gSt (107:239)
                      '@hicaphe',
                      style: SafeGoogleFont (
                        'Quicksand',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25*ffem/fem,
                        letterSpacing: 1*fem,
                        color: Color(0xff993300),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupgfyzcrL (8Q6r595FsM9qCe5faqGfyz)
                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 100*fem, 75*fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // mapMov (107:246)
                      margin: EdgeInsets.fromLTRB(0*fem, 4*fem, 15*fem, 0*fem),
                      width: 32*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/page-1/images/smartphone.png',
                        fit: BoxFit.cover,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () async{
                        final Uri tele = Uri(
                          scheme: 'tel',
                          path: "0978163454",
                        );
                        if(await canLaunchUrl(tele)){
                          await launchUrl(tele);
                        }
                        else{
                          print('Cannot contact to HiCaPhe');
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: LinearBorder(side: BorderSide(width: 0)),

                      ),

                      child: Text(
                        // txtilgioithieu4hMz (107:240)
                        '0978163454',
                        style: SafeGoogleFont (
                          'Quicksand',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.25*ffem/fem,
                          letterSpacing: 1*fem,
                          color: Color(0xff993300),

                        ),
                      ),
                    ),
                  ],
                ),
              ),//Phone
              Container(
                // autogroup2dviRon (8Q6rAUFi2iXXB4aYff2DVi)
                margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 12*fem, 15*fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // smartphonexHv (107:247)
                      margin: EdgeInsets.fromLTRB(0*fem, 6*fem, 22*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/page-1/images/map.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // txtilgioithieu4sfn (107:241)
                      constraints: BoxConstraints (
                        maxWidth: 253*fem,
                      ),
                      child: Text(
                        '157, Đ.Tân Xuân 6, X.Tân Xuân, H.Hóc Môn. TP.HCM',
                        style: SafeGoogleFont (
                          'Quicksand',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.25*ffem/fem,
                          letterSpacing: 1*fem,
                          color: Color(0xff993300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
