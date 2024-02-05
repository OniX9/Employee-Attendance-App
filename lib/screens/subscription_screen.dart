import 'package:employee_attendance/constants.dart';
import 'package:employee_attendance/widgets/custom_card.dart';
import 'package:employee_attendance/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueScaffoldColor,
      appBar: MyAppBar(context, label: 'Subscriptions'),
      body: Column(
        children: [
          CurrentPageStatusBar(
            currentPage: currentPage,
          ),
          Expanded(
            child: PageView(
              onPageChanged: (int newPage) {
                setState(() => currentPage = newPage);
                // print(currentPage);
              },
              children: [
                PricesListViewContainer(
                  durationID: PricingDuration.monthly,
                  basicPrice: '20,000',
                  premiumPrice: '40,000',
                ),
                PricesListViewContainer(
                  durationID: PricingDuration.quarterly,
                  basicPrice: '60,000',
                  premiumPrice: '150,000',
                ),
                PricesListViewContainer(
                  durationID: PricingDuration.semiAnnual,
                  basicPrice: '100,000',
                  premiumPrice: '240,000',
                ),
                PricesListViewContainer(
                  durationID: PricingDuration.yearly,
                  basicPrice: '180,000',
                  premiumPrice: '450,000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PricesListViewContainer extends StatelessWidget {
  final PricingDuration durationID;
  final String basicPrice;
  final String premiumPrice;

  const PricesListViewContainer({
    required this.durationID,
    required this.basicPrice,
    required this.premiumPrice,
    super.key,
  });

  getPricePerTimeDescription() {}
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          BasicPlanContainer(
            basicPrice: basicPrice,
            durationID: durationID,
          ),
          PremiumPlanContainer(
            premiumPrice: premiumPrice,
            durationID: durationID,
          ),
        ],
      ),
    );
  }
}

// **CUSTOM WIDGET**
// 1.
class BasicPlanContainer extends StatelessWidget {
  final String basicPrice;
  final PricingDuration durationID;

  const BasicPlanContainer({
    required this.basicPrice,
    required this.durationID,
    super.key,
  });

  Padding _buildFeaturesText(text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 13, color: Colors.green),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.all(15),
      height: 430,
      width: double.maxFinite,
      borderRadius: BorderRadius.circular(25),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BASIC',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Basic functionality',
                style: kCardDescriptionTextStyle.copyWith(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          PricePerTImeText(
            price: basicPrice,
            durationID: durationID,
            priceColor: Colors.grey[800],
            currencyDurationColor: Colors.grey,
          ),
          Expanded(child: SizedBox()),
          Container(
            // Divider
            width: double.maxFinite,
            height: 2,
            color: Colors.grey[300],
          ),
          Expanded(child: SizedBox()),
          _buildFeaturesText('Create 2 company branches'),
          _buildFeaturesText('Live track employees location'),
          _buildFeaturesText('Attendance management'),
          _buildFeaturesText('Salary calculation'),
          _buildFeaturesText('Add holidays'),
          _buildFeaturesText('Present employees list'),
          PaymentActionButton(
            child: Text(
              'GET STARTED',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// 2.
class PremiumPlanContainer extends StatelessWidget {
  final String premiumPrice;
  final PricingDuration durationID;

  const PremiumPlanContainer({
    required this.premiumPrice,
    required this.durationID,
    super.key,
  });

  Padding _buildFeaturesText(text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 13, color: Colors.green),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[300],
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.all(15),
      height: 430,
      width: double.maxFinite,
      borderRadius: BorderRadius.circular(25),
      color: kPrimaryColorHeavy,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Premium',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'More advanced Employee Management',
                style: kCardDescriptionTextStyle.copyWith(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          PricePerTImeText(
            price: premiumPrice,
            priceColor: Colors.grey[200],
            durationID: durationID,
            currencyDurationColor: Colors.grey[300],
          ),
          Expanded(child: SizedBox()),
          Container(
            // Divider
            width: double.maxFinite,
            height: 2,
            color: Colors.grey[400],
          ),
          Expanded(child: SizedBox()),
          _buildFeaturesText('Create 4 company branches'),
          _buildFeaturesText('Leave management'),
          _buildFeaturesText('Live track employees location'),
          _buildFeaturesText('Attendance management'),
          _buildFeaturesText('Salary calculation'),
          _buildFeaturesText('Add holidays'),
          _buildFeaturesText('Present employees list'),
          PaymentActionButton(
            child: Text(
              'GET STARTED',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentActionButton extends StatelessWidget {
  final Widget? child;

  const PaymentActionButton({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class PricePerTImeText extends StatelessWidget {
  final String price;
  final Color? priceColor;
  final Color? currencyDurationColor;
  final PricingDuration durationID;

  const PricePerTImeText({
    this.priceColor,
    this.currencyDurationColor,
    required this.price,
    required this.durationID,
    super.key,
  });

  String _getDurationText(){
    switch (durationID) {
      case PricingDuration.monthly:
        return 'mo';
      case PricingDuration.quarterly:
        return 'quarter';
      case PricingDuration.semiAnnual:
        return '6 mo';
      case PricingDuration.yearly:
        return 'yr';
      default:
        return 'mo';
    }
  }
  String _getDescriptionText(){
    switch (durationID) {
      case PricingDuration.monthly:
        return 'Per month, only admin pay';
      case PricingDuration.quarterly:
        return 'Every 3 months, only admin pay';
      case PricingDuration.semiAnnual:
        return 'Every 6 months, only admin pay';
      case PricingDuration.yearly:
        return 'Per year, only admin pay';
      default:
        return 'Per month, only admin pay';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: price,
            style: TextStyle(
              fontSize: 50,
              color: priceColor,
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: r' NGN',
                style: TextStyle(
                  fontSize: 20,
                  color: currencyDurationColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: ' / ${_getDurationText()}',
                style: TextStyle(
                  fontSize: 20,
                  color: currencyDurationColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            _getDescriptionText(),
            style: kCardDescriptionTextStyle.copyWith(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// 3.
// A status bar showing current page if is monthly, quarterly, half annual and yearly page.
class CurrentPageStatusBar extends StatelessWidget {
  final int currentPage;
  const CurrentPageStatusBar({
    required this.currentPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PageStatusBarItem(0, currentPage: currentPage, label: 'Monthly'),
          SizedBox(width: 10),
          PageStatusBarItem(1, currentPage: currentPage, label: 'Quarterly'),
          SizedBox(width: 10),
          PageStatusBarItem(2, currentPage: currentPage, label: 'Semi annual'),
          SizedBox(width: 10),
          PageStatusBarItem(
            3,
            currentPage: currentPage,
            label: 'Yearly',
          ),
        ],
      ),
    );
  }
}

class PageStatusBarItem extends StatelessWidget {
  final int id;
  final String label;
  final int currentPage;

  const PageStatusBarItem(
    this.id, {
    required this.label,
    required this.currentPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isCurrent() {
      return id == currentPage;
    }

    return Expanded(
      child: CustomCard(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 35,
        borderRadius: BorderRadius.circular(5),
        child: Text(
          label,
          style: kCardDescriptionTextStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: isCurrent() ? kPrimaryColorLight : null,
          ),
        ),
      ),
    );
  }
}

// 4.
enum PricingDuration {
  monthly,
  quarterly,
  semiAnnual,
  yearly,
}
