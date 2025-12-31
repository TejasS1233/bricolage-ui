import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class DownloadHelper {
  static void downloadZip(Uint8List zipBytes, String filename) {
    final blob = html.Blob([zipBytes], 'application/zip');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}
