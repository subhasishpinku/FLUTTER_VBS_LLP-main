import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:global_ios/screens/login.dart';
import 'package:global_ios/utilities/appbar.dart';
import 'package:global_ios/utilities/progress.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

class Comments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  Comments({
    this.postId = "",
    this.postOwnerId = "",
    this.postMediaUrl = "",
  });

  @override
  CommentsState createState() => CommentsState(
        postId: this.postId,
        postOwnerId: this.postOwnerId,
        postMediaUrl: this.postMediaUrl,
      );
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  CommentsState({
    this.postId = "",
    this.postOwnerId = "",
    this.postMediaUrl = "",
  });

  buildComments() {
    return StreamBuilder(
        stream: commentsRef
            .doc(postId)
            .collection('comments')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const SpinKitThreeBounce(
              color: Colors.grey,
              size: 35,
            );
            // circularProgress();
          }

          List<Comment> comments = [];
          snapshot.data.docs.forEach((doc) {
            comments.add(Comment.fromDocument(doc));
          });
          return ListView(children: comments);
        });
  }

  addComment() {
    commentsRef.doc(postId).collection('comments').add({
      'username': currentUser!.username,
      'comment': commentController.text,
      'timestamp': timestamp,
      'avatarUrl': currentUser!.photoUrl,
      'userId': currentUser!.id,
    });

    bool isNotPostOwner = postOwnerId != currentUser!.id;

    if (isNotPostOwner) {
      activityFeedRef.doc(postOwnerId).collection('feedItems').add({
        'type': 'comment',
        'commentData': commentController.text,
        'username': currentUser!.username,
        'timestamp': timestamp,
        'postId': postId,
        'userId': currentUser!.id,
        'userProfileImg': currentUser!.photoUrl,
        'mediaUrl': postMediaUrl,
      });
    }

    commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, false, 'Comments', false),
      body: Column(children: <Widget>[
        Expanded(child: buildComments()),
        Divider(),
        ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Write a comment...'),
            ),
            trailing: OutlineButton(
              onPressed: addComment,
              borderSide: BorderSide.none,
              child: Text('Post'),
            ))
      ]),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  Comment({
    this.username = "",
    this.userId = "",
    this.avatarUrl = "",
    this.comment = "",
    required this.timestamp,
  });

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
      username: doc['username'],
      userId: doc['userId'],
      comment: doc['comment'],
      timestamp: doc['timestamp'],
      avatarUrl: doc['avatarUrl'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(comment),
          leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatarUrl)),
          subtitle: Text(timeago.format(timestamp.toDate())),
        ),
        Divider(),
      ],
    );
  }
}
