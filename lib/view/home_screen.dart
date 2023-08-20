import 'package:flutter/material.dart';
import 'package:news_app_flutter/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/theme_model.dart';
import '../view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  bool showFullDescription = false;
  int _currentIndex = 0;

  @override
  void initState() {
    homeViewViewModel.fetchlatestNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userPrefernece = Provider.of<UserViewModel>(context);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('My News App'),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              homeViewViewModel.clearBookmarkData();
              userPrefernece.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: const Center(
              child: Text('Logout'),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.08,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.bookMarked);
            },
            icon: const Icon(
              Icons.bookmark_outline,
              size: 30,
            ),
          ),
          SizedBox(
            width: screenWidth * 0.08,
          ),
          IconButton(
            onPressed: () {
              final themeProvider =
                  Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme(); // Toggle the theme
            },
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(children: [
        _buildSearchBar(), // Add the search bar here
        _buildCategoryBar(),
        SizedBox(
          height: screenHeight * 0.03,
        ),

        ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => homeViewViewModel,
          child: Consumer<HomeViewViewModel>(
            builder: (context, value, _) {
              switch (value.newsList.status!) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(
                    child: Text(value.newsList.message.toString()),
                  );
                case Status.COMPLETED:
                  if (value.newsList.data!.news!.isEmpty)
                    return const Center(child: Text("No data found"));
                  else {
                    return Expanded(
                      child: PageView.builder(
                        itemCount: value.newsList.data!.news!.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index; // Update the current index
                          });
                        },
                        itemBuilder: (context, index) {
                          return _buildNewsCard(
                            value.newsList.data!.news![index],
                          );
                        },
                      ),
                    );
                  }
              }
            },
          ),
        ),
      ]),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintText: 'Search news...',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          border: InputBorder.none,
        ),
        onFieldSubmitted: (searchQuery) {
          homeViewViewModel.searchNews(searchQuery);
        },
      ),
    );
  }

  Widget _buildCategoryBar() {
    final categories = [
      "regional",
      "technology",
      "lifestyle",
      "business",
      "general",
      "programming",
      "science",
      "entertainment",
      "world",
      "sports",
      "finance",
      "academia",
      "politics",
      "health",
      "opinion",
      "food",
      "game"
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                homeViewViewModel.categoryWiseNews(category);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  category,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNewsCard(dynamic newsData) {
    bool isExpanded = homeViewViewModel.isDescriptionExpanded(newsData.id);
    bool isBookmarked = homeViewViewModel.bookmarkedNews.contains(newsData);
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            // BoxShadow(
            //   color: Colors.black12,
            //   offset: Offset(0, 2),
            //   blurRadius: 4,
            // ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.034),
                image: DecorationImage(
                  image: NetworkImage(newsData.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      newsData.category[0].toString(),
                      style: TextStyle(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                        style: TextStyle(
                          fontSize: screenHeight * 0.019,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isExpanded
                                  ? newsData.description.toString()
                                  : _truncateDescription(
                                      newsData.description.toString(), 100),
                              style: TextStyle(fontSize: screenHeight * 0.0175),
                            ),
                            SizedBox(height: screenHeight * 0.02),
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
