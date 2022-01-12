import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../ui/widgets/info_page.dart';
import '../../../core/constants/view/view_constants.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  static const routeName = '/welcome';
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final pages = [
      infoPage(
        context,
        header: 'Bir kere kaydet, her yerde kullan',
        content: 'Kaydettiğin formu Vonop kullanan her yerde sadece bir tıkla kullanabilirsin',
        svgPath: 'assets/save.svg',
      ),
      infoPage(
        context,
        header: 'Yüksek güvenlikli parolalar',
        content:
            'Sürekli farklı parolaları aklında tutmaktan yorulduysan bunun içinde bir çözümümüz var. Vonop ile tek tıkla yüksek güvenlikli parolalar oluşturup, tek tıkla giriş yapabilirsin.',
        svgPath: 'assets/security.svg',
      ),
      infoPage(
        context,
        header: 'Sahte Geçici Formlar',
        content:
            'Bir yere kaydolurken kişisel bilgilerini vermek istemiyorsan veya geçici bir forma ihtihacın varsa yine tek bir tıkla geçici formlar oluşturabilirsin.',
        svgPath: 'assets/fake_form.svg',
      ),
      infoPage(
        context,
        header: 'Tek tıkla giriş yap veya kayıt ol',
        content:
            'Bir yere giriş veya kayıt yaparken sana göndereceğimiz bildirime tıklayarak yada QR Kodunu okutarak saniyeler içinde işlemini bitir',
        svgPath: 'assets/notification.svg',
        last: true,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Vonop',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: PageView(
                  controller: _controller,
                  children: pages,
                ),
              ),
              Expanded(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: pages.length,
                  effect: const WormEffect(activeDotColor: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
