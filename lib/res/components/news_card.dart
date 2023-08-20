// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app_flutter/model/news_article_model.dart';

// class NewsCard extends StatelessWidget {

//   final AtricleModel newsData;
//   final bool isExpanded;
//   final bool isBookmarked;
//   final Function() onBookmarkToggle;
//   final Function() onDescriptionTap;

//   NewsCard({
//     required this.newsData,
//     required this.isExpanded,
//     required this.isBookmarked,
//     required this.onBookmarkToggle,
//     required this.onDescriptionTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black12,
//               offset: Offset(0, 2),
//               blurRadius: 4,
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 280,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 image: DecorationImage(
//                   image: NetworkImage(newsData.news),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       IconButton(
//                         onPressed: onBookmarkToggle,
//                         icon: Icon(
//                           isBookmarked
//                               ? Icons.bookmark
//                               : Icons.bookmark_outline,
//                           color: isBookmarked ? Colors.blue : null,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     child: Column(
//                       children: [
//                         Text(
//                           newsData.title.toString(),
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         GestureDetector(
//                           onTap: onDescriptionTap,
//                           child: Column(
//                             children: [
//                               Text(
//                                 isExpanded
//                                     ? newsData.description.toString()
//                                     : _truncateDescription(
//                                         newsData.description.toString(), 100),
//                                 style: const TextStyle(fontSize: 14),
//                               ),
//                               const SizedBox(height: 6),
//                               !isExpanded
//                                   ? const Text(
//                                       'Read More',
//                                       style: TextStyle(
//                                         color: Colors.blue,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   : Container(),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _truncateDescription(String description, int maxLength) {
//     return description.length <= maxLength
//         ? description
//         : description.substring(0, maxLength).trim() + '...';
//   }
// }
