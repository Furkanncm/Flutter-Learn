import 'dart:io';

import 'package:furkann/202/FileException.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IDowloand {
  bool? dowloandItem(FileItem? fileItem);

  Future<void> fileShare(Uri path) async {
    await launchUrl(path);
  }
}

class FileDowloand implements IDowloand {
  @override
  bool? dowloandItem(FileItem? fileItem) {
    if (fileItem == null) throw FileException().fileException();
    print("a");
    return true;
  }
  @override
  Future<void> fileShare(Uri path) async {
    await launchUrl(path);
  }
}



class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}
