import 'package:flutter/material.dart';

class ChapterModel {
  String? name,imageUrl,
      chapter_summary,
      chapter_summary_hindi,
      image_name,
      name_meaning,
      name_translation,
      name_sanskrit;
  int? id, chapter_number, verses_count;

  ChapterModel(
      {this.name,
        this.id,
        this.chapter_number,
        this.verses_count,
        this.chapter_summary,
        this.chapter_summary_hindi,
        this.image_name,
        this.name_meaning,
        this.name_translation,
        this.name_sanskrit,
        this.imageUrl});

  factory ChapterModel.mapToModel(Map m1) {
    return ChapterModel(
        name: m1['name'],
        id: m1['id'],
        chapter_number: m1['chapter_number'],
        verses_count:m1['verses_count'],
        chapter_summary: m1['chapter_summary'],
        chapter_summary_hindi: m1['chapter_summary_hindi'],
        image_name: m1['image_name'],
        name_meaning: m1['name_meaning'],
        name_translation: m1['  name_translation'],
        name_sanskrit: m1['name_sanskrit'],
        imageUrl: m1[' imageUrl']


    );
  }


}

class VerseModel {
  int? chapter_id, chapter_number, externalId, id, verse_number, verse_order;
  String? text, title, transliteration, word_meaning,hindi_meaning;

  VerseModel(
      {this.id,
        this.chapter_number,
        this.chapter_id,
        this.externalId,
        this.verse_order,
        this.verse_number,
        this.title,
        this.text,
        this.transliteration,
        this.word_meaning,this.hindi_meaning});

  factory VerseModel.mapToModel(Map m1) {
    return VerseModel(
        id: m1['id'],
        chapter_number: m1['chapter_number'],
        chapter_id: m1['chapter_id'],
        externalId: m1['externalId'],
        verse_number: m1['verse_number'],
        verse_order: m1['verse_order'],
        title: m1['title'],
        text: m1['text'],
        transliteration: m1['transliteration'],
        word_meaning: m1['word_meaning'],
        hindi_meaning: m1['hindi_meaning']
    );
  }
}
