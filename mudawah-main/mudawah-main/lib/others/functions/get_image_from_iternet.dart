import 'package:flutter/cupertino.dart';

import '../../utils/app_constants.dart';

String getImageUrlFromatter(String imageUrl) {
  return AppCostants.GET_IMAGE_URL + imageUrl;
}

NetworkImage getImageNetwork(String imageAvatar) {
  var url = getImageUrlFromatter(imageAvatar);
  print(url);
  return NetworkImage(url);
}
