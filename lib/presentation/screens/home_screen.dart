import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:manish_habit_tracking_app/domain/model/quote.dart';
import 'package:manish_habit_tracking_app/presentation/router/routes_name.dart';
import 'package:manish_habit_tracking_app/provider/quote_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Quote>> quoteList = ref.watch(quoteFutureProvidr);

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.go(RoutesName.create.path());
          },
          label: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 4.0),
                child: Icon(Icons.add),
              ),
              Text("Create Habbit")
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text("demo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ) //TextStyle
                      ), //Text
                  background: Image.asset(
                      'images/habit_tracker_logo.png') //Images.network
                  ), //FlexibleSpaceBar
              expandedHeight: 230,
              backgroundColor: Colors.greenAccent[400],
              leading: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () {},
              ), //IconButton
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.comment),
                  tooltip: 'Comment Icon',
                  onPressed: () {},
                ), //IconButton
                IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Setting Icon',
                  onPressed: () {},
                ), //IconButton
              ], //<Widget>[]
            ), //SliverAppBar
            SliverList(
                delegate: quoteList.when(data: (data) {
              return SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data[index].toString()),
                  );
                },
                childCount: data.length,
              );
            }, error: (error, stk) {
              return SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const ListTile(
                    title: Text('Error'),
                  );
                },
                childCount: 1,
              );
            }, loading: () {
              return SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const ListTile(
                    title: Text('Loading...'),
                  );
                },
                childCount: 1,
              );
            })) //SliverList
          ],
        ));
  }
}
