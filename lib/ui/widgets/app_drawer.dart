import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mun/ui/pages/drawer/agendas.dart';
import 'package:mun/ui/pages/drawer/committee.dart';
import 'package:mun/ui/pages/drawer/about/about_page.dart';
import 'package:mun/ui/pages/drawer/credits.dart';
import 'package:mun/ui/pages/drawer/executuve_board.dart';
import 'package:mun/ui/pages/drawer/gallery.dart';
import 'package:mun/ui/pages/drawer/collaborators.dart';
import 'package:mun/ui/pages/drawer/sponsors.dart';
import 'package:mun/ui/pages/drawer/study_guide.dart';
import 'package:mun/ui/pages/drawer/uncharter.dart';
import 'package:mun/ui/widgets/media_buttons.dart';
import 'package:mun/utils/constants.dart';
import 'package:mun/utils/themes.dart';

import '../pages/drawer/commiteeLocation.dart';
import '../pages/drawer/pdf_viewer/view_pdf.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle drawerStyle = TextStyle(
      fontSize: size.width * 0.035,
      fontWeight: FontWeight.w600,
    );
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.2,
            padding: EdgeInsets.only(top: 10.0),
            width: size.width,
            color: !darkMode ? Colors.white : Colors.black,
            child: Image.asset(
              !darkMode ? '$eMunBlack' : '$eMunWhite',
              height: 20,
              fit: BoxFit.contain,
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
                        icon: FontAwesomeIcons.globe,
                        url: 'https://kiitmun.org/',
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ExpansionTile(
                  textColor: accentColor,
                  iconColor: accentColor,
                  title: Text('Committees', style: drawerStyle),
                  children: [
                    CardListTile(
                        title: 'Committee Details', path: CommittePage()),
                    // CardListTile(title: 'Agendas', path: Agendas()),
                    CardListTile(title: 'Study Guide', path: StudyGuide()),
                    CardListTile(
                        title: "Committees Location", path: CommitteLocation()),

                    //    Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ViewPdf(
                    //       url: studyGuide[index],
                    //       name: committeeNames[index],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                // CardListTile(title: 'Executive Board', path: ExecutiveBoard()),
                CardListTile(title: "UN Charter", path: UNCharter()),
                CardListTile(title: 'Collaborators', path: Partners()),
                CardListTile(title: 'Sponsors', path: Sponsors()),
                CardListTile(title: 'Gallery', path: Gallery()),

                ExpansionTile(
                  textColor: accentColor,
                  iconColor: accentColor,
                  title: Text('About', style: drawerStyle),
                  children: List.generate(
                    abouts.length,
                    (index) {
                      return CardListTile(
                        title: abouts[index].name,
                        path: AboutPage(index: index),
                      );
                    },
                  ),
                ),
                CardListTile(title: 'Credits', path: Credits()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardListTile extends StatelessWidget {
  const CardListTile({
    Key? key,
    required this.title,
    required this.path,
  }) : super(key: key);

  final String title;
  final Widget path;

  @override
  Widget build(BuildContext context) {
    TextStyle drawerStyleMini = TextStyle(
      fontSize: size.width * 0.03,
    );
    return ListTile(
      title: Text(title, style: drawerStyleMini),
      onTap: () => {
        Navigator.pop(context),
        Future.delayed(const Duration(milliseconds: 150), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => path),
          );
        }),
      },
    );
  }
}
