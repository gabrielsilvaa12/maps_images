import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Gerencia a imagem
class ImageInput extends StatefulWidget {
  // final Function onselectImage;

  const ImageInput(void Function(File pickedImage) selectImage, {Key? key})
    : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  // Construindo o método
  _takePicture() async {
    final ImagePicker picker = ImagePicker();
    XFile imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600)
            as XFile;
    // Mudando o estado do widget
    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // Preview da imagem
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          // comando para a imagem pegar um arquivo de um diretório, caso contrário exibe o texto
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('Nenhuma imagem selecionada'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            icon: const Icon(Icons.camera_alt),
            label: const Text('Tirar Foto'),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
