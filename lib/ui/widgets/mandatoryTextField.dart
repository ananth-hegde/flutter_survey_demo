import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MandatoryTextField extends StatefulWidget {
  final Function onChange;
  final String label;
  final String? errorMessage;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforced;
  MandatoryTextField(
      this.onChange, this.label, this.errorMessage, this.hintText,
      [this.keyboardType = TextInputType.text,
      this.maxLength,
      this.maxLengthEnforced = MaxLengthEnforcement.none]);

  @override
  _MandatoryTextFieldState createState() => _MandatoryTextFieldState();
}

class _MandatoryTextFieldState extends State<MandatoryTextField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 9,
            child: Container(
              width: 600.0,
              
              child: TextField(
                  controller: controller,
                  keyboardType: widget.keyboardType,
                  maxLengthEnforcement: widget.maxLengthEnforced,
                  maxLength: widget.maxLength,
                  decoration: InputDecoration(
                    floatingLabelBehavior: widget.label.length<50?FloatingLabelBehavior.auto:FloatingLabelBehavior.never,
                    
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    labelText: widget.label,
                    hintText: widget.hintText,
                    errorText: widget.errorMessage,
                  ),
                  onChanged: (value) => widget.onChange(value),
                ),
              ),
            ),
          Flexible(
            flex: 1,
            child: Text(
              ' *',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
