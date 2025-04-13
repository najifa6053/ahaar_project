import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/round_icon_button.dart';
import 'package:ahaar_project/view/more/add_card_view.dart';

import '../../common_widget/round_button.dart';
import 'my_order_view.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  List<Map<String, dynamic>> cardArr = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPaymentMethods();
  }

  // Fetch payment methods from Firebase Firestore
  Future<void> fetchPaymentMethods() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please log in to view payment methods.")),
        );
        return;
      }

      final snapshot = await FirebaseFirestore.instance
          .collection('payment_methods')
          .where('userId', isEqualTo: user.uid)
          .get();

      setState(() {
        cardArr = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to fetch payment methods: $e")),
      );
    }
  }

  // Delete a payment method from Firebase Firestore
  Future<void> deletePaymentMethod(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('payment_methods')
          .doc(docId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Card deleted successfully!")),
      );

      // Refresh the list
      fetchPaymentMethods();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete card: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        "assets/img/btn_back.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Payment Details",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyOrderView(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Text(
                  "Customize your payment method",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: TColor.secondaryText.withOpacity(0.4),
                  height: 1,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: TColor.textfield,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 9),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cash/Card On Delivery",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Image.asset(
                            "assets/img/check.png",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Divider(
                        color: TColor.secondaryText.withOpacity(0.4),
                        height: 1,
                      ),
                    ),
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: cardArr.length,
                            itemBuilder: ((context, index) {
                              var cObj = cardArr[index];
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 35,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      cObj["icon"] ?? "assets/img/visa_icon.png",
                                      width: 50,
                                      height: 35,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Text(
                                        cObj["card"] ?? "",
                                        style: TextStyle(
                                          color: TColor.secondaryText,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      height: 28,
                                      child: RoundButton(
                                        title: 'Delete Card',
                                        fontSize: 12,
                                        onPressed: () {
                                          deletePaymentMethod(cObj["docId"]);
                                        },
                                        type: RoundButtonType.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Divider(
                        color: TColor.secondaryText.withOpacity(0.4),
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Other Methods",
                            style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundIconButton(
                  title: "Add Another Credit/Debit Card",
                  icon: "assets/img/add.png",
                  color: TColor.primary,
                  fontSize: 16,
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return const AddCardView();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}