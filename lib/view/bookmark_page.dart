import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/response/status.dart';
import 'package:provider/provider.dart';

import '../model/news_article_model.dart';
import '../view_model/home_view_model.dart';

class BookmarkedNewsPage extends StatefulWidget {
  const BookmarkedNewsPage({Key? key}) : super(key: key);

  @override
  _BookmarkedNewsPageState createState() => _BookmarkedNewsPageState();
}

class _BookmarkedNewsPageState extends State<BookmarkedNewsPage> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();

  @override
  void initState() {
    super.initState();
    loadBookmarkedNews();
  }

  Future<void> loadBookmarkedNews() async {
    await homeViewViewModel.loadBookmarkedNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bookmarked News"),
        ),
        body: ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => homeViewViewModel,
          child: Consumer<HomeViewViewModel>(builder: (context, value, _) {
            if (homeViewViewModel.bookmarkedNews.isEmpty)
              return const Center(child: Text("No data found"));
            else {
              return ListView.builder(
                itemCount: homeViewViewModel.bookmarkedNews.length,
                itemBuilder: (context, index) {
                  log(homeViewViewModel.bookmarkedNews.length.toString());
                  News news = homeViewViewModel.bookmarkedNews[index];
                  return _buildNewsCard(news);
                },
              );
            }
          }),
        ));
  }

  Widget _buildNewsCard(dynamic newsData) {
    bool isExpanded = homeViewViewModel.isDescriptionExpanded(newsData.id);
    bool isBookmarked = homeViewViewModel.bookmarkedNews.contains(newsData);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(newsData.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        homeViewViewModel.toggleBookmark(newsData);
                      },
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                        color: isBookmarked ? Colors.blue : null,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        newsData.title.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          homeViewViewModel
                              .toggleDescriptionExpansion(newsData.id);
                        },
                        child: Column(
                          children: [
                            Text(
                              isExpanded
                                  ? newsData.description.toString()
                                  : _truncateDescription(
                                      newsData.description.toString(), 100),
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 6),
                            !isExpanded
                                ? const Text(
                                    'Read More',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _truncateDescription(String description, int maxLength) {
    return description.length <= maxLength
        ? description
        : description.substring(0, maxLength).trim() + '...';
  }
}
