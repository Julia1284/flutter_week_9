import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week_9/data/users.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // функция добавления данных в память
  Future addUser(email, password, name, surname, phoneNumber) async {
    await UserPreferences().setEmail(email);
    await UserPreferences().setPassword(password);
    await UserPreferences().setUsername(name);
    await UserPreferences().setUsersurname(surname);
    await UserPreferences().setPhoneNumber(phoneNumber);
  }

  final _formKey = GlobalKey<FormState>();
  var _agreement = false;
  String name = '';
  String surname = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  @override
  void initState() {
    super.initState();
    email = UserPreferences().getEmail() ?? '';
    password = UserPreferences().getPassword() ?? '';
    name = UserPreferences().getUsername() ?? '';
    surname = UserPreferences().getUsersurname() ?? '';
    phoneNumber = UserPreferences().getPhoneNumber() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Registration'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 270,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Name*',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (name) => setState(() {
                            this.name = name;
                          }),
                          validator: ((name) {
                            if (name!.isEmpty) return 'Input name';
                            return null;
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 270,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Surname*',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (surname) => setState(() {
                            this.surname = surname;
                          }),
                          validator: ((surname) {
                            if (surname!.isEmpty) return 'Input surname';
                            return null;
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 270,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'E-mail address*',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onChanged: (email) => setState(() {
                            this.email = email;
                          }),
                          validator: ((email) {
                            if (email!.isEmpty) return 'Input E-mail address';
                            if (!email.contains('@')) return 'It is not E-mail';
                            return null;
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 270,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Mobile Number*',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (phoneNumber) => setState(() {
                            this.phoneNumber = phoneNumber;
                          }),
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'Input Mobile number';
                            }
                            if (value.length < 11) {
                              return 'Not enough digits for a phone number';
                            }
                            if (value.length > 11) {
                              return ' You have entered extra digits';
                            }
                            return null;
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 270,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Password*',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          obscureText: true,
                          onChanged: (password) => setState(() {
                            this.password = password;
                          }),
                          validator: ((password) {
                            if (password!.isEmpty) return 'Input password';
                            return null;
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: _agreement,
                              onChanged: (bool? value) =>
                                  setState(() => _agreement = value!)),
                          const Text('I accept all terms and conditions')
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // при нажатии проверяем все ли поля заполнены, добавляем данные в память м возвращаемся на страницу логина
                            if (_formKey.currentState!.validate()) {
                              Color color = Colors.red;
                              String text;
                              if (_agreement == false) {
                                text =
                                    'It is necessary to accept the terms of the agreement';
                              } else {
                                text = 'Regisration successful';
                                color = Colors.green;
                              }

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(text),
                                backgroundColor: color,
                              ));
                            }
                            addUser(
                                email, password, name, surname, phoneNumber);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Sign in'))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
