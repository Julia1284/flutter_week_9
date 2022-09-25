import 'package:flutter/material.dart';
import 'package:week_9/data/users.dart';

class UserPage extends StatefulWidget {
  bool _newLaunch;

  UserPage(this._newLaunch, {Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _name = '';
  String _surname = '';
  String _email = '';
  String _password = '';
  String _phoneNumber = '';

  Future changeLaunch(launch) async {
    await UserPreferences().setLaunch(launch);
  }

  loadUserName() async {
    setState(() {
      String userName = UserPreferences().getUsername() ?? '';
      String userSurname = UserPreferences().getUsersurname() ?? '';
      String email = UserPreferences().getEmail() ?? '';
      String password = UserPreferences().getPassword() ?? '';
      String phoneNumber = UserPreferences().getPhoneNumber() ?? '';
      _name = userName;
      _surname = userSurname;
      _email = email;
      _password = password;
      _phoneNumber = phoneNumber;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(children: [
              const Text(
                'Name:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                _name,
                style: const TextStyle(fontSize: 20),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const Text(
                'Surname:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                _surname,
                style: const TextStyle(fontSize: 20),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const Text(
                'Phone:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                _phoneNumber,
                style: const TextStyle(fontSize: 20),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              const Text(
                'Email:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                _email,
                style: const TextStyle(fontSize: 20),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    widget._newLaunch = false;
                  });
                  changeLaunch(widget._newLaunch);
                  Navigator.pushNamed(context, '/loginpage');
                },
                icon: const Icon(Icons.exit_to_app),
                label: const Text('Exit'))
          ],
        ),
      ),
    );
  }
}
