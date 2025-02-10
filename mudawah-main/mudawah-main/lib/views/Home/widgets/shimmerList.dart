import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class shimmerList extends StatefulWidget {
  const shimmerList({Key? key}) : super(key: key);

  @override
  State<shimmerList> createState() => _shimmerListState();
}

class _shimmerListState extends State<shimmerList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            child: shimmerlayout(),
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.white);
      },
    ));
  }

  Widget shimmerlayout() {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Container(
                height: 150,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                height: 150,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
              Container(
                height: 10,
                width: 100,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
              SizedBox(
                width: 35,
              ),
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
