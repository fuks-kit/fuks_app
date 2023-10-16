import 'package:fuks_app/generated/app_services/services.pbgrpc.dart';
import 'package:grpc/grpc.dart';

final _channel = ClientChannel(
  'app-services-befklaxdqa-ey.a.run.app',
  port: 443,
  options: const ChannelOptions(
    credentials: ChannelCredentials.secure(),
  ),
);

final fuksCloud = AppServicesClient(_channel);
