import 'package:chatapp/core/theme/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Recent",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContacts("Marry", context),
                _buildRecentContacts("Marry", context),
                _buildRecentContacts("Marry", context),
                _buildRecentContacts("Marry", context),
                _buildRecentContacts("Marry", context),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                children: [
                  _buildMessageTile("Marry", "Marry@gmail.com", "08:43"),
                  _buildMessageTile("Marry", "Marry@gmail.com", "08:43"),
                  _buildMessageTile("Marry", "Marry@gmail.com", "08:43"),
                  _buildMessageTile("Marry", "Marry@gmail.com", "08:43"),
                  _buildMessageTile("Marry", "Marry@gmail.com", "08:43"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            "https://cdn.vectorstock.com/i/1000v/23/81/default-avatar-profile-icon-vector-18942381.jpg"),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(
          color: Colors.grey,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildRecentContacts(String name, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://cdn.vectorstock.com/i/1000v/23/81/default-avatar-profile-icon-vector-18942381.jpg"),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
