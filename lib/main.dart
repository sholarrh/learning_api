import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => apiCalls()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiCalls().api_class();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<apiCalls>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Api Testing',
          style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: FutureBuilder(
              future: apiCalls().api_class(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      final apidata = snapshot.data!.data!;
                      if (snapshot.hasData) {
                        if (snapshot.hasError){
                          return Center(
                            child: Container(
                              child: Text(
                                'There is an error'
                              ),
                            ),
                          );
                        }
                        return ListTile(
                          title: Text(apidata[index].name!),
                          subtitle: Text(apidata[index].id.toString()),
                          leading: Column(
                            children: [
                              Text(apidata[index].pantoneValue.toString()),
                              Text(apidata[index].year.toString()),
                              Text(apidata[index].color.toString()),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: data.api_class,
          child: const Icon(Icons.add),
        ),
        ),
    );
  }
}


