# todo_app

[Tier 1] Programming HW2: Make a To-Do App with Flutter <br />
Olayeni Oladipo <br />
September 16, 2022 <br />

**Reflection:** What are the significant software concepts that this combination of technologies has that each previous set of technologies did not? Or that they handle significantly differently?

Flutter VS. HTML/CSS/JS
- Flutter is for UI developement for cross-platform applications. Though for my web application, flutter & dart accomplish the same thing as HTML/CSS/JS did. Differences is that whil HTML treats the page as document with elements added, flutter draws a page onto an HTML canvas, allowing it to control every pixel of the screen via widgets. This gives developers more control when using flutter and makes web dev easier.

Flutter VS. MongoDB/Node.JS
- These frameworks serve different purposes. Node.JS could be used as a backend for a flutter app. My todo app used Dart as the backend, but dart is more of a web programming language with libraries while node.js is an entire framework. For a full cross-platform flutter app, you'd have to use other languages as well like Swift for iOS or java/kotlin for Android.

**Important files to view:** lib/main.dart

**Instructions** to launch prototype:

1) Clone or download this repo, saving the files to a directory
2) Open terminal and CD into the directory of the downloaded files.
3) Open up terminal and enter:
>  flutter run <br />
(Select which Chrome device in the terminal if prompted to)
4) Your Chrome browswer will automatically open up a link of form localhost:#####/

On the link, play around with the following features: <br />
1) Add a to-do list item by pressing the + button in the bottom left corner and typing in a task.
2) Check off the to-do list item by pressing the todo list item
3) Press the trash icon to delete thetodo item.

Worked off the code from the following sources:
- https://docs.flutter.dev/get-started/test-drive#create-app <br/>
- https://daily-dev-tips.com/posts/build-a-todo-list-app-with-flutter/ <br/>
- https://github.com/rebelchris/flutter/blob/todolist/lib/main.dart <br/>
- https://github.com/bodykh/ToDo-List-App?ref=flutterawesome.com (for the delete functionality) <br />

Comments informed by the following:
- https://daily-dev-tips.com/posts/build-a-todo-list-app-with-flutter/ <br />
- https://dart.academy/creating-objects-and-classes-in-dart-and-flutter/ <br/>
- https://stackoverflow.com/questions/64324559/what-does-mean-of-using-the-this-keyword-in-dart <br />
- https://www.geeksforgeeks.org/dart-const-and-final-keyword/ <br />
- https://stackshare.io/stackups/dart-vs-nodejs <br />
- https://www.quora.com/What-is-Node-js-and-does-a-Flutter-app-use-it
