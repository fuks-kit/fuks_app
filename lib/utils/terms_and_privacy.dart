import 'package:url_launcher/url_launcher_string.dart';

const termsOfUseUrl = 'https://fuks-app.web.app/terms_and_conditions.txt';
const privacyPolicyUrl = 'https://fuks-app.web.app/privacy_policy.txt';

void showTermsAndConditions() {
  launchUrlString(termsOfUseUrl);
}

void showPrivacyPolicy() {
  launchUrlString(privacyPolicyUrl);
}
