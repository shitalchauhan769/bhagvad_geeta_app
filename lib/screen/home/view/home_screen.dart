import 'package:carousel_slider/carousel_slider.dart';
import 'package:departure_bhagavadgita_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController =
  PageController(viewportFraction: 0.8, keepPage: true);
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

      appBar: AppBar(

        centerTitle: true,
        title: const Text("|| श्री भगवद् गीता ||"),

        actions: [
          // Switch(value:providerW!.isTheme! , onChanged: (value) {
          //   providerR!.checkTheme();
          //
          // },)
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Light"),
                onTap: () {
                  providerR!.setTheme("Light");
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
          // Container(
          //   height: 300,
          //   width: MediaQuery.sizeOf(context).width,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: NetworkImage(
          //               "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/e8/0f/1f/krishna-talking-with.jpg?w=1200&h=-1&s=1"),
          //           fit: BoxFit.cover)),
          // ),
          CarouselSlider.builder(
            itemCount: providerW!.chapterList.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            providerW!.chapterList[index].imageUrl as String),
                        fit: BoxFit.fill)),
              );
            },
            options: CarouselOptions(
              initialPage: 2,
              onPageChanged: (index, reason) {
                providerR!.changeIndex(index);
                pageController = PageController(initialPage: index);
              },
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: List.generate(
          //     providerW!.chapterList.length,
          //         (index) => Container(
          //       height: 10,
          //       width: 10,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: index == providerW!.selectedImageIndex
          //               ? Colors.blue
          //               : Colors.grey),
          //       margin: const EdgeInsets.all(2),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.chapterList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    providerR!.selectedVerse(
                        providerR!.chapterList[index].chapter_number!,);
                    Navigator.pushNamed(context, "details",);
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

                            Center(
                              child: providerW!.language == "Sanskrit"
                                  ? Text(
                                "${providerR!.chapterList[index].name_sanskrit}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                                  : providerW!.language == "English"
                                  ? Text(
                                "${providerR!.chapterList[index].name_translation}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                                  : Text(
                                "${providerR!.chapterList[index].name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),

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
                      ), // Container(
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
