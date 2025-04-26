import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = "/sura-content";

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];

  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(args.suraName)),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.07,
            horizontal: 30,
          ),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child:
              ayat.isEmpty
                  ? LoadingIndicator()
                  : ListView.builder(
                    itemBuilder:
                        (context, index) => Text(
                          ayat[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                    itemCount: ayat.length,
                  ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(Duration(seconds: 2));
    print("after 2 sec");
    String sura = await rootBundle.loadString(
      "assets/text/${args.index + 1}.txt",
    );
    ayat = sura.split("\r\n");
    setState(() {});
  }
}
