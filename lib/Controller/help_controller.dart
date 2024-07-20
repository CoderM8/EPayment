import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as path;

import '../UI/Profile/help_screen.dart';

class HelpController extends GetxController {
  final RxBool isImageValid = false.obs;
  File? selectedImage;
  File? selectedDocument;
  String? docName;

  String? audioPath;

  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  TextEditingController send = TextEditingController();

  bool _isRecording = false;

  AudioRecorder  recorder = AudioRecorder();

  Future<void> toggleRecording() async {
    audioPath = null;
    if (!_isRecording) {
      recorder.start(RecordConfig(bitRate:128000,sampleRate:  44100,encoder:AudioEncoder.aacLc ), path: audioPath??'');
    } else {
      audioPath = await recorder.stop();

      String audio = path.basename(audioPath!);
      sendMsg(send.text, selectedImage, selectedDocument, audio);
      audioPath = '';
      selectedImage = null;
      selectedDocument = null;
      docName = '';
    }

    _isRecording = !_isRecording;
  }

  Future<void> selectImage({required ImageSource imageSource}) async {
    isImageValid.value = false;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      selectedImage = File(image.path);
      selectedDocument = null;
      isImageValid.value = true;
    } else {
      isImageValid.value = false;
    }
  }

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'], // Add other extensions as needed
    );
    if (result != null) {
      selectedDocument = File(result.files.single.path!);
      docName = path.basename(selectedDocument!.path.toString());
      selectedImage = null;
    }
  }

  void sendMsg(String? text, File? image, File? document, String? audioFile) {
    if (text!.isNotEmpty || image != null || document != null || audioFile!.isNotEmpty) {
      ChatMessage message = ChatMessage(text: text, image: image, document: document, audioFile: audioFile!.isNotEmpty ? audioFile : '');
      messages.add(message);
      selectedImage = null;
      send.clear();
    }
  }
}
