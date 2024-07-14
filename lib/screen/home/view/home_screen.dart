import 'package:departure_bhagavadgita_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getBhagavadGita();
    context.read<HomeProvider>().getVerse();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      // backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        // backgroundColor: Colors.orange,

        centerTitle: true,
        title: const Text("|| श्री भगवद् गीता ||"),
        // leading: IconButton(
        //   onPressed: () {
        //    providerR!.themaChang();
        //
        //   },icon: Icon(providerW!.theme==true?Icons.light_mode_outlined:Icons.dark_mode),
        // ),
        actions: [
          // Switch(value:providerW!.isTheme! , onChanged: (value) {
          //   providerR!.checkTheme();
          //
          // },)
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Ligth"),
                onTap: () {
                  providerR!.setTheme("Ligth");
                },
              ),
              PopupMenuItem(
                child: const Text("Dark"),
                onTap: () {
                  providerR!.setTheme("Dark");
                },
              ),
              PopupMenuItem(
                child: const Text("System"),
                onTap: () {
                  providerR!.setTheme("System");
                },
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/e8/0f/1f/krishna-talking-with.jpg?w=1200&h=-1&s=1"),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.chapterList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    providerR!.selectedVerse(
                        providerR!.chapterList[index].chapter_number!);
                    Navigator.pushNamed(context, "details");
                    providerR!.changeIndex(index);
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Text("${providerW!.chapterList[index].id} .",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${providerW!.chapterList[index].name}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            // Container(
                            //   height: 50,
                            //   width: 50,
                            //   decoration:  BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     image: DecorationImage(image: NetworkImage("${providerW!.chapterList[index].imageUrl}"),),
                            //   ),
                            // )
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            const Icon(Icons.menu),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${providerW!.chapterList[index].verses_count}श्लोक',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),

                      // Container(
                      //   height: 90,
                      //   width: MediaQuery
                      //       .sizeOf(context)
                      //       .width,
                      //   decoration: BoxDecoration(
                      //     color: Colors.orange,
                      //     boxShadow: const [
                      //       BoxShadow(
                      //           blurRadius: 5,
                      //           color: Colors.deepOrangeAccent,
                      //           blurStyle: BlurStyle.normal),
                      //     ],
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text("${providerW!.chapterList[index].id}",
                      //                 style: const TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 20)),
                      //             const SizedBox(
                      //               width: 20,
                      //             ),
                      //             Align(
                      //               alignment: Alignment.center,
                      //               child: Text(
                      //                 "${providerW!.chapterList[index].name}",
                      //                 style: const TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 20),
                      //               ),
                      //             ),
                      //
                      //           ],
                      //         ),
                      //         // Spacer(),
                      //         Text('${providerW!.chapterList[index]
                      //             .verses_count}श्लोक', style: TextStyle(
                      //             fontWeight: FontWeight.normal, fontSize: 15)),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
