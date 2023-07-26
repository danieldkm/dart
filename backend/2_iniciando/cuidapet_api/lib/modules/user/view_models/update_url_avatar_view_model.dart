// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../application/helpers/request_mapping.dart';

class UpdateUrlAvatarViewModel extends RequestMapping {
  int userId;
  late String urlAvatar;

  UpdateUrlAvatarViewModel({
    required this.userId,
    required super.dataRequest,
  });

  @override
  void map() {
    urlAvatar = data['url_avatar'];
  }
}
