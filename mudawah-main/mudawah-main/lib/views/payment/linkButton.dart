import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({Key? key, required this.urlLabel, required this.url})
      : super(key: key);

  final String urlLabel;
  final String url;

  openwhatsapp(BuildContext context) async {
    var whatsapp = "+967738233130";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=السلام عليكم";
//  var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    //else{
    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("عفوا لبس لديك تطبيق واتساب")));

      //  }

    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onPressed: () {
        openwhatsapp(context);
      },
      child: Text(urlLabel),
    );
  }
}
