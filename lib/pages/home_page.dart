import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app_pp/constant/base_constant.dart';

class MyHomePage extends StatefulWidget {
  final double paddingNumber = 8.0;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(BaseConstant.appName),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: widget.paddingNumber, top: widget.paddingNumber,bottom: widget.paddingNumber),
            child: Text(
              BaseConstant.myNotes,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return SvgPicture.asset("assets/svg/files-icon.svg");
              },
            ),
          ),
        ],
      ),
    );
  }
}
