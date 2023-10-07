import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shreeji_delivery_app_bloc/cubits/delivery_details/delivery_details_cubit.dart';
import 'package:shreeji_delivery_app_bloc/screens/order/empty_order_screen.dart';
import 'package:shreeji_delivery_app_bloc/theme/colors.dart';
import 'package:shreeji_delivery_app_bloc/utils/utility.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_button_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_text_widget.dart';
import 'package:shreeji_delivery_app_bloc/widgets/custom_textfield.dart';
import 'package:shreeji_delivery_app_bloc/widgets/hind_madurai_text.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deliveryDetailsCubit = BlocProvider.of<DeliveryDetailsCubit>(context);
    return Scaffold(
      appBar: appbar('Delivery Details', context),
      body: SingleChildScrollView(
        child: BlocBuilder<DeliveryDetailsCubit, DeliveryDetailsState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 15.h, bottom: 15.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 22.h),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 10,
                    )
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Amount to be Collected',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor),
                      Text('₹ 4500',
                          style: GoogleFonts.hindMadurai(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: textColor))
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                  padding: EdgeInsets.all(15.h),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: CustomText(
                            text: 'Amount Collection Mode',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                      state is SelectPaymentModeState ?
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (state.selectedPaymentMode == 1) {
                                  // deliveryDetailsCubit.changePaymentMethod(0);
                                  context
                                      .read<DeliveryDetailsCubit>()
                                      .changePaymentMethod(0);
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.scale(
                                    scale: 1.2.h,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 7.w),
                                      padding: EdgeInsets.zero,
                                      height: 25.h,
                                      width: 25.h,
                                      child: Radio(
                                        activeColor: primaryColor,
                                        value: 0,
                                        groupValue: state.selectedPaymentMode,
                                        onChanged: (value) {
                                          context
                                              .read<DeliveryDetailsCubit>()
                                              .changePaymentMethod(value!);
                                          // deliveryDetailsCubit.changePaymentMethod(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                  HindMaduraiText(
                                      text: 'QR Code',
                                      fontSize: 15.sp,
                                      color: textColor,
                                      fontWeight: FontWeight.w500)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (state.selectedPaymentMode == 0) {
                                  context
                                      .read<DeliveryDetailsCubit>()
                                      .changePaymentMethod(1);
                                  // deliveryDetailsCubit.changePaymentMethod(1);
                                }
                              },
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.2.h,
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      margin: EdgeInsets.only(
                                          right: 15.w, left: 60.w),
                                      height: 25.h,
                                      width: 25.h,
                                      child: Radio(
                                        activeColor: primaryColor,
                                        value: 1,
                                        groupValue: state.selectedPaymentMode,
                                        onChanged: (value) {
                                          context
                                              .read<DeliveryDetailsCubit>()
                                              .changePaymentMethod(1);
                                          // deliveryDetailsCubit.changePaymentMethod(value!);
                                        },
                                      ),
                                    ),
                                  ),
                                  HindMaduraiText(
                                      text: 'Cash',
                                      fontSize: 15.sp,
                                      color: textColor,
                                      fontWeight: FontWeight.w500)
                                ],
                              ),
                            ),
                          ]) : const Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
                Container(
                  width: getWidth(context),
                  margin:
                      EdgeInsets.only(bottom: 15.h, left: 20.w, right: 20.w),
                  padding: EdgeInsets.only(top: 33.h, bottom: 33.h),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 28.h),
                        height: 200.h,
                        width: 200.h,
                        child: SvgPicture.asset('assets/images/barcode.svg'),
                      ),
                      CustomText(
                          text: 'Scan the above QR code for payment',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: textColor)
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 15.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  padding: EdgeInsets.all(14.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                              text: 'Upload Payment Document',
                              fontSize: 15.sp,
                              color: textColor,
                              fontWeight: FontWeight.w500),
                          deliveryDetailsCubit.list.isNotEmpty
                              ? InkWell(
                                  onTap: () {
                                    showUploadImageDialog(
                                        context,
                                        deliveryDetailsCubit.pickImage,
                                        deliveryDetailsCubit.takeImage);
                                  },
                                  child: CircleAvatar(
                                    radius: 14.r,
                                    backgroundColor:
                                        secondaryColor.withOpacity(0.2),
                                    child: Icon(Icons.add,
                                        color: secondaryColor, size: 18.h),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                        child: Divider(
                            color: textColor.withOpacity(0.2), height: 1.h),
                      ),
                      state is ListAddItemState && state.imageList.isNotEmpty || state is RemoveListItemState && state.removeItemList.isNotEmpty ?
                      SizedBox(
                    // color: Colors.amber,
                    height: 50.h,
                    // width: getWidth(context),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: state is ListAddItemState? state.imageList.length : state is RemoveListItemState ? state.removeItemList.length : 0,
                      itemBuilder: (ctx,index){
                      return Stack(
                        fit: StackFit.loose,
                        clipBehavior: Clip.none,
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor)
                          ),
                          margin: EdgeInsets.only(right: 7.w),
                          padding: EdgeInsets.all(2.h),
                          width: 40.w,height: 50.h,
                          child: state is ListAddItemState?
                          Image.file(File(state.imageList[index]),fit: BoxFit.fill) 
                          : state is RemoveListItemState ? Image.file(File(state.removeItemList[index]),fit: BoxFit.fill)
                          :  Container(height: 10,width: 10,color: Colors.amberAccent),
                        ),
                        Positioned(
                          right: 0.h,
                          bottom: 38.h,
                          child: InkWell(
                            onTap: (){
                              context.read<DeliveryDetailsCubit>().removeItemsFrOmList(index);
                            },
                            child: CircleAvatar(
                              radius: 9.r,
                              backgroundColor: whiteColor,
                              child: CircleAvatar(
                                radius: 8.r,
                                backgroundColor: const Color(0xff8d2626),
                                child: Center(child: Icon(Icons.close,size: 14.h,color: whiteColor)),
                              ),
                            ),
                          ),
                        )
                        ],
                      );
                    }),
                  )
                  : deliveryDetailsCubit.list.isEmpty ?
                      InkWell(
                          onTap: () {
                            showUploadImageDialog(
                                context,
                                deliveryDetailsCubit.pickImage,
                                deliveryDetailsCubit.takeImage);
                          },
                          child: DottedBorder(
                              color: secondaryColor,
                              dashPattern: const [7, 4],
                              strokeWidth: 1.w,
                              borderType: BorderType.RRect,
                              child: Container(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                width: getWidth(context),
                                color: const Color(0xfff4f3f6),
                                child: SvgPicture.asset(
                                  'assets/icons/upload_icon.svg',
                                  height: 25.h,
                                  width: 25.h,
                                ),
                              ))) : const SizedBox()
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                  decoration: BoxDecoration(color: whiteColor, boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 20,
                    )
                  ]),
                  padding: EdgeInsets.all(14.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Remarks',
                          fontSize: 14.sp,
                          color: textColor,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                        child: Divider(
                            color: textColor.withOpacity(0.2), height: 1.h),
                      ),
                      const CustomTextfield(
                        hintText: 'Type your remarks here...',
                        maxLines: 4,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.w, right: 30.w, top: 35.h, bottom: 40.h),
                  child: CustomAuthButtonWidget(
                      onTap: () {
                        Navigator.of(context).push(customPageRouteBuilder(const EmptyOrderScreen()));
                        // Navigator.of(co
                        // ntext).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const CustomText(
                                text: 'Payment done successfully',
                                color: whiteColor),
                            backgroundColor: secondaryColor.withOpacity(0.8)));
                        // Get.showSnackbar(GetSnackBar(message: 'Payment done successfully',isDismissible: true,));
                      },
                      buttonName: 'Submit'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
