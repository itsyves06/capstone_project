import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_font.dart';

class PendingRequest {
  final String docName;
  final DateTime dateCreated;

  PendingRequest({
    required this.docName,
    required this.dateCreated,
  });
}

class PendingScreen extends StatefulWidget {
  final List<PendingRequest> requestList;

  const PendingScreen({
    super.key,
    required this.requestList,
  });

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          Container(
            height: 70.h,
            width: double.infinity,
            color: const Color(0xFF5D7E97),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  CustomFont(
                    text: "Pending",
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10.h),

                  Expanded(
                    child: widget.requestList.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                            itemCount: widget.requestList.length,
                            itemBuilder: (context, index) {
                              final item = widget.requestList[index];
                              return _buildCard(item.docName, item.dateCreated);
                            },
                          )
                        : _buildEmptyState(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_edu, size: 80.r, color: Colors.grey.shade300),
          SizedBox(height: 16.h),
          CustomFont(
            text: "No pending requests found.",
            fontSize: 16.sp,
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, DateTime dt) {
    String dateStr = DateFormat('MMMM d, y').format(dt);
    String timeStr = DateFormat('h:mm a').format(dt);

    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFont(
            text: name,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 6.h),
          CustomFont(text: dateStr, fontSize: 13.sp, color: Colors.black54),
          CustomFont(text: timeStr, fontSize: 13.sp, color: Colors.black54),
          SizedBox(height: 15.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3F5),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.circle, size: 10.r, color: Colors.amber),
                SizedBox(width: 8.w),
                CustomFont(
                  text: "Pending",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


