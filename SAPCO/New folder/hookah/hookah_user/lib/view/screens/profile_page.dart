import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Stack(children: [
                const CircleAvatar(
                  radius: 54,
                  backgroundColor: Color(0xffffffff),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 19,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Color(0xFF020D4D),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              info(type: 'Name', icon: Icons.person, data: 'Lorem ipsum'),
              info(type: 'Email', icon: Icons.email, data: 'loremipsum.com'),
              info(type: 'Phone', icon: Icons.phone, data: '7679160077'),
            ],
          ),
        ),
      ),
    );
  }

  Widget info({String? type, IconData? icon, String? data}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 10),
            Text(
              type!,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Text(
            data!,
            style: const TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
