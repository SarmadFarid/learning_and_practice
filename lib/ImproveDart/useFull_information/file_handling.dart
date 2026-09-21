/* File Handling: 
file handling means working with files and directories in your app, creating them , writing into them , reading them , deleting them and checking them etc 

/// Why we use File handling in dart ? 
to persist data that survive app restarts .
for offline storage of user data , downloaded content ,cache logs etc .
for managing files , images , doc , custom data etc . 

1. Finding a local path in fluter
On mobile (Android/iOS), you use the path_provider package to determine a valid directory (documents, temporary). 
 
Example:
final directory = await getApplicationDocumentsDirectory();
String path = directory.path;

3. Creating a File Reference
With the path you choose, create a File object:
File file = File('$path/myfile.txt');

4. Writing Data to a File
You can write text or bytes:
await file.writeAsString('Hello file!');
Or bytes for images etc. 

5. Reading Data from a File
String contents = await file.readAsString();
You can also read as bytes or use streams for large files. 


6. Appending / Updating File
You can open write in append mode:
await file.writeAsString('More data', mode: FileMode.append);

7. Deleting / Checking Existence
bool exists = await file.exists();
await file.delete();

8. Directory Operations
You can create directories, list contents, check metadata: 
scaler.com

Directory dir = Directory('$path/myFolder');
await dir.create();
List<FileSystemEntity> contents = dir.listSync();

9. Sync vs Async Methods
There are synchronous methods (e.g., readAsStringSync()) and asynchronous ones (readAsString() returning a Future). Using async is best for UI apps to avoid blocking. 

10. File Handling in Flutter Context
Because Flutter apps often run UI thread, use async methods for file I/O. Also you may use file caching, logs, saving JSON, offline images, user documents.

11. Platform Restrictions / Permissions

On Android especially you must consider permission and storage access (especially external storage). Some folders are sandboxed. 
 */
 
 // Flutter example read and write files . 
/* 
//  error occures in this example and i will fix it later . 
 import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory() ; 
    return directory.path ; 
  }

  Future<File> get _localFile async {
    final path  = await _localPath ;
    return File("$path/data.txt") ;
  }  

  Future<String>  readData() async {
    try {
      final file = await _localFile ; 
      final content  = await file.readAsString(); 
      return content ;
    } catch (e) {
      return 'no Data'; 
    }
  }

  Future<File>  writeData(String data) async {
   final file = await _localFile ; 
   return file.writeAsString(data); 
  } 
 }

 void main() {
  FileStorage storage = FileStorage(); 
  String _content = '';  

  @override
  void initState() {
    storage.readData().then( (value) {
      _content = value ; 
      print(_content) ; 
    }) ;
  } 

  void _save() async{
   await storage.writeData("Save at ${DateTime.now()}");  
   String newData = await storage.readData();
   _content = newData ;  
   print(_content); 
  } 

  _save() ;
 }

 */
