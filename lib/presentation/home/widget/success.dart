import 'package:flutter/material.dart';
import 'package:quest/domain/model/people.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    this.data,
  });

  final List<PeopleModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(
              data[index].name,
            ),
            subtitle: Text(
              data[index].role,
            ),
          ),
        );
      },
    );
  }
}
