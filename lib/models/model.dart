

class wallmodel {
  
  Urls urls;
  Links links;
  double height;
  double width;
  String color;
  String name;

 wallmodel({required this.urls,required this.links,required this.height,required this. width,required this.color,required this.name});
 
 factory wallmodel.fromJson(Map<String,dynamic> obj){
  final urls = Urls.fromJson(obj["urls"]);
  final links = Links.fromJson(obj["links"]);
  final height = obj["height"].toDouble();
  final width = obj["width"].toDouble();
  final color = obj["color"];
  final name = obj["id"];

  return wallmodel(urls: urls, links: links, height: height, width: width, color: color,name: name);
 }

}

class Urls{

  String raw;
  String full;
  String small;
  String thumb;

  Urls({required this.raw,required this.full,required this.small,required this.thumb});
  
  factory Urls.fromJson(Map<String,dynamic> det){
    final raw = det["raw"];
    final full = det["full"];
    final small = det["small"];
    final thumb = det["thumb"];

    return Urls(raw: raw, full: full, small: small, thumb: thumb);
  }
}

class Links{

  String self;
  String html;
  String download;

  Links({required this.self,required this.html, required this.download});

  factory Links.fromJson(Map<String,dynamic>load){
    final self = load["self"];
    final html = load["html"];
    final download = load["download"];

    return Links(self: self, html: html, download: download);
  }
}
