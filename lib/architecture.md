# MVVM Architecture

## 1. `core/`

This folder contains shared resources and utilities that are used throughout the app. It's the backbone of reuseable code.

-   **Purpose**: Centralized configuration and reusable helpers.

-   **Sub-folders and Files:**

    -   `utils/`: Helper functions, validators, date formatters, etc.

        > Example:

        ```dart
        // utils/validators.dart
        bool isValidEmail(String email) => RegExp(r'\S+@\S+\.\S+').hasMatch(email);
        ```

    -   `constants.dart`: Centralized constants like API base URLs, text styles, etc.

        > Examples:

        ```dart
        const String baseUrl = "https://api.example.com";
        ```

    -   `themes.dart`: App-wide theming configurations (e.g., colors, text, styles).

        > Examples:

        ```dart
        final ThemeData appTheme = ThemeData(
        	primaryColor: Colors.blue,
        	textTheme: TextTheme(
        		headline1: TextStyle(fontSize: 24,
        		fontWeight: FontWeight.bold,
        		),
        	),
        );
        ```

## 2. `data/`

The data layer contains everything related to fetching and storing data (remote APIs, local databases).

-   **Purpose:** Decouple data fetching from business logic.

-   **Sub-folders and Files:**

    -   `models/:` Data models used for serialization/deserialization.

        > Examples:

        ```dart
        // models/task_models.dart
        class TaskModel {
        	final String id;
        	final String title;
        }

        TaskModel({
        	required this.id,
        	required this.title,
        });

        factory TaskModel.fromJson(Map<String, dynamic> json) {
        	return TaskModel(
        		id: json['id'],
        		title: json['title'],
        	);
        }

        Map<String, dynamic> toJson() => {'id': id, 'title': title};
        ```

    -   `repositories/`: Interfaces and implementations for fetching data.

        > Examples:

        ```dart
        // repositories/task_repositories.dart
        abstract class TaskRepository {
        	Future<List<TaskModel>> getTasks();
        }
        ```

    -   `datasources/`: Remote and local data sources (e.g., APIs, SQLite).

        > Examples:

        ```dart
        // datasources/task_remote_datasource.dart
        class TaskRemoteDataSource {
        	final Dio dio;

        	TaskRemoteDataSource(this.dio);

        	Future<List<TaskModel>> fetchTasks() async {
        		final response = await dio.get('tasks');

        		return (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
        	}
        }
        ```

## 3. `domain/`

The domain layer is purely focused on business logic and is app-agnostic.

-   **Purpose:** Maintain use cases and business entities.
-   **Sub-folders and Files:**

    -   `entities/`: Business-specific models (often simpler than data models)

        > Examples

        ```dart
        // entities/task.dart
        class Task {
            final String id;
            final String title;

            Task({required this.id, required this.title});
        }
        ```

    -   `usecases/`: Individual actions preformed by the app (e.g., fetch tasks, add a task).

        > Example:

        ```dart
        // usecases/get_tasks.dart
        class GetTasks {
            final TaskRepository repository;

            GetTasks(this.repository);

            Future<List<Task>> call() async {
                final task = await repository.getTasks();

                return tasks.map((model) => Task(id: model.id, title: model.title)).toList();
            }
        }
        ```

## 4. `presentation/`

This layer contains everything related to the user interface and state management.

-   **Purpose:** Manage user interaction and presentation logic.
-   **Sub-folders and Files:**

    -   `screens/`: Main app screens (e.g., home, login, settings).

        > Example:

        ```dart
        // screens/task_list_screen.dart
        class TaskListScreen extends StatelessWidget {
            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(title: Text('Tasks')),
                    body: TaskListWidget(),
                );
            }
        }
        ```

    -   `widgets/`: Reusable UI components.

        > Example:

        ```dart
        // widgets/task_item.dart
        class TaskItem extends Stateless {
            final Task task;

            TaskItem({required this.task});

            @override
            Widget build(BuildContext context) {
                return ListTile(title: Text(task.title));
            }
        }
        ```

    -   `state/`: State management logic (e.g., Provider, Bloc).

        > Example:

        ```dart
        class TaskProvider with ChangeNotifier {
            List<Task> _tasks = [];

            List<Task> get tasks => _tasks;

            void addTask(Task task) {
                _tasks.add(task);
                notifyListeners();
            }
        }
        ```

## 5. `main.dart`

The entry point of the app.

-   **Purpose:** Initialize the app and its dependencies.
-   **File Example:**

```dart
void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build (BuildContext context) {
        return MaterialApp(
            title: 'Task App',
            theme: appTheme,
            home: TaskListScreen(),
        )
    }
}
```
