import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';
import 'package:flutter_samples/diet_fast/utils/extras.dart';

class Input extends StatelessWidget {
  Input({Key key, this.isPass = false}) : super(key: key);
  final bool isPass;

  final isValid = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: ValueListenableBuilder<bool>(
        valueListenable: isValid,
        builder: (_, value, __) => CupertinoTextField(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          obscureText: isPass ? !value : false,
          onChanged: (text) => isValid.value = Extras.isValidEmail(text),
          keyboardType: TextInputType.emailAddress,
          placeholder: isPass ? 'Password' : 'Email',
          placeholderStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black38),
          style: Theme.of(context).textTheme.bodyText1,
          suffix: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: isPass
                ? GestureDetector(
                    onTap: () => isValid.value = !isValid.value,
                    child: Icon(!value ? Icons.visibility : Icons.visibility_off, size: 20, color: Colors.black26),
                  )
                : Icon(Icons.check_circle, size: 20, color: value ? DietFastColors.primary : Colors.black26),
          ),
        ),
      ),
    );
  }
}
