import 'package:hive/hive.dart';
import '../../model/news_article_model.dart';

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 1; // You can choose a unique typeId for your NewsAdapter

  @override
  News read(BinaryReader reader) {
    return News(
      id: reader.readString(),
      title: reader.readString(),
      description: reader.readString(),
      url: reader.readString(),
      author: reader.readString(),
      image: reader.readString(),
      language: reader.readString(),
      category: (reader.readList() as List<dynamic>).cast<String>(),
      published: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer.writeString(obj.id ?? ''); // Handle null values
    writer.writeString(obj.title ?? '');
    writer.writeString(obj.description ?? '');
    writer.writeString(obj.url ?? '');
    writer.writeString(obj.author ?? '');
    writer.writeString(obj.image ?? '');
    writer.writeString(obj.language ?? '');
    writer.writeList(obj.category ?? []); // Handle null values
    writer.writeString(obj.published ?? '');
  }
}
