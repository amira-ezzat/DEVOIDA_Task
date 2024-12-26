import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/componant/appBar.dart';
import '../../../core/componant/custom_text.dart';
import '../../../core/utils/colors.dart';
import '../../modelView/UserViewModel.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    final user = userViewModel.user;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomApp(
        backgroundColor: AppColor.kIndicator
    ),
      body: user == null
          ? const Center(child: Text('No user logged in.'))
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 230,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColor.kIndicator,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(55),
                        bottomRight: Radius.circular(55),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: width / 6,
                              backgroundImage: const AssetImage('assets/images/doc.jpeg'),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey, width: 0.8),
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                          text: '${user.displayName ?? 'No Name'}',
                          fontSize: width / 20,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text:  ' ${user.email}',
                          fontSize: width / 26,
                          colorText: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

            ],
          ),
    );
  }
}
