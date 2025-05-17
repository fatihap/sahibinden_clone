import 'package:flutter/material.dart';

class SahibindenAnasayfa extends StatefulWidget {
  const SahibindenAnasayfa({super.key});

  @override
  State<SahibindenAnasayfa> createState() => _SahibindenAnasayfaState();
}

class _SahibindenAnasayfaState extends State<SahibindenAnasayfa> {
  final List<CategoryItem> categories = [
    CategoryItem(
      'Emlak',
      Icons.home,
      Colors.amber,
      'Konut, İş Yeri, Arsa, Konut Projeleri, Bina, DevreMülk',
    ),
    CategoryItem(
      'Vasıta',
      Icons.directions_car,
      Colors.red,
      'Otomobil, Arazi, SUV & Pickup , Elektrikli Araçlar',
    ),
    CategoryItem(
      'Yedek Parça, Aksesuar, Donanım',
      Icons.build,
      Colors.blueAccent,
      'Otomotiv Ekipmanları, Motosiklet Ekipmanları',
    ),
    CategoryItem(
      'İkinci El ve Sıfır Alışveriş',
      Icons.shopping_cart,
      Colors.deepPurple,
      'Bilgisayar, Telefon...',
    ),
    CategoryItem(
      'Yepy',
      Icons.recycling,
      Colors.black,
      'Yenilenmiş Teknolojik Cihazlar',
    ),
    CategoryItem(
      'İş Makineleri & Sanayi',
      Icons.agriculture,
      Colors.purple,
      'İş Makineleri, Tarım Makineleri, Sanayi , Elektrik',
    ),
    CategoryItem(
      'Ustalar ve Hizmetler',
      Icons.handyman,
      Colors.blue,
      'Ev Tadilat & Dekorasyon, Nakliye Araç Servis...',
    ),
    CategoryItem(
      'Özel Ders Verenler',
      Icons.note,
      Colors.greenAccent,
      'Lise & Üniversite, İlkokul & Ortaokul, Yabanci Diller...',
    ),
    CategoryItem(
      'İş İlanları',
      Icons.work,
      Colors.green,
      'Avukatlık & Hukuki Danışmanlık , Eğitim , Eğlence...',
    ),
    CategoryItem(
      'Hayvanlar Alemi',
      Icons.pets,
      Colors.amber,
      'Evcil Hayvanlar, Akvaryum Balıkları, Aksesuar...',
    ),
    CategoryItem(
      'Yardımcı Arayanlar',
      Icons.child_care,
      Colors.amber,
      'Bebek & Çocuk Bakıcı, Yaşlı & Hasta Bakımı...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        backgroundColor: const Color.fromARGB(255, 24, 103, 168),
        title: const Text('sahibinden.com'),
        actions: [
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
          IconButton(icon: const Icon(Icons.camera_alt), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Arama Çubuğu
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Kelime veya İlan No. İle Ara',
                prefixIcon: const Icon(Icons.search),

                suffixIcon: const Icon(Icons.qr_code_scanner),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
          ),
          // Kategori Listesi
          Expanded(
            child: ListView.separated(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 0,
                  ),
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  leading: CircleAvatar(
                    backgroundColor: category.iconColor,
                    child: Icon(category.icon, color: Colors.white),
                  ),
                  title: Text(
                    category.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  subtitle: Text(category.subtitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Kategoriye tıklanınca yapılacak işlem
                  },
                );
              },
              separatorBuilder:
                  (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 12,
                    endIndent: 12,
                  ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Yeni ilan ekle işlemi
        },
        backgroundColor: const Color.fromARGB(255, 24, 103, 168), // Mavi zemin
        foregroundColor: Colors.white, // İkon rengi (beyaz)
        elevation: 6, // Gölgelendirme (isteğe bağlı)
        shape: const CircleBorder(), // Daire formu garanti
        child: const Icon(Icons.add_rounded, size: 30),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String subtitle;

  CategoryItem(this.title, this.icon, this.iconColor, this.subtitle);
}
