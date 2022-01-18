class Post
{
  int? id;
  String? date;
  String? dateGmt;
  dynamic? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  dynamic? title;
  dynamic? content;
  dynamic? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  dynamic? meta;
  dynamic? categories;
  dynamic? tags;
  dynamic? links;
  String? imageUrl;

  Post(
      {this.id,
      this.date,
      this.dateGmt,
      this.guid,
      this.modified,
      this.modifiedGmt,
      this.slug,
      this.status,
      this.type,
      this.link,
      this.title,
      this.content,
      this.excerpt,
      this.author,
      this.featuredMedia,
      this.commentStatus,
      this.pingStatus,
      this.sticky,
      this.template,
      this.format,
      this.meta,
      this.categories,
      this.tags,
      this.links,
        this.imageUrl
      });

  Post.fromJson(Map<String, dynamic> json)
  {
    id=json['id'];
    date=json['date'];
    dateGmt=json['date_gmt'];
    guid=json['guid'];
    modified=json['modified'];
    modifiedGmt=json['modified_gmt'];
    slug=json['slug'];
    status=json['status'];
    type=json['type'];
    link=json['link'];
    title=json['title'];
    content=json['content'];
    excerpt=json['excerpt'];
    author=json['author'];
    featuredMedia=json['feature_media'];
    commentStatus=json['comment_status'];
    pingStatus=json['ping_status'];
    sticky=json['sticky'];
    template=json['template'];
    format=json['format'];
    meta=json['meta'];
    categories=json['categories'];
    tags=json['tags'];
    links=json['_links'];
  }
}