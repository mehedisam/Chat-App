import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPickerImage extends StatefulWidget {
  UserPickerImage({super.key,required this.ImagePicker});
  final void Function(File pickedImage) ImagePicker;
  @override
  State<UserPickerImage> createState() {
    return _UserPickerImageState();
  }
}

class _UserPickerImageState extends State<UserPickerImage> {
  File? _picker;

  void pickedImage() async {
    final _Imgpicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 150,
      imageQuality: 50,
    );
    if (_Imgpicker == null) {
      return;
    }
    setState(() {
      _picker = File(_Imgpicker.path);
      
    });
    widget.ImagePicker(_picker!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: const Color.fromARGB(255, 180, 49, 49),
          foregroundImage: _picker != null ? FileImage(_picker!) : null,
        ),
        TextButton.icon(
          onPressed: pickedImage,
          icon: Icon(Icons.image),
          label: Text(
            'Add Image',
            style: TextStyle(color: Theme.of(context).colorScheme.scrim),
          ),
        ),
      ],
    );
  }
}
