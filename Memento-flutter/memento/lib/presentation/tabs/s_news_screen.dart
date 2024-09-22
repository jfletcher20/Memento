import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:memento/data/models/m_article.dart';
import 'package:memento/data/models/m_news.dart';
import 'package:memento/data/web/u_ws.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: WebService.getNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("An error occurred while fetching news."),
            );
          } else {
            if (snapshot.hasData) {
              final jsonBody = jsonDecode(snapshot.data.toString());
              final news = SerializableNews.fromMap(jsonBody);
              if (news.count > 0) {
                return Scrollbar(
                  child: ListView.builder(
                    itemCount: news.count,
                    itemBuilder: (context, index) {
                      final article = news.results[index];
                      return ListTile(
                        title: Text(
                          article.title,
                          maxLines: 2,
                          style: const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        subtitle: Text(article.date),
                        leading: SizedBox(
                          width: 60,
                          child: Image.network(WebService.image(article.imagePath)),
                        ),
                        trailing: const Icon(Icons.expand_more),
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => _alert(article),
                        ),
                      );
                    },
                  ),
                );
              }
            }
            return noTasks;
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  AlertDialog _alert(Article article) {
    return AlertDialog(
      title: Stack(alignment: Alignment.bottomLeft, children: [
        Image.network(WebService.image(article.imagePath)),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Colors.purple.withOpacity(0.8),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            article.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
        ),
      ]),
      content: Scrollbar(child: SingleChildScrollView(child: Text(article.text))),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close"),
        ),
      ],
    );
  }

  Widget get noTasks {
    return Center(
      child: Text("No news is good news, they say.", style: Theme.of(context).textTheme.titleLarge),
    );
  }
}
