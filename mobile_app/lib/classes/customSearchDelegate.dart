import 'package:flutter/material.dart';
import 'package:mobile_app/pages/all_menu.dart';
import 'allmenu_form.dart';
import 'package:collection/iterable_zip.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  final List<String> exminName = [
    'Complete blood culture',
    'Knee MRI',
    'Heart'
  ];
  final List byname = ['alfa lab', 'alfa scan', 'Ga3fr el3omda'];
  static List pic = ['lab.png', 'rad.png', 'doctor.png'];
  static List report = [
    '',
    'TextSpan is a little strange',
    'TextSpan is a little strange'
  ];
  static List others = [
    'TextSpan is a little strange. The text parameter is the default style but the children list contains the styled',
    'very good',
    'pruffen'
  ];
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    List<String> matchedName = [];

    final List<Allmenu> alldata = List.generate(
        exminName.length,
        (index) => Allmenu(
              exminName: exminName[index],
              report: '${report[index]}',
              pic: '${pic[index]}',
              byname: '${byname[index]}',
              others: '${others[index]}',
            ));
    for (final pairs in IterableZip([exminName, byname])) {
      if (pairs[0].toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(pairs[0]);
        matchedName.add(pairs[1]);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(matchquery[index]),
        subtitle: Text(matchedName[index]),
        onTap: () {
          close(context, alldata[index].exminName);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => all_menu(
                    allmenu: alldata[index],
                  )));
        },
      ),
      itemCount: matchquery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchquery = [];
    List<String> matchedName = [];
    final List<Allmenu> alldata = List.generate(
        exminName.length,
        (index) => Allmenu(
              exminName: exminName[index],
              report: '${report[index]}',
              pic: '${pic[index]}',
              byname: '${byname[index]}',
              others: '${others[index]}',
            ));
    // for (final pairs in exminName) {
    //   if (element.toLowerCase().contains(query.toLowerCase())) {
    //     // matchquery.add(element);
    //     print(matchquery[element]);
    //   }
    // }
    for (final pairs in IterableZip([exminName, byname, others])) {
      if (pairs[0].toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(pairs[0]);
        matchedName.add(pairs[1]);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(matchquery[index]),
        subtitle: Text(matchedName[index]),
        onTap: () {
          close(context, alldata[index].exminName);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => all_menu(
                    allmenu: alldata[index],
                  )));
        },
      ),
      itemCount: matchquery.length,
    );
  }
}
