import 'package:flutter/material.dart';

import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/routes/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                UkulimaBoraCommonColors.appLightGreenColor,
                UkulimaBoraCommonColors.appVeryBlackColor
              ]),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(slivers: <Widget>[
          const HomeHeader(),
          HomeBody(),
        ]));
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      stretch: true,
      floating: true,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height / 4,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Text(
            UkulimaBoraCommonText.appName,
            style: TextStyle(color: UkulimaBoraCommonColors.appBackgroudColor),
          ),
        ),
        background: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/home_background.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(locationRoute),
          child: Container(
            padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(200))),
            child: Image.asset(
              'assets/images/map.png',
              width: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(addFarmRoute),
          child: Image.asset(
            'assets/images/add.png',
            color: UkulimaBoraCommonColors.appBackgroudColor,
            width: 40,
          ),
        ),
        Container(
          padding: UkulimaBoraCustomSpaces.smallMarginSpacing,
          child: CircleAvatar(
            backgroundColor: UkulimaBoraCommonColors.appBackgroudColor,
            radius: 25,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(profileRoute),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Column(
        children: <Widget>[
          const HomeWeatherCard(),
          Container(
            padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
            color: Colors.transparent,
            child: Text(
              UkulimaBoraCommonText.todayQuestionText,
              style: TextStyle(
                  fontSize: 16, color: UkulimaBoraCommonColors.appWhiteColor),
            ),
          ),
          Container(
            padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TaskChoiceCard(
                  buttonAction: () {},
                  taskImage: 'assets/images/land_prep.png',
                  taskName: UkulimaBoraActivities.land,
                ),
                TaskChoiceCard(
                  buttonAction: () {},
                  taskImage: 'assets/images/plant.png',
                  taskName: UkulimaBoraActivities.plant,
                ),
                TaskChoiceCard(
                  buttonAction: () {},
                  taskImage: 'assets/images/fertilizer.png',
                  taskName: UkulimaBoraActivities.fertilizer,
                ),
              ],
            ),
          ),
          Container(
            padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TaskChoiceCard(
                  buttonAction: () {},
                  taskImage: 'assets/images/irrigate.png',
                  taskName: UkulimaBoraActivities.irrigate,
                ),
                TaskChoiceCard(
                  buttonAction: () {},
                  taskImage: 'assets/images/pesticide.png',
                  taskName: UkulimaBoraActivities.pesticide,
                ),
                TaskChoiceCard(
                  buttonAction: () {},
                  taskImage: 'assets/images/harvest.png',
                  taskName: UkulimaBoraActivities.havest,
                ),
              ],
            ),
          ),
        ],
      );
    }, childCount: 1));
  }
}

class HomeWeatherCard extends StatelessWidget {
  const HomeWeatherCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
      child: GestureDetector(
        onTap: () {},
        child: Card(
            elevation: 3,
            child: Container(
                decoration: BoxDecoration(
                  color: UkulimaBoraCommonColors.appVeryBlackColor,
                ),
                padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/weather.png',
                      width: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Weather Forcasts',
                      style: TextStyle(
                          color: UkulimaBoraCommonColors.appBackgroudColor,
                          fontSize: 18),
                    )
                  ],
                ))),
      ),
    );
  }
}

class TaskChoiceCard extends StatelessWidget {
  const TaskChoiceCard({
    @required this.taskName,
    @required this.taskImage,
    @required this.buttonAction,
  });

  final String taskName;
  final String taskImage;
  final Function() buttonAction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 3,
          child: InkWell(
            splashColor: UkulimaBoraCommonColors.appGreenColor.withAlpha(30),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: <Color>[
                      Colors.green.shade500,
                      UkulimaBoraCommonColors.appVeryBlackColor
                    ]),
              ),
              height: 100,
              width: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      taskImage,
                      height: 50,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      taskName,
                      style: TextStyle(
                          color: UkulimaBoraCommonColors.appBackgroudColor,
                          fontSize: 14),
                    ),
                  ]),
            ),
          )),
    );
  }
}
