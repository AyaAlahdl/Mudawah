class UpdateSeenBody {
  int? postId;

  UpdateSeenBody({this.postId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    return data;
  }
}
