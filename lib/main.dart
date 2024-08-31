import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainWith = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: (mainWith <= 600)
            ? AppBar(
                title: const Text('فروشگاه'),
                centerTitle: true,
              )
            : null,
        drawer: (mainWith <= 600)
            ? Drawer(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('ایتم اول'),
                    ),
                    ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('ایتم اول'),
                    ),
                    ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('ایتم اول'),
                    ),
                    ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('ایتم اول'),
                    ),
                    ListTile(
                      leading: Icon(Icons.shop),
                      title: Text('ایتم اول'),
                    ),
                  ],
                ),
              )
            : null,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return const MobileView();
            } else {
              return const DesktopView();
            }
          },
        ));
  }
}

class MobileView extends StatelessWidget {
  const MobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          height: 300,
          margin: const EdgeInsets.symmetric(vertical: 10),
          color: Colors.blueAccent,
          child: Text('item$index'),
        );
      },
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                6,
                (index) {
                  return Card(
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text('item $index'),
                    ),
                  );
                },
              ),
            )),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const Column(
              children: [
                Text('ایتم1'),
                Text('ایتم2'),
                Text('ایتم3'),
                Text('ایتم4'),
                Text('ایتم5'),
                Text('ایتم6'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
