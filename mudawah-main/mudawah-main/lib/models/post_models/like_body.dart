class LikeBody {
  int? postId;
  String? likeableType;

  LikeBody({this.postId, this.likeableType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['likeable_type'] = this.likeableType;
    return data;
  }
}
