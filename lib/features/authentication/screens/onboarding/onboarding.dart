
import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/authentication/controllers/onboarding.dart';
import 'package:trash_to_cash_flutter/utils/constants/image_paths.dart';
import 'package:trash_to_cash_flutter/utils/constants/text_constants.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  static final controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          PageView(
            controller: controller.pageController,
            onPageChanged: (index)=>{
              controller.pageChange(index)
            },
            children: const [
              Column(
                children: [
                  Image(image: AssetImage(ImagePaths.onboarding1)),
                  SizedBox(height: 50,),
                  Text(TextConstants.onboardingHeading1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ),)
                ],
              ),
              Column(
                children: [
                  Image(image: AssetImage(ImagePaths.onboarding2)),
                  SizedBox(height: 50,),
                  Text(TextConstants.onboardingHeading2,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ))
                ],
              ),
              Column(
                children: [
                  Image(image: AssetImage(ImagePaths.onboarding3)),
                  SizedBox(height: 50,),
                  Text(TextConstants.onboardingHeading3,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ))
                ],
              ),

            ],

          ),
          const TextButton(onPressed: null, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey, )), child: Text('Skip', style: TextStyle(color: Colors.black),),),
          Positioned(
                  bottom: 15,
                  right: 20,
                  child:
                    TextButton(onPressed:()=>controller.incrementPage(context), style:
                    const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue, )),
                      child: const Text('Next', style: TextStyle(color: Colors.white),),),
          )
        ],
      ),
    );
  }
}
