import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final String title;
  bool isRequired, isPassword;
  final double marginBottom   ;

  MyInput({
    Key? key,
    required this.title,
    this.isRequired = true,
    this.isPassword = false,
    this.marginBottom =20,
  }) : super(key: key);

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.marginBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.title}${widget.isRequired ? '*' : ''}',
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xff353636),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: TextFormField(
              obscureText: widget.isPassword && isHidden,
              style: const TextStyle(fontSize: 17),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: const Color(0xffEBEBEB),
                  filled: true,
                  suffixIcon: widget.isPassword
                      ? GestureDetector(
                          onTap: () {
                            isHidden = !isHidden;
                            setState(() {});
                          },
                          child: Icon(isHidden
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )
                      : null),
            ),
          ),
        ],
      ),
    );
  }
}
