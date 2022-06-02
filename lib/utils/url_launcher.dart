import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, String scan) async {
  final _url = scan;

  if (_url.contains('geo')) {
    //Estoy enviando la Goe localizacion
    Navigator.pushNamed(context, 'map', arguments: scan);
  } else {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      'Could not launch $_url';
      return null;
    }
  }
}
