import 'package:flutter/material.dart';
import 'package:guilt_app/widgets/custom_scaffold.dart';
import 'package:guilt_app/widgets/rounded_button_widget.dart';

import '../../constants/colors.dart';
import '../../models/PageModals/success_error_args.dart';
import '../../utils/routes/routes.dart';

class Privacy_Policy extends StatefulWidget {
  const Privacy_Policy({Key? key}) : super(key: key);

  @override
  State<Privacy_Policy> createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        isMenu: false,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Routes.goBack(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              //color: Colors.black,
              size: 15,
            ),
          ),
          shadowColor: Colors.transparent,
          title: Text('Privacy & Policy'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a '
                    'page when looking at its layout. The point of using Lorem Ipsum is that it '
                    'has a more-or-less normal distribution of letters, as opposed to using',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        '1.Privacy',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et emp??che de se concentrer sur la mise en '
                      'page elle-m??me. Lavantage du Lorem Ipsum sur un texte g??n??rique comme Du texte. Du texte. Du texte.est quil poss??de une distribution de lettres plus ou '
                      'moins normale, et en tout cas comparable avec celle du fran??ais standard. De nombreuses suites logicielles de mise en page ou ??diteurs de sites Web ont'
                      ' faitencore qu?? leur phase deconstruction. Plusieurs versions sont apparueavec le temps, parfois par accident, souvent',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        '2.Policy',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Plusieurs variations de Lorem Ipsum peuvent ??tre trouv??es ici ou l??, mais la majeure partieentre elles a ??t?? alt??r??e par laddition dhumour ou de mots al??atoires qui ne '
                    'ressemblent pas unseconde ?? du texte standard. Si vous voulez utiliser un passage du Lorem Ipsum, vous devez ??tre s??r quil ny a rien'
                    'dembarrassant cach?? dans le texte. Tous les g??n??rateurs de Lorem Ipsum sur Internet tendent ?? reproduire le m??me extrait sans fince qui fait ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        '3.Information collection',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et emp??che de se concentrer sur la mise en '
                    'page elle-m??me. Lavantage du Lorem Ipsum sur un texte g??n??rique comme Du texte. Du texte. Du texte.est quil poss??de une distribution de lettres plus ou '
                    'moins normale, et en tout cas comparable avec celle du fran??ais standard. De nombreuses suites logicielles de mise en page ou ??diteurs de sites Web ont'
                    ' faitencore qu?? leur phase deconstruction. Plusieurs versions sont apparueavec '
                    'le temps, parfois par accident, souvent',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_right_outlined,
                          color: Colors.orangeAccent),
                      SizedBox(width: 5),
                      Text('Plusieurs variations de Lorem Ipsum',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_right_outlined,
                          color: Colors.orangeAccent),
                      SizedBox(width: 5),
                      Text('ots al??atoires qui ne ressemblent pas',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_right_outlined,
                          color: Colors.orangeAccent),
                      SizedBox(width: 5),
                      Text('ul vrai g??n??rateur de Lorem Ipsum. Iil ut',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_right_outlined,
                          color: Colors.orangeAccent),
                      SizedBox(width: 5),
                      Text('ncontestable du Lorem Ipsum. Il provient',
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'age elle-m??me. Lavantage du Lorem Ipsum sur un texte g??n??rique comme Du texte. Du texte.'
                    ' Du texte.est quil poss??de une distribution de lettres plus ou '
                    'moins normale, et en tout cas comparable avec celle du fran??ais standard',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: ElevatedButtonWidget(
                      buttonText: 'Accept',
                      buttonColor: AppColors.primaryColor,
                      onPressed: () {
                        Routes.navigateToScreen(
                            context, Routes.terms_conditions);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
