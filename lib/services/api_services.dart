import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:news_buddy/models/articles_model.dart';

class ApiService {
  final endpoint = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=7e21e239260049afbfbedd9119d103ff");

  Future<List<Articles>> getArticle() async {
    Response response = await get(endpoint);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();
      return articles;
    } else {
      throw ('cant get the articles');
    }
  }
}

class BbcApi {
  final endpoint = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7e21e239260049afbfbedd9119d103ff');

  Future<List<Articles>> getBbcArticles() async {
    Response res = await get(endpoint);
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Articles> bbcarticles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();
      return bbcarticles;
    } else {
      throw ('cant get bbc articles');
    }
  }
}
