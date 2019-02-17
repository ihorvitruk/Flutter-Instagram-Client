import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Profile.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfileViewCallback.dart';

class ProfileView extends BaseView<ProfileState> {
  @override
  ProfileState state() => ProfileState();
}

class ProfileState extends BaseState<ProfilePresenter>
    implements ProfileViewCallback {
  Profile _profile = Profile.empty();

  @override
  Widget create(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1.5)),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 5)),
                          child: ClipOval(
                              child: Image.network(
                            _profile.profilePicture,
                            width: 100,
                            height: 100,
                          )))),
                  Text(_profile.username)
                ]),
                Column(
                  children: [
                    DefaultTextStyle(
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        child: Row(
                          children: [
                            Padding(
                                child: Column(children: [
                                  Text(
                                    _profile.counts.media.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(Strings.profilePosts)
                                ]),
                                padding: EdgeInsets.all(14)),
                            Padding(
                                child: Column(children: [
                                  Text(_profile.counts.followedBy.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text(Strings.profileFollowers)
                                ]),
                                padding: EdgeInsets.all(14)),
                            Padding(
                              child: Column(children: [
                                Text(_profile.counts.follows.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text(Strings.profileFollowing)
                              ]),
                              padding: EdgeInsets.all(20),
                            )
                          ],
                        )),
                    Text(_profile.fullName)
                  ],
                )
              ])),
          Text(
            _profile.bio,
          )
        ]));
  }

  @override
  onProfileLoaded(Profile profile) {
    setState(() {
      _profile = profile;
    });
  }
}
