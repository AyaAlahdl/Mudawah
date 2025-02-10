import 'package:flutter/material.dart';

import '../../../colors.dart';
import '../../../models/Posts.dart';
import '../../Articles/article.dart';

//select function
void SelectBlog(BuildContext ctx) {
  Navigator.of(ctx).push(MaterialPageRoute(
    builder: (c) => Article(),
  ));
}

InkWell ViralBlog(BuildContext context) {
  double pagewidth = MediaQuery.of(context).size.width;
  double pageheight = MediaQuery.of(context).size.height;

  return InkWell(
    onTap: () => SelectBlog(context),
    child: Container(
      margin: EdgeInsets.all(10),
      height: pageheight / 5.5,
      //width: cardswidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: cardscolor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 4,
            color: Colors.black12,
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 5),
                child: Column(
                  children: [
                    Container(
                      width: 210,
                      height: 40,
                      child: Text(
                        BlogMod.blogs[1].title,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 113, top: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  BlogMod.blogs[1].doctor,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: textcolor2,
                                  ),
                                ),
                                Text(
                                  '[التاريخ]',
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    height: 1,
                                    fontSize: 13,
                                    color: textcolor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              BlogMod.blogs[1].doctorimg,
                            ),
                            radius: 17,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: pagewidth / 3.2,
                height: pageheight / 5.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  image: DecorationImage(
                    image: AssetImage(
                      BlogMod.blogs[1].image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
