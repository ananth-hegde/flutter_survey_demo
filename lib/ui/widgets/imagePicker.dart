import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyImagePicker extends StatefulWidget {
  final String label;
  final Function onUpload;
  MyImagePicker(this.label, this.onUpload);
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<MyImagePicker> {
  late File image;
  String? imagePath;

  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext _) {
          return SafeArea(
            child: Container(
                child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () {
                    _uploadImage('gallery', widget.onUpload);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Camera'),
                  onTap: () {
                    _uploadImage('camera', widget.onUpload);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )),
          );
        });
  }

  void _uploadImage(String type, Function updateFile) async {
    final _picker = ImagePicker();
    var _pickedImage;
    if (type == 'camera') {
      _pickedImage = await _picker.getImage(source: ImageSource.camera);
    } else {
      _pickedImage = await _picker.getImage(source: ImageSource.gallery);
    }
    if (_pickedImage != null) {
      setState(() {
        imagePath = _pickedImage.path;
        image = File(_pickedImage.path);
      });
      updateFile(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Text(widget.label),
              ),
              Expanded(
                  flex: 1,
                  child: imagePath == null
                      ? InkWell(
                          child: Image.asset(
                            'assets/images/placeholder.png',
                          ),
                          onTap: () {
                            _showPicker();
                          },
                        )
                      : Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: FittedBox(
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.file(
                                      image,
                                      height: 313,
                                      width: 313,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 30, height: 30),
                              child: MaterialButton(
                                padding: EdgeInsets.all(0),
                                minWidth: 0,
                                child: Center(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    imagePath = null;
                                    widget.onUpload(null);

                                  });
                                },
                                elevation: 2.0,
                                shape: CircleBorder(),
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ))
            ]));
  }
}
