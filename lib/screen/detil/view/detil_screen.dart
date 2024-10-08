import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getVerse();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title:
        providerW!.language == "Sanskrit"
            ? Text(
          "${providerW!.chapterList[providerW!.selectedIndex].name_sanskrit}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
            : providerW!.language == "English"
            ? Text(
          "${providerW!.chapterList[providerW!.selectedIndex].name_translation}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
            : Text(
          "${providerW!.chapterList[providerW!.selectedIndex].name}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: Colors.orange,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    onTap: () {
                      showWebDialog();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.language),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Language"),
                      ],
                    )),
                // PopupMenuItem(
                //     onTap: () {},
                //     child: const Row(
                //       children: [
                //         Icon(Icons.favorite),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Text("favorite"),
                //       ],
                //     )),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: 400,
              child: Image.network(
                "${providerW!.chapterList[providerR!.selectedIndex].imageUrl}",
                fit: BoxFit.fill,
                opacity: const AlwaysStoppedAnimation(0.4),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:MediaQuery.sizeOf(context).width,
                        height: 250,
                        child:Image.network("${providerW!.chapterList[providerR!.selectedIndex].imageUrl}",fit: BoxFit.fill,),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: providerW!.filterList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {

                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Center(
                                    child: providerW!.language == "Sanskrit"
                                        ? Text(
                                      "${providerR!.filterList[index].text}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                        : providerW!.language == "English"
                                        ? Text(
                                      "${providerR!.filterList[index].transliteration}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                        : Text(
                                      "${providerR!.filterList[providerW!.selectedIndex].hindi_meaning}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // body:  ListView.builder(
      //   itemCount: providerW!.chapterList.length,
      //   itemBuilder: (context, index) {
      //     return InkWell(
      //       onTap: () {
      //         Navigator.pushNamed(context, "");
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Center(
      //           child: ,
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }

  void showWebDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Column(
              children: [
                RadioListTile(
                  value: "Sanskrit",
                  groupValue: providerW!.language,
                  onChanged: (value) {
                    providerW!.changeLanguage(value.toString());
                    Navigator.pop(context);
                  },
                  title: const Text("Sanskrit"),
                ),
                RadioListTile(
                  value: "Hindi",
                  groupValue: providerW!.language,
                  onChanged: (value) {
                    providerW!.changeLanguage(value.toString());
                    Navigator.pop(context);
                  },
                  title: const Text("Hindi"),
                ),
                RadioListTile(
                  value: "English",
                  groupValue: providerW!.language,
                  onChanged: (value) {
                    providerW!.changeLanguage(value.toString());
                    Navigator.pop(context);
                  },
                  title: const Text("English"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
