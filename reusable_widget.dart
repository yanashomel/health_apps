import 'package:flutter/material.dart';

Image logoWidget(String imageName){
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 240,
      height: 240,
    );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller){
  return TextField (
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style:TextStyle(color: Colors.grey.withOpacity(0.9)),
    decoration: InputDecoration(
       prefixIcon: Icon(
        icon, 
        color: Colors.white30,
      ),
      labelText:text,
      labelStyle: TextStyle(color: Colors.white30.withOpacity(0.5)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.black.withOpacity(0.4),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), 
          borderSide: const BorderSide(width:0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,  
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap){
return Container(
  width: MediaQuery.of(context).size.width,
  height: 50,
  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
  child: ElevatedButton(
    onPressed: (){
      onTap();
    },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states){
          if (states.contains(WidgetState.pressed)){
            return Colors.black26;
          }
          return Colors.white;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    child: Text(
      isLogin ? "LOG IN" : "SIGN UP",
      style: const TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      )
    ),
  );
}