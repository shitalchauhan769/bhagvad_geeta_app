import 'dart:convert';
import 'package:flutter/services.dart';
import '../screen/home/model/home_model.dart';

class BhagavadGitaHelper {
  Future<List<ChapterModel>> bhagavadGita() async {
    var jsonString= await rootBundle.loadString("assets/json/bhagavad gita.json");
    List json = jsonDecode(jsonString);

    List<ChapterModel> chapterList = json .map((e) => ChapterModel.mapToModel(e)).toList();
    // print("${chapterList.}")
    return chapterList;

  }
  Future<List<VerseModel>> verse() async {
     var jsonString = await rootBundle.loadString("assets/json/verse.json");
     List json1=jsonDecode(jsonString);
     List<VerseModel>verseList=json1.map((e) => VerseModel.mapToModel(e)).toList();
     return verseList;

  }

 }