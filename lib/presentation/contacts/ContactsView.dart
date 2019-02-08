import 'package:flutter/material.dart';
import 'package:flutter_telegram_client/presentation/base/BaseView.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsPresenter.dart';
import 'package:flutter_telegram_client/presentation/contacts/ContactsViewCallback.dart';

class ContactsWidget extends StatefulWidget {
  ContactsWidget(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() => ContactsView();
}

class ContactsView extends BaseView<ContactsWidget, ContactsPresenter>
    implements ContactsViewCallback {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contacts"));
  }
}
