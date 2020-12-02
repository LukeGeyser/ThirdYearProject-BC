import 'package:knitwit_feature_module/AuthorModel.dart';

class PatternsModel {
  final AuthorModel designer;
  final Object first_photo;
  final bool free;
  final int id;
  final String name;
  final Object pattern_author;
  final Object pattern_sources;
  final String permalink;
  final String personal_attributes;

  PatternsModel(
      this.designer,
      this.first_photo,
      this.free,
      this.id,
      this.name,
      this.pattern_author,
      this.pattern_sources,
      this.permalink,
      this.personal_attributes);

  factory PatternsModel.fromJson(Map<String, dynamic> json) {
    return PatternsModel(
        json['designer'],
        json['first_photo'],
        json['free'],
        json['id'],
        json['name'],
        json['pattern_author'],
        json['pattern_sources'],
        json['permalink'],
        json['personal_attributes']);
  }
}
