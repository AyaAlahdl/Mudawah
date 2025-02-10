import 'package:flutter/material.dart';
import 'package:mudawah/views/hospital/components/tabItem.dart';
import 'package:mudawah/models/facibility_models/Device.dart';

import 'device.dart';

class Devices extends StatefulWidget {
  const Devices({Key? key, required this.devices}) : super(key: key);
  final List<Device> devices;
  _DevicesState createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      child: Stack(
        children: [
          ListView.builder(
              itemCount: widget.devices.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return DeviceTabItem(
                    title: widget.devices[index].name!,
                    content: widget.devices[index].description!,
                    image: (widget.devices[index].image != null)
                        ? widget.devices[index].image!
                        : 'assets/splashscreen/user.png',
                    imageType: (widget.devices[index].image == null) ? 0 : 1,
                    sub: 'ر.ي${widget.devices[index].price.toString()}');

                /* TabItem(
                  title: (widget.devices[index].name == null)
                      ? 'name'
                      : widget.devices[index].name!,
                  content: (widget.devices[index].description == null)
                      ? 'content'
                      : widget.devices[index].description!,
                  image: (widget.devices[index].image == null)
                      ? widget.devices[index].image!
                      : 'assets/splashscreen/user.png',
                  imageType: (widget.devices[index].image == null) ? 0 : 1,
                  sub: (widget.devices[index].description == null)
                      ? '31'
                      : widget.devices[index].price.toString(),
                );
            */
              }),
        ],
      ),
    );
  }
}
