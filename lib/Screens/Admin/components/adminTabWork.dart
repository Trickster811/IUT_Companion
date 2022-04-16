// import 'dart:html';

import 'package:iut_companion/Screens/Tabs/components/letter.dart';
import 'package:iut_companion/Screens/Tabs/dependencies/functions.dart';
import 'package:iut_companion/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AdminWorkSpace extends StatelessWidget {
  final index;
  const AdminWorkSpace({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List tabs = [
      Info(),
      Info(),
      Info(),
      Info(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        // leading: BackButton
        actions: [
          Icon(
            Icons.account_circle_sharp,
            size: 30,
          )
        ],
        title: Image.asset(
          'assets/images/AppName_light.png',
          width: size(150, context),
          height: size(100, context),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Container(
        // padding: padding_h,
        height: double.maxFinite,
        width: double.maxFinite,

        child: Stack(
          children: [
            Positioned(
              right: -120,
              bottom: 0,
              child: Image.asset(
                'assets/images/logo_iut.png',
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
                width: 350,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          'Admin Workspace',
                          style: TextStyle(
                            fontFamily: 'OpenSans_Regular',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Text(
                          "Let's add something our application.",
                          style: TextStyle(
                            fontFamily: 'OpenSans_Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: tabs[index],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  // Variables to get user entries
  final my_con_1 = TextEditingController();
  final my_con_2 = TextEditingController();
  // final my_con_3 = TextEditingController();

  int id = 1;

  // Form key
  final _dropdownFormKey = GlobalKey<FormState>();

  // Initial Selected Value
  String? dropdownvalue_1;

  String _radioValue = 'Male';

  // List of items in our dropdown menu for mention
  List<DropdownMenuItem<String>> get items_mn {
    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        child: TextTitle(title: 'News'),
        value: 'News',
      ),
      DropdownMenuItem(
        child: TextTitle(title: 'Departments'),
        value: 'Departments',
      ),
      DropdownMenuItem(
        child: TextTitle(title: 'Concours'),
        value: 'Concours',
      ),
      DropdownMenuItem(
        child: TextTitle(title: 'Sport'),
        value: 'Sport',
      ),
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size(40, context),
                ),
              ),
              Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _dropdownFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size(12, context),
                          ),
                          TextTitle(title: 'Title : '),
                          TextFormField(
                              style: TextStyle(
                                fontSize: taille(10, context),
                                height: 1.5,
                              ),
                              decoration: InputDecoration(
                                // icon: Icon(Icons.person),
                                hintText: 'enter a title',
                              ),
                              // value: dropdownvalue_1,
                              controller: my_con_1,
                              validator: RequiredValidator(
                                  errorText: 'Veuillez renseigner un titre')),
                          SizedBox(
                            height: size(12, context),
                          ),
                          TextTitle(title: 'Content : '),
                          TextFormField(
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                fontSize: taille(10, context),
                                height: 1.5,
                              ),
                              decoration: InputDecoration(
                                // icon: Icon(Icons.person),
                                hintText: 'enter a content',
                              ),
                              // value: dropdownvalue_1,
                              controller: my_con_2,
                              validator: RequiredValidator(
                                  errorText: 'Veuillez mettre du contenu')),
                          SizedBox(
                            height: size(12, context),
                          ),
                          SizedBox(
                            height: size(12, context),
                          ),
                          TextTitle(title: 'Category : '),
                          DropdownButtonFormField(
                            style: TextStyle(
                              fontSize: taille(10, context),
                              height: 0.5,
                            ),
                            decoration: InputDecoration(
                              // icon: Icon(Icons.person),
                              hintText: 'choose',
                            ),
                            value: dropdownvalue_1,
                            validator: (value) => value == null
                                ? 'Veuillez choisir une category'
                                : null,
                            items: items_mn,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue_1 = newValue!;
                              });
                            },
                          ),
                          SizedBox(
                            height: size(12, context),
                          ),

                          // Submit Button

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_dropdownFormKey.currentState!.validate()) {
                                  final userInputs = [
                                    my_con_1.text,
                                    my_con_2.text,
                                    dropdownvalue_1,
                                    _radioValue,
                                  ];
                                }
                              },
                              child: Text(
                                'Post',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'OpenSans_Regular',
                                ),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                // elevation: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //  Footer

        Container(
          padding: EdgeInsets.only(bottom: size(50, context)),
          width: double.maxFinite,
          height: size(100, context),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Copyright',
                style: TextStyle(
                    fontSize: taille(12, context), color: kPrimaryColor),
              ),
              Icon(
                Icons.copyright_rounded,
                color: kPrimaryColor,
              ),
              Text(
                '2022 | IUT Ngaoundere',
                style: TextStyle(
                    fontSize: taille(12, context), color: kPrimaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
