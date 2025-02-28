class AssetModel {
  String author;
  String link;
  String fileExtension;
  String downloadLink;
  String name;
  String platform;
  double size;
  double price;
  String status;
  String fileCategory;
  bool hidden;

  // Constructor
  AssetModel({
    required this.author,
    required this.link,
    required this.fileExtension,
    required this.downloadLink,
    required this.name,
    required this.platform,
    required this.size,
    required this.price,
    required this.status,
    required this.fileCategory,
    required this.hidden,
  });

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'link': link,
      'fileExtension': fileExtension,
      'downloadLink': downloadLink,
      'name': name,
      'platform': platform,
      'size': size,
      'price': price,
      'status': status,
      'fileCategory': fileCategory,
      'hidden': hidden,
    };
  }

  // Factory constructor to create an object from a map
  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      author: map['author'] as String,
      link: map['link'] as String,
      fileExtension: map['fileExtension'] as String,
      downloadLink: map['downloadLink'] as String,
      name: map['name'] as String,
      platform: map['platform'] as String,
      size: (map['size'] as num).toDouble(), // Convert to double
      price: (map['price'] as num).toDouble(), // Convert to double
      status: map['status'] as String,
      fileCategory: map['fileCategory'] as String,
      hidden: map['hidden'] as bool,
    );
  }
}