
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shapecoach/models/post.dart';
import 'package:shapecoach/ui/shared/ui_helpers.dart';
import 'package:shapecoach/ui/widgets/input_field.dart';
import 'package:shapecoach/viewmodels/CreatePostViewModel .dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'TakePic.dart';

class CreatePostView extends StatelessWidget {
  final titleController = TextEditingController();
  final Post edittingPost;

  // File _image;


  final massController = TextEditingController();
  final heightController = TextEditingController();
  final hipController = TextEditingController();
  final neckController = TextEditingController();
  final waistController = TextEditingController();


  CreatePostView({Key key, this.edittingPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePostViewModel>.reactive(
      viewModelBuilder: () => CreatePostViewModel(),
      onModelReady: (model) {
        // update the text in the controller
        titleController.text = edittingPost?.title ?? '';

        model.setEdittingPost(edittingPost);
      },
      builder: (context, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: !model.busy
                ? Icon(Icons.add)
                : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
            onPressed: () {
              if (!model.busy) {
                model.addPost(title: titleController.text);
                // model.addPost(title: titleController.text + "  " + massController.text+ "  " + heightController.text  );

              }
            },
            backgroundColor:
            !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                verticalSpace(40),
                verticalSpaceMedium,
                Text(
                  'Fortschrittsbericht', //progress
                  style: TextStyle(fontSize: 26),
                ),
                verticalSpaceMedium,
                InputField(
                  placeholder: 'Grösse',
                  controller: heightController,
                ),
                InputField(
                  placeholder: 'Dein Gewicht (KG)',
                  controller: massController,
                ),
                InputField(
                  placeholder: 'Taillenumfang (CM)',
                  controller: waistController,
                ),
                InputField(
                  placeholder: 'Hüftumfang (CM)',
                  controller: hipController,
                ),
                InputField(
                  placeholder: 'Halsumfangs (CM)',
                  controller: neckController,
                ),
                verticalSpaceMedium,
                Text('Bild auswählen'), // choose image
                verticalSpaceSmall,
                // _image == null   ? RaisedButton
                     RaisedButton(
                  child: Text('ein Bild machen'), // Take picture
                  onPressed: () {
                    _getFromCamera();
                  },
                  color: Colors.grey,
                ),
            verticalSpaceMedium,

                GestureDetector(
                  // When we tap we call selectImage
                  onTap: () => model.selectImage(),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    // If the selected image is null we show "Tap to add post image"
                    child: model.selectedImage == null
                        ? Text(
                      'Bild hochladen', //  tap for image
                      style: TextStyle(color: Colors.grey[400]),
                    )
                    // If we have a selected image we want to show it
                        : Image.file(model.selectedImage),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

_getFromCamera() async {
  File imageFile;
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );


}
