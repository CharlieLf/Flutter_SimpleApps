import 'package:flutter/material.dart';
import 'package:flutterqualif/func/snackbar_func.dart';
import 'package:flutterqualif/model/comment_model.dart';
import 'package:flutterqualif/model/item_model.dart';

class DetailPage extends StatefulWidget {
  final ItemModel item;
  final String username;
  const DetailPage({super.key, required this.item, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String _comment = "";
  List<CommentModel> listComment = [
    CommentModel(name: "Dummy", comment: "Nice One...")
  ];

  void addNewComment(String desc) {
    CommentModel newCommn = CommentModel(name: widget.username, comment: desc);
    if(desc.isEmpty){
      showSnackBar(context, "Input Your Comment!!");
      return;
    }
    Future.microtask(() {
      setState(() {
        listComment.add(newCommn);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.view_compact_alt_outlined),
                child: Text("Detail"),
              ),
              Tab(
                icon: Icon(Icons.comment),
                child: Text("Model History"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Detail Content
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Image.network(widget.item.image),
                    const SizedBox(height: 15.0),
                    Text(widget.item.name),
                    const SizedBox(height: 15.0),
                    Text(widget.item.description),
                    const SizedBox(height: 20.0),
                    // Comment Field
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _comment = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "Enter your comment...",
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        addNewComment(_comment);
                      },
                      child: const Text("Add Comment"),
                    ),
                  ],
                ),
              ),
            ),
            // Comment Section
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: listComment.map((comment) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(comment.comment),
                        const Divider()
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
