import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pycare/components/my_appbar.dart';
import 'package:pycare/components/my_colors.dart';
import 'package:pycare/components/my_text.dart';
import 'package:pycare/screens/hospital_details.dart';

import '../providers/fetch_data.dart';
import '../providers/translation.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  String selectedPopItem;
  String selectedFilterPopItem;
  var tempHospitals = [];
  var hospitals = [];

  // @override
  // void initState() {
  //   hospitals = [
  //     {
  //       'name': 'Jipmer',
  //       'vacancy': '20',
  //       'TOI': 'govt',
  //       'imgLink':
  //           'https://images.shiksha.com/mediadata/images/1663197407phpCQxnSz.jpeg',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889896']
  //     },
  //     {
  //       'name': 'Pims',
  //       'vacancy': '12',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName': 'Pondicherry Institute of Medical Sciences',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'East Coast Hospitals',
  //       'vacancy': '18',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Padmavathy',
  //       'vacancy': '17',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Cluny',
  //       'vacancy': '21',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'GH',
  //       'vacancy': '16',
  //       'TOI': 'govt',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Hospital Name',
  //       'vacancy': '16',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Hospital Name',
  //       'vacancy': '16',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Hospital Name',
  //       'vacancy': '16',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Hospital Name',
  //       'vacancy': '16',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     },
  //     {
  //       'name': 'Hospital Name',
  //       'vacancy': '16',
  //       'TOI': 'private',
  //       'imgLink':
  //           'https://images.unsplash.com/photo-1696541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
  //       'fullName':
  //           'Jawaharlal Institute of Postgraduate Medical Education and Research,Government of India',
  //       'instituteType': 'Government',
  //       'noOfOxygenBeds': '8',
  //       'noOfVentilatorBeds': '4',
  //       'noOfisolationBeds': '33',
  //       'address': 'Jipmer Campus Rd,Jipmer Campus,Puducherry,6055006',
  //       'phNos': ['9943165383', '8999889898']
  //     }
  //   ];
  //
  //   tempHospitals = hospitals;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer2<FetchData, TranslationText>(
        builder: (context, api, translation, child) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: MyAppBar(
          title: translation.getTranslatedText(context, 'LIST OF HOSPITALS'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      child: Container(
                        width: width / 3,
                        height: 36.35,
                        decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: translation.getTranslatedText(
                                    context, 'Filter'),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Icon(
                                Icons.filter_list_rounded,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      onSelected: (popItem) {
                        print(popItem);
                        setState(() {
                          selectedFilterPopItem = popItem;
                        });
                      },
                      color: bgColor,
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: PopupMenuButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: bgColor,
                            child: MyText(
                              text: translation.getTranslatedText(
                                  context, 'Type Of Institute'),
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry>[
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () {
                                    hospitals = tempHospitals;
                                    setState(() {
                                      hospitals = hospitals.where((item) {
                                        return item.containsValue('govt');
                                      }).toList();
                                    });
                                    Navigator.pop(context);
                                  }, //Show Hospitals Under Govt. Category.
                                  title: MyText(
                                    text: 'Govt',
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () {
                                    hospitals = tempHospitals;
                                    setState(() {
                                      hospitals = hospitals.where((item) {
                                        return item.containsValue('private');
                                      }).toList();
                                    });
                                    Navigator.pop(context);
                                  }, //Show private Hospitals.
                                  title: MyText(
                                    text: 'Private',
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () {
                                    hospitals = tempHospitals;
                                    setState(() {
                                      hospitals = hospitals.where((item) {
                                        return item
                                            .containsValue('nursing homes');
                                      }).toList();
                                    });
                                    Navigator.pop(context);
                                  }, //Show Nursing homes.
                                  title: MyText(
                                    text: translation.getTranslatedText(
                                        context, 'Nursing Homes'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                hospitals = tempHospitals;
                              });
                              Navigator.pop(context);
                            }, //Show all
                            title: MyText(
                              text:
                                  translation.getTranslatedText(context, 'All'),
                            ),
                          ),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    PopupMenuButton(
                      initialValue: selectedPopItem,
                      child: Container(
                        width: width / 3,
                        height: 36.35,
                        decoration: BoxDecoration(
                            color: darkBlue,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              MyText(
                                text: translation.getTranslatedText(
                                    context, 'Sort By'),
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(
                                Icons.sort,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      onSelected: (popItem) {
                        setState(() {
                          selectedPopItem = popItem;
                        });
                      },
                      color: bgColor,
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            }, //Sort Logic (Ascending)
                            title: MyText(
                              text: translation.getTranslatedText(
                                  context, 'Alphabets(A-Z)'),
                            ),
                          ),
                        ),
                        PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            }, //Sort Logic (Descending)
                            title: Text(
                              translation.getTranslatedText(
                                  context, 'Alphabets(Z-A)'),
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                        ),
                        PopupMenuDivider(
                          height: 20,
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                            }, //Sort Logic (Vacant Beds)
                            title: MyText(
                              text: translation.getTranslatedText(
                                  context, 'No. Of Vacant Beds'),
                            ),
                          ),
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: api.hospitalDetails.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(9),
                            splashColor: darkBlue,
                            radius: 500,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HospitalDetails(
                                    imgLink: api.hospitalDetails[index]["URL"],
                                    hospitalName: api.hospitalDetails[index]
                                        ['hospitalName'],
                                    oxygenBeds: api.hospitalDetails[index]
                                            ['oxygenBeds']["vacant"]
                                        .toString(),
                                    instituteType: "GOVT",
                                    ventilatorBeds: api.hospitalDetails[index]
                                            ['ventilatorBeds']["vacant"]
                                        .toString(),
                                    isolationBeds: api.hospitalDetails[index]
                                            ['isolationBeds']["vacant"]
                                        .toString(),
                                    address: api.hospitalDetails[index]
                                        ['address'],
                                    contactNos: api.hospitalDetails[index]
                                        ['phNumber'],
                                  ),
                                ),
                              );
                            }, //Hospitals Specific Details Component Call
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: borderBlue),
                              ),
                              child: SafeArea(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 10, right: 16),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  MyText(
                                                    text: translation
                                                        .getTranslatedText(
                                                            context,
                                                            api.hospitalDetails[
                                                                    index][
                                                                'hospitalName']),
                                                    size: 16,
                                                    color: Colors.black,
                                                    fontWeight: 'BOLD',
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Row(
                                                    children: [
                                                      MyText(
                                                        text: translation
                                                                .getTranslatedText(
                                                                    context,
                                                                    'Vacancy Of Beds') +
                                                            ": ",
                                                        color: darkBlue,
                                                        fontWeight: 'BOLD',
                                                      ),
                                                      MyText(
                                                        text: translation.getTranslatedText(
                                                            context,
                                                            (api.hospitalDetails[index]['oxygenBeds']["vacant"] +
                                                                    api.hospitalDetails[index]
                                                                            [
                                                                            'ventilatorBeds']
                                                                        [
                                                                        "vacant"] +
                                                                    api.hospitalDetails[index]
                                                                            [
                                                                            'isolationBeds']
                                                                        [
                                                                        "vacant"])
                                                                .toString()),
                                                        color: numberRed,
                                                        fontWeight: 'BOLD',
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: darkBlue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
