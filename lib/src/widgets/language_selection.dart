import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mosque_timings/src/services/localization/localization.dart';
import 'package:mosque_timings/src/widgets/app_text.dart';
import 'package:mosque_timings/src/widgets/custom_search_bar.dart';
import 'package:mosque_timings/src/style/style.dart';

class LanguageSelectionDialog extends StatefulWidget {
  const LanguageSelectionDialog({
    Key? key,
  }) : super(key: key);

  @override
  _LanguageSelectionDialogState createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  List<String> tempList = [];

  List<String> languages = LocalizationService.langs;
  @override
  Widget build(BuildContext context) {
    tempList = languages;

    return StatefulBuilder(
      builder: (context, setState) {
        return Dialog(
            shape: AppStyle().dialogShape(20),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AppText(
                      text: 'Select Language',
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSearchBar(
                      hint: "Filter".tr,
                      onChanged: (val) {
                        setState(() {
                          if (val.isNotEmpty) {
                            tempList = languages
                                .map((language) => language)
                                .where((searchedLanguage) => searchedLanguage
                                    .toLowerCase()
                                    .contains(val.toLowerCase()))
                                .toList();
                          } else {
                            tempList =
                                languages.map((language) => language).toList();
                          }
                        });
                        return;
                        //
                        // setState(() {
                        //   if (val.length > 0) {
                        //     tempList = widget.list
                        //         .where((element) => element
                        //             .toLowerCase()
                        //             .contains(val.toLowerCase()))
                        //         .toList();
                        //     print(tempList);
                        //   } else {
                        //     tempList = widget.list;
                        //   }
                        // });
                      },
                    ),
                    // implement search functionality
                  ),
                  SizedBox(
                    height: 200.0,
                    width: 250,
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: tempList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(tempList[index].tr),
                              onTap: () {
                                LocalizationService()
                                    .changeLocale(tempList[index]);
                                Get.back();
                              });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  // getList() {
  //   if (widget.list != null) {
  //     return widget.list;
  //   } else if (widget.categories != null) {
  //     return widget.categories
  //         .map((category) => category.categoryName)
  //         .toList();
  //   } else if (widget.items != null) {
  //     return widget.items.map((items) => items.itemName).toList();
  //   }
  // }
}
