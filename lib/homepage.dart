import 'package:first_try_null_safety/api.dart';
import 'package:first_try_null_safety/weviewpage.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Null Safety',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      body: FutureBuilder(
        future: Api().apiNoW(),
        builder: (context, AsyncSnapshot<List<Article>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WebViewPage(
                        url: snapshot.data![index].url,
                        title: snapshot.data![index].title,
                      );
                    })),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          snapshot.data![index].urlToImage!,
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
                          child: Text(
                            snapshot.data![index].title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        ExpansionTile(
                          title: const Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data![index].description!),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "${snapshot.data![index].publishedAt!.day}"
                                "/"
                                "${snapshot.data![index].publishedAt!.month}"
                                "/"
                                "${snapshot.data![index].publishedAt!.year}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              Spacer(),
                              Text(
                                snapshot.data![index].author!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                });
          } else if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
