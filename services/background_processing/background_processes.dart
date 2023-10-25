import 'package:amthal_sha3beya/3_data/services/notifications/notifications.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';

//made for ios only
const firstBgTaskName = "showNotification";
Future<void> initializeBackProcessingWithPeriodicTasks() async {
  await Workmanager().initialize(callBackDispatcher, isInDebugMode: false);
  await Workmanager().registerPeriodicTask(const Uuid().v1(), firstBgTaskName,
      frequency: const Duration(days: 1),
      initialDelay: const Duration(days: 1));
}

@pragma('vm:entry-point')
void callBackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    switch (taskName) {
      case firstBgTaskName:
        //  firstTask();
        break;
      default:
    }
    return Future.value(true);
  });
}

// firstTask() async {
//   await Notifications.showBigTextNotification(
//     body:
//         "اوعي يغرك رخصه، وترمي نصه...تعال شوف أحسن الأمثال المصرية الشعبية الأصيلة😉",
//     title: "علي رأي المثل..",
//   );

//   print("firrrrst task");
// }
