import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailPassword extends StatelessWidget {
  const EmailPassword(
      {Key key, this.text, this.placeHolder, this.textInputType = TextInputType.text, this.isPassWord = false})
      : super(key: key);
  final String text;
  final String placeHolder;
  final TextInputType textInputType;
  final isPassWord;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: FindHomeColors.blue, fontWeight: FontWeight.w900)),
        Input(placeHolder: placeHolder, textInputType: textInputType, isPassWord: isPassWord),
      ],
    );
  }
}

class Input extends StatelessWidget {
  Input({Key key, @required this.placeHolder, @required this.textInputType, @required this.isPassWord})
      : super(key: key);
  final String placeHolder;
  final TextInputType textInputType;
  final isPassWord;

  final isOscure = ValueNotifier<bool>(true);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = placeHolder;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ValueListenableBuilder<bool>(
        valueListenable: isOscure,
        builder: (_, value, __) {
          return CupertinoTextField(
            padding: EdgeInsets.fromLTRB(40, 15, 10, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.5),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 5, offset: Offset(0, 2.5))],
            ),
            placeholder: placeHolder,
            controller: _controller,
            keyboardType: TextInputType.emailAddress,
            placeholderStyle:
                Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black54, fontWeight: FontWeight.w200),
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black87, fontWeight: FontWeight.w200),
            suffix: GestureDetector(
              onTap: isPassWord ? () => isOscure.value = !isOscure.value : null,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: !isPassWord
                    ? SvgPicture.asset('assets/images/find_home/house2.svg', width: 20)
                    : Icon(value ? Icons.visibility : Icons.visibility_off, color: Colors.black26),
              ),
            ),
            obscureText: isPassWord ? value : false,
          );
        },
      ),
    );
  }
}
