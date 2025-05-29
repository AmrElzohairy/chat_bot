import 'package:chat_bot/core/helpers/get_current_brightness.dart';
import 'package:chat_bot/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  static const routeName = '/privacy_policy_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            getCurrentBrightness(context) ? AppColors.white : AppColors.black,
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: SingleChildScrollView(
          child: Text(
            '''
      1. Information Collection:
      We do not collect personal data. Non-personal data may be collected to improve app performance.
      
      2. Voice Input:
      We use voice input to interact with AI. Your voice is not stored or shared.
      
      3. AI Responses:
      AI responses are for fun and information only. We are not responsible for the accuracy of responses.
      
      4. Third-Party Services:
      The app may use AI or other tools from third parties. Their privacy policies apply too.
      
      5. Data Security:
      We don’t store sensitive data and aim to keep your experience secure.
      
      6. Children’s Privacy:
      This app is not for children under 13. We don’t knowingly collect data from them.
      
      7. Policy Updates:
      This placeholder policy may change. Check back here for updates.
      
      8. Contact:
      If you have questions, email us at: [hisoka@boredom.com]''' *
                2,
            style: Theme.of(context).textTheme.bodyMedium!,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
