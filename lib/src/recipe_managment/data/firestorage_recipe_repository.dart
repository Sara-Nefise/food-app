import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

final firestorageRepositoryProvider = Provider<FirestorageRecipeRepository>(
  (_) => FirestorageRecipeRepository(FirebaseStorage.instance),
);

class FirestorageRecipeRepository {
  FirestorageRecipeRepository(this.storage);
  final FirebaseStorage storage;

  final ImagePicker imagePicker = ImagePicker();
  String? imagePath;

  Future<void> filePicker() async {
    print('file picker come');
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result == null) {
      BotToast.cleanAll();
      BotToast.showText(text: 'No image selected');
    }

    final path = result!.files.single.path;
    final finalName = result.files.single.name;

    File file = File(path!);
    try {
      await storage.ref(finalName).putFile(file);
      imagePath = await storage.ref(finalName).getDownloadURL();
    } catch (e) {
      print(e);
    }
  }
}
