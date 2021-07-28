// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:mime_type/mime_type.dart';
//
// const SUPPORTED_EXTENSIONS = [
//   'png',
//   'jpg',
//   'jpeg',
//   'pdf',
// ];
//
// extension UploadFileExtension on File {
//
//   Future<MultipartFile> get toMultiPart {
//     return MultipartFile.fromFile(
//       this.path,
//       filename: this.fileName,
//       contentType: MediaType(mime(this.fileName).split('/')[0], mime(this.fileName).split('/')[1]),
//     );
//   }
//
//   String get extension {
//     return this.path.substring(this.path.lastIndexOf('.') + 1).toLowerCase();
//   }
//
//   /// Return generated file name
//   String get fileName {
//     String name = DateTime.now().toIso8601String().substring(0, 19);
//     name = name.replaceAll(':', '').replaceAll('-', '').replaceAll('.', '');
//     name += '.${this.extension}';
//     return name;
//   }
//
//   /// Return the MIME type of the file
//   String get fileType {
//     switch (this.extension) {
//       case 'png':
//       case 'jpg':
//       case 'jpeg':
//         return 'image';
//       case 'pdf':
//         return 'application';
//       default:
//         return null;
//     }
//   }
//
//   /// Return true if the file extension is supported by the app
//   bool get isSupported => SUPPORTED_EXTENSIONS.contains(this.extension);
//
//   /// Return true if the file size is less than 10 MB, which is
//   /// the maximum size accepted by the back-end
//   bool get isAccepted => this.lengthSync() < 10 * 1024 * 1024;
//
//   bool get isNotNull => this != null;
// }
