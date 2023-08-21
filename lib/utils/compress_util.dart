import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class CompressUtil {
  static Future<File> compressImage(File file, int maxSize) async {
    if (file.lengthSync() < 1024 * 1024) {
      return file;
    }
    var dir = await getTemporaryDirectory();
    var targetPath =
        '${'${dir.path}/'}${DateTime.now().millisecondsSinceEpoch}.jpeg';
    final result = await FlutterImageCompress.compressAndGetFile(
        file.path, targetPath,
        quality: 80);
    File compressedFile = File(result!.path);
    return compressedFile;
  }
}
