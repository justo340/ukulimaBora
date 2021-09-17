import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/Shared/Widgets/common_appbar.dart';
import 'package:ukulimabora/routes/routes.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UkulimaBoraCommonColors.appVeryBlackColor,
        body: Column(
          children: <Widget>[
            CommonAppBar(label: UkulimaBoraCommonText.profileMessage),
            ProfileAvatar(),
            const SizedBox(
              height: 10,
            ),
            ProfileSubHeaders(
              title: UkulimaBoraCommonText.personalInfoHeader,
            ),
            PersonalInfoCard(),
            const SizedBox(
              height: 10,
            ),
            ProfileSubHeaders(
              title: UkulimaBoraCommonText.applicationInfoHeader,
            ),
            UkulimaBoraInfoCard(),
            CommonAppButton(
                buttonText: UkulimaBoraCommonText.logoutText,
                buttonAction: () async {
                  Navigator.of(context).pushNamed(loginRoute);
                },
                buttonColor: UkulimaBoraCommonColors.appGreenColor,
                textColor: UkulimaBoraCommonColors.appBackgroudColor)
          ],
        ));
  }
}

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
      child: CircleAvatar(
          backgroundColor: UkulimaBoraCommonColors.appGreenColor,
          radius: 60,
          child: const Icon(
            Icons.person,
            size: 50,
          )),
    );
  }
}

class ProfileSubHeaders extends StatelessWidget {
  const ProfileSubHeaders({@required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
      child: Text(title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: UkulimaBoraCommonColors.appBackgroudColor,
          )),
    );
  }
}

class PersonalInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
      child: Card(
        shadowColor: UkulimaBoraCommonColors.appBackgroudColor,
        elevation: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: <Color>[
                  Colors.green.shade500,
                  UkulimaBoraCommonColors.appVeryBlackColor
                ]),
          ),
          padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ProfileInfoData(
                data: 'Name',
                icon: Icons.person,
              ),
              UkulimaBoraDivider.normaldivider,
              const ProfileInfoData(
                data: '0723243543',
                icon: Icons.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoData extends StatelessWidget {
  const ProfileInfoData({
    @required this.data,
    @required this.icon,
  });

  final String data;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: UkulimaBoraCommonColors.appBackgroudColor,
            size: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            data,
            style: TextStyle(
                color: UkulimaBoraCommonColors.appBackgroudColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class UkulimaBoraInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
        child: Card(
            shadowColor: UkulimaBoraCommonColors.appBackgroudColor,
            elevation: 2,
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: <Color>[
                        Colors.green.shade500,
                        UkulimaBoraCommonColors.appVeryBlackColor
                      ]),
                ),
                padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const ProfileInfoData(
                      data: 'credits',
                      icon: Icons.edit,
                    ),
                    UkulimaBoraDivider.normaldivider,
                    const ProfileInfoData(
                      data: '0723243543',
                      icon: Icons.phone,
                    ),
                  ],
                ))));
  }
}
