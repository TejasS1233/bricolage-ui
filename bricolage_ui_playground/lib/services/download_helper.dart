import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class DownloadHelper {
  /// Download a text file (like theme.dart)
  static void downloadFile(String content, String filename) {
    final blob = html.Blob([content], 'text/plain');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  /// Download a zip file (legacy - kept for backward compatibility)
  static void downloadZip(Uint8List zipBytes, String filename) {
    final blob = html.Blob([zipBytes], 'application/zip');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}
