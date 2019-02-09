import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseState.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsPresenter.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsViewCallback.dart';

class ContactsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactsState();
}

class ContactsState extends BaseState<ContactsPresenter>
    implements ContactsViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contacts"));
  }
}
