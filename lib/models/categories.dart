class Categories{
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  int? parent;
  List? meta;
  Map<String, dynamic>? links;
  Categories.emp();

  Categories(this.id, this.count, this.description, this.link, this.name,
      this.slug, this.taxonomy, this.parent, this.meta, this.links);
  Categories.fromJson(Map<String, dynamic> json)
  {
    id=json['id'];
    count=json['count'];
    description=json['description'];
    link=json['link'];
    name=json['name'];
    slug=json['slug'];
    taxonomy=json['taxonomy'];
    parent=json['parent'];
    meta=json['meta'];
    links=json['_links'];
  }
}