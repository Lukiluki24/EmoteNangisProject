import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/destination_card.dart';
import '../widgets/service_category_cart.dart';
import '../models/destination.dart';
import '../utils/constants.dart';
import 'all_pictures_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Destination> destinations = [
    Destination(
      id: '1',
      name: 'Jakarta - Tokyo',
      route: 'Jakarta - Tokyo',
      imagePath: 'assets/images/jakarta_tokyo.jpg',
      price: 'Rp 10.000.000',
      date: '13 Februari 2025',
      duration: '7h 30m',
      rating: 4.5,
      airline: 'Garuda Indonesia',
    ),
    Destination(
      id: '2',
      name: 'Jakarta - Bangkok',
      route: 'Jakarta - Bangkok',
      imagePath: 'assets/images/jakarta_bangkok.jpg',
      price: 'Rp 3.500.000',
      date: '15 Februari 2025',
      duration: '3h 45m',
      rating: 4.2,
      airline: 'Thai Airways',
    ),
    Destination(
      id: '3',
      name: 'Jakarta - Singapore',
      route: 'Jakarta - Singapore',
      imagePath: 'assets/images/jakarta_singapore.jpg',
      price: 'Rp 2.800.000',
      date: '18 Februari 2025',
      duration: '1h 45m',
      rating: 4.7,
      airline: 'Singapore Airlines',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with search and notification
              _buildHeader(),

              // Promo banner
              _buildPromoBanner(),

              // Service categories
              _buildServiceCategories(),

              // Vacation section
              _buildVacationSection(),

              // Bottom padding
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '12:34',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.signal_cellular_alt,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.wifi, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              const Icon(Icons.battery_full, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.textSecondary),
                      SizedBox(width: 8),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(AppConstants.defaultPadding),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promo pengguna baru',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Potongan 50% untuk pembelian pertama',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(Icons.local_offer, color: Colors.white, size: 32),
        ],
      ),
    );
  }

  Widget _buildServiceCategories() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ServiceCategoryCard(
            icon: Icons.flight,
            title: 'Tiket\nPesawat',
            color: const Color(0xFF3498DB),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartScreen(), // buka halaman yg bisa nambah ke cart
                ),
              );
            },
          ),
          ServiceCategoryCard(
            icon: Icons.hotel,
            title: 'Hotel',
            color: const Color(0xFF2ECC71),
            onTap: () {},
          ),
          ServiceCategoryCard(
            icon: Icons.train,
            title: 'Tiket\nKereta Api',
            color: const Color(0xFFE67E22),
            onTap: () {},
          ),
          ServiceCategoryCard(
            icon: Icons.directions_bus,
            title: 'Tiket Bus',
            color: const Color(0xFF9B59B6),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildVacationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildVacationTab('Liburan SERUUUU!!!', true),
              _buildVacationTab('Hotel', false),
              _buildVacationTab('Pesawat', false),
            ],
          ),
        ),
        Container(
          color: AppColors.background,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lihat Pesawat lainnya',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllPicturesScreen(destinations: destinations),
                        ),
                      );
                    },
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    return DestinationCard(
                      destination: destinations[index],
                      onTap: () {
                        // Handle destination tap
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVacationTab(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
