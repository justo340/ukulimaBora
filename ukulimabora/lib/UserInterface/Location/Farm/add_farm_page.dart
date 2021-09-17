import 'package:flutter/material.dart';
import 'package:ukulimabora/Shared/Common/constants.dart';
import 'package:ukulimabora/Shared/Widgets/common_app_button.dart';
import 'package:ukulimabora/Shared/Widgets/common_appbar.dart';
import 'package:ukulimabora/Shared/Widgets/common_text_input_field.dart';
import 'package:ukulimabora/routes/routes.dart';

class AddFarmPage extends StatefulWidget {
  @override
  _AddFarmPageState createState() => _AddFarmPageState();
}

class _AddFarmPageState extends State<AddFarmPage> {
  final GlobalKey<FormState> _addFarmFormKey = GlobalKey<FormState>();
  TextEditingController textController;
  String place;
  String description;
  String crop;
  String chosenCrop;
  List<String> crops = <String>[
    UkulimaBoraCrops.maizeText,
    UkulimaBoraCrops.bananaText,
    UkulimaBoraCrops.potatoText,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UkulimaBoraCommonColors.appVeryBlackColor,
        body: Column(
          children: <Widget>[
            CommonAppBar(label: UkulimaBoraCommonText.addFarmTitle),
            Container(
              padding: UkulimaBoraCustomSpaces.normalMarginSpacing,
              child: Form(
                  key: _addFarmFormKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30),
                      UkulimaBoraTextFormField(
                        hintStyle: TextStyle(
                            color: UkulimaBoraCommonColors.appBackgroudColor),
                        icon: Icon(
                          Icons.search,
                          size: 20,
                          color: UkulimaBoraCommonColors.appBackgroudColor,
                        ),
                        obscuretext: false,
                        style: TextStyle(
                            color: UkulimaBoraCommonColors.appBackgroudColor),
                        maximumLength: 10,
                        controller: textController,
                        hinttext: UkulimaBoraCommonText.placeText,
                        fillcolor: null,
                        keyboardtype: TextInputType.name,
                        validator: (String val) {
                          if (val.isEmpty) {
                            return UkulimaBoraCommonText.noPlaceMessage;
                          }
                          return null;
                        },
                        onchanged: (String val) {
                          place = val;
                        },
                        onsaved: (String val) {
                          place = val;
                          return;
                        },
                      ),
                      const SizedBox(height: 30),
                      UkulimaBoraTextFormField(
                        icon: Icon(
                          Icons.note_rounded,
                          size: 20,
                          color: UkulimaBoraCommonColors.appBackgroudColor,
                        ),
                        obscuretext: false,
                        style: TextStyle(
                            color: UkulimaBoraCommonColors.appBackgroudColor),
                        hintStyle: TextStyle(
                            color: UkulimaBoraCommonColors.appBackgroudColor),
                        maximumLength: 15,
                        controller: textController,
                        hinttext: UkulimaBoraCommonText.descriptionText,
                        fillcolor: null,
                        keyboardtype: TextInputType.name,
                        validator: (String val) {
                          return null;
                        },
                        onchanged: (String val) {
                          description = val;
                        },
                        onsaved: (String val) {
                          description = val;
                          return;
                        },
                      ),
                      Container(
                        padding: UkulimaBoraCustomSpaces.largerMarginSpacing,
                        child: DropdownButton<String>(
                            hint: Text(UkulimaBoraCommonText.cropSelectionText,
                                style: TextStyle(
                                    color: UkulimaBoraCommonColors
                                        .appBackgroudColor)),
                            dropdownColor:
                                UkulimaBoraCommonColors.appGreenColor,
                            style: TextStyle(
                                color:
                                    UkulimaBoraCommonColors.appBackgroudColor),
                            isExpanded: true,
                            value: crop,
                            onChanged: (String newValue) {
                              setState(() {
                                crop = newValue;
                              });
                            },
                            items: crops.map((String valueItem) {
                              return DropdownMenuItem<String>(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList()),
                      ),
                      const SizedBox(height: 50),
                      CommonAppButton(
                        buttonAction: () async {
                          if (!_addFarmFormKey.currentState.validate()) {
                            return;
                          }
                          _addFarmFormKey.currentState.save();

                          await Navigator.of(context).pushNamed(homeRoute);
                        },
                        buttonColor: UkulimaBoraCommonColors.appGreenColor,
                        buttonText: UkulimaBoraCommonText.saveMessage,
                        textColor: UkulimaBoraCommonColors.appBackgroudColor,
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}