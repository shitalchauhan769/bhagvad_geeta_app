import 'package:departure_bhagavadgita_app/utils/bhagavad%20gita_json_helper.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_helper.dart';
import '../model/home_model.dart';
class HomeProvider with ChangeNotifier
{
  List<ChapterModel>chapterList=[];
  List<VerseModel>verseList=[];
  List<VerseModel> filterList=[];
  String themeName = "system";
  String? theme;
  bool? isTheme=false;
  int selectedIndex = 0;
  List<String> bookMark=[];
  String language ='Sanskrit';
  int selectedImageIndex = 0;


  Future<void> getBhagavadGita() async {
    BhagavadGitaHelper bhagavadGitaHelper=BhagavadGitaHelper();
    chapterList =await bhagavadGitaHelper.bhagavadGita();
    // print("${chapterList[index].imageUrl}");
    notifyListeners();

  }

  Future<void> getVerse()
  async {
    BhagavadGitaHelper bhagavadGitaHelper=BhagavadGitaHelper();
    verseList=await bhagavadGitaHelper.verse();
  }

  void changeIndex(int value)
  {
    selectedIndex=value;
    notifyListeners();
  }

  void selectedVerse(int id) {
    getVerse();
    filterList.clear();
    for(var i= 0;i <verseList.length;i++)
    {
      if(verseList[i].chapter_number == id)
      {
        filterList.add(verseList[i]);
      }
    }
    notifyListeners();

  }
  void changeImage(int index) {
    if (selectedImageIndex > chapterList.length + 1) {
      selectedImageIndex++;
    } else {
      selectedImageIndex = 0;
    }

    notifyListeners();
  }




  void setTheme(String theme) {
    SharedHelper shr = SharedHelper();
    shr.setTheme(theme );
    getTheme();
  }
  Future<void> getTheme() async {
    SharedHelper shr = SharedHelper();
    theme=await shr.getTheme();
    notifyListeners();
  }


  void checkTheme()
  {
    isTheme!=isTheme;
    notifyListeners();
  }

  void changeLanguage(String value) {
    language = value;
    notifyListeners();
  }


// void getBookmarkData() async{
//   if(await getBookmark()==null)
//   {
//     bookMark=[];
//   }
//   else
//   {
//     bookMark=(await getBookmark())!;
//   }
//   notifyListeners();
// }
// void setBookmarkData(String url){
//   getBookmark();
//   bookMark.add(url);
//   setBookmark(bookMark: bookMark);
//   getBookmark();
//   notifyListeners();
//
// }


}