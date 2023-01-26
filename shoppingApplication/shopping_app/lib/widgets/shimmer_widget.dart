import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';

class ListOfProductShimmerWidget extends StatelessWidget {
  const ListOfProductShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: AppDimensions.height200,
                width: AppDimensions.height150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyShadow,
                    )),
                padding: EdgeInsets.only(
                    top: AppDimensions.height15,
                    left: AppDimensions.height30,
                    right: AppDimensions.height30),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.height100,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              width: AppDimensions.width30,
            ),
            Container(
                height: AppDimensions.height200,
                width: AppDimensions.height150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyShadow,
                    )),
                padding: EdgeInsets.only(
                    top: AppDimensions.height15,
                    left: AppDimensions.height30,
                    right: AppDimensions.height30),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.height100,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
        SizedBox(
          height: AppDimensions.height45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: AppDimensions.height200,
                width: AppDimensions.height150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyShadow,
                    )),
                padding: EdgeInsets.only(
                    top: AppDimensions.height15,
                    left: AppDimensions.height30,
                    right: AppDimensions.height30),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.height100,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              width: AppDimensions.width30,
            ),
            Container(
                height: AppDimensions.height200,
                width: AppDimensions.height150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyShadow,
                    )),
                padding: EdgeInsets.only(
                    top: AppDimensions.height15,
                    left: AppDimensions.height30,
                    right: AppDimensions.height30),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.height100,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
        SizedBox(
          height: AppDimensions.height45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: AppDimensions.height200,
                width: AppDimensions.height150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyShadow,
                    )),
                padding: EdgeInsets.only(
                    top: AppDimensions.height15,
                    left: AppDimensions.height30,
                    right: AppDimensions.height30),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.height100,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(
              width: AppDimensions.width30,
            ),
            Container(
                height: AppDimensions.height200,
                width: AppDimensions.height150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radius20),
                    border: Border.all(
                      width: 1,
                      color: AppColors.greyShadow,
                    )),
                padding: EdgeInsets.only(
                    top: AppDimensions.height15,
                    left: AppDimensions.height30,
                    right: AppDimensions.height30),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppDimensions.height100,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppDimensions.height10,
                    ),
                    SizedBox(
                      height: AppDimensions.height15,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 211, 211, 211),
                        highlightColor:
                            const Color.fromARGB(255, 233, 233, 233),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radius20),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
