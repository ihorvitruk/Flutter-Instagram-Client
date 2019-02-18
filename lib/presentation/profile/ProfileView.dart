import 'package:flutter/material.dart';
import 'package:flutter_instagram_client/domain/entity/Profile.dart';
import 'package:flutter_instagram_client/presentation/Strings.dart';
import 'package:flutter_instagram_client/presentation/base/BaseView.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfilePresenter.dart';
import 'package:flutter_instagram_client/presentation/profile/ProfileViewCallback.dart';
import 'package:flutter_instagram_client/presentation/splash/SplashView.dart';

class ProfileView extends BaseView<ProfileState> {
  @override
  ProfileState state() => ProfileState();
}

class ProfileState extends BaseState<ProfilePresenter, ProfileView>
    implements ProfileViewCallback {
  Profile _profile = Profile.empty();

  @override
  Widget create(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(fontSize: 16, color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.grey, width: 1.5)),
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: ClipOval(
                                    child: Image.network(
                                  _profile.profilePicture,
                                  width: 100,
                                  height: 100,
                                )))),
                        Column(children: [
                          Row(
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
                                  padding: EdgeInsets.all(12)),
                              Padding(
                                  child: Column(children: [
                                    Text(_profile.counts.followedBy.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text(Strings.profileFollowers)
                                  ]),
                                  padding: EdgeInsets.all(12)),
                              Padding(
                                child: Column(children: [
                                  Text(_profile.counts.follows.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text(Strings.profileFollowing)
                                ]),
                                padding: EdgeInsets.all(12),
                              )
                            ],
                          ),
                          OutlineButton(
                            padding: EdgeInsets.only(left: 100, right: 100),
                            onPressed: () {
                              presenter.onLogoutTap();
                            },
                            child: Text(
                              Strings.profileLogout,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ])
                      ])),
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(_profile.fullName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
                Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(_profile.username)),
                Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(_profile.bio,
                        style: TextStyle(color: Colors.black))),
                Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: GestureDetector(
                        onTap: () {
                          presenter.onWebsiteLinkTap(_profile.website);
                        },
                        child: Text(_profile.website,
                            style: TextStyle(color: Colors.blue)))),
              ])
            ])));
  }

  @override
  onProfileLoaded(Profile profile) {
    setState(() {
      _profile = profile;
    });
  }

  @override
  onLogoutSuccess(bool success) {
    push(SplashView());
  }
}
