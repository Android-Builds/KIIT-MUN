import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mun/ui/pages/announce.dart';
import 'package:mun/ui/pages/drawer/agendas.dart';
import 'package:mun/ui/pages/drawer/committee.dart';
import 'package:mun/ui/pages/drawer/about/about_page.dart';
import 'package:mun/ui/pages/drawer/credits.dart';
import 'package:mun/ui/pages/drawer/executuve_board.dart';
import 'package:mun/ui/pages/drawer/partners.dart';
import 'package:mun/ui/pages/drawer/sponsors.dart';
import 'package:mun/ui/widgets/media_buttons.dart';
import 'package:mun/utils/constants.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    TextStyle drawerStyle = TextStyle(
      fontSize: size.width * 0.035,
      fontWeight: FontWeight.w600,
    );
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(35.0),
              height: size.height * 0.4,
              width: size.width,
              color: darkMode ? Colors.white : Colors.black,
              child: Image.asset(
                darkMode ? '$eMunBlack' : '$eMunWhite',
              ),
            ),
            !done
                ? Container(
                    height: size.height * 0.1,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MiniMediaButtons(
                          icon: FontAwesomeIcons.facebookF,
                          url: 'https://www.facebook.com/kiitmun',
                        ),
                        MiniMediaButtons(
                          icon: FontAwesomeIcons.instagram,
                          url: 'https://www.instagram.com/instakiitmun/',
                        ),
                        MiniMediaButtons(
                          icon: FontAwesomeIcons.twitter,
                          url: 'https://twitter.com/kiitmun?s=08',
                        ),
                        MiniMediaButtons(
                          icon: FontAwesomeIcons.linkedinIn,
                          url: 'https://www.linkedin.com/in/kiitmun',
                        ),
                        MiniMediaButtons(
                          icon: FontAwesomeIcons.chrome,
                          url: 'https://kiitmun.org/',
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
            ListTile(
              title: Text(
                'Committees',
                style: drawerStyle,
              ),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommittePage()),
                  );
                }),
              },
            ),
            ListTile(
              title: Text(
                'Executive Board',
                style: drawerStyle,
              ),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExecutiveBoard()),
                  );
                }),
              },
            ),
            ListTile(
              title: Text(
                'Agendas',
                style: drawerStyle,
              ),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Agendas()),
                  );
                }),
              },
            ),
            // ListTile(
            //   title: Text('Announce'),
            //   onTap: () => {
            //     Navigator.pop(context),
            //     Future.delayed(const Duration(milliseconds: 150), () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => Announce()),
            //       );
            //     }),
            //   },
            // ),
            ListTile(
              title: Text(
                'Partners',
                style: drawerStyle,
              ),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Partners()),
                  );
                }),
              },
            ),
            ListTile(
              title: Text(
                'Sponsors',
                style: drawerStyle,
              ),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sponsors()),
                  );
                }),
              },
            ),
            ExpansionTile(
              title: Text(
                'About',
                style: drawerStyle,
              ),
              children: List.generate(
                abouts.length,
                (index) {
                  return ListTile(
                    title: Text(
                      abouts[index].name,
                      style: GoogleFonts.montserrat(
                        fontSize: size.width * 0.03,
                      ),
                    ),
                    onTap: () => {
                      Navigator.pop(context),
                      Future.delayed(const Duration(milliseconds: 150), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutPage(
                              index: index,
                            ),
                          ),
                        );
                      }),
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: Text(
                'Credits',
                style: drawerStyle,
              ),
              onTap: () => {
                Navigator.pop(context),
                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Credits()),
                  );
                }),
              },
            )
          ],
        ),
      ),
    );
  }
}
