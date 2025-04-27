import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/app_theme.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = "/hadeth-content";

  late Hadeth args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(args.tilte)),
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
          child: ListView.builder(
            itemBuilder:
                (context, index) => Text(
                  args.content[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
            itemCount: args.content.length,
          ),
        ),
      ),
    );
  }
}
