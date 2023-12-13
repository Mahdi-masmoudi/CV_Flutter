import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class PageAva extends StatelessWidget {
  final double coverHeight = 200;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
        Positioned(
          top: top + 150,
          child: Container(
            child: BuildContent(),
          ),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.network(
      'https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D',
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: NetworkImage(
        'https://scontent.ftun1-2.fna.fbcdn.net/v/t1.6435-9/148553364_745458836094780_8485389742814564199_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7a1959&_nc_ohc=p2iSv6KdavsAX900puA&_nc_ht=scontent.ftun1-2.fna&oh=00_AfAMAmkiDnSqtCjnKJ209fDM4s1U2vaD_DpVhX0dJ90Wdg&oe=658C4119'),
  );

  Widget BuildContent() => Column(
    children: [
      const SizedBox(
        height: 8,
      ),
      Text(
        'Mahdi Masmoudi'.tr,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
      const SizedBox(height: 18),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(width: 12),
          SocialIcon(
            icon: FontAwesomeIcons.github,
            url: 'https://github.com/Mahdi-masmoudi',
          ),
          const SizedBox(width: 12),
          SocialIcon(
            icon: FontAwesomeIcons.twitter,
            url: 'https://twitter.com/Mahdi-masmoudi',
          ),
          const SizedBox(width: 12),
          SocialIcon(
            icon: FontAwesomeIcons.envelope,
            url: 'https://linkedin.com/in/Mahdi-masmoudi',
          ),
          const SizedBox(width: 12),
        ],
      ),
    ],
  );

  Widget buildSocialIcon(IconData icon, String url) => CircleAvatar(
    radius: 25,
    child: Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          launch(url);
        },
        child: Center(
          child: Icon(icon, size: 32),
        ),
      ),
    ),
  );
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            launch(url);
          },
          child: Center(
            child: Icon(icon, size: 32),
          ),
        ),
      ),
    );
  }
}
