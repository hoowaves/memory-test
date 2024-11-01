import 'env.dart';

const buildType = BuildType.dev;

Future<void> main() async {
  Env.newInstance(buildType).run();
}