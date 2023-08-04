import 'package:birthday_app/bloc/guest_bloc.dart';

import 'package:birthday_app/model/guest_home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GuestHome extends StatefulWidget {
  const GuestHome({super.key});

  @override
  State<GuestHome> createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  final model = GuestHomeWidgetModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestBloc, GuestState>(
      builder: (context, state) {
        return GuestHomeWidgetModelProvider(
            model: model, child: const _GuestHomeWidgetBody());
      },
    );
  }
}

class _GuestHomeWidgetBody extends StatelessWidget {
  const _GuestHomeWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Color.fromARGB(255, 223, 206, 206),
        elevation: 8,
        title: Text(
          'Список гостей',
          style: TextStyle(
              fontFamily: 'Jost',
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              height: 20.h / 20.sp,
              color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [CountAndFilBarWidget(), _ListGuestWidget()]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GuestHomeWidgetModelProvider.read(context)?.model.showForm(context),
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ListGuestWidget extends StatelessWidget {
  const _ListGuestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final guestCount =
        GuestHomeWidgetModelProvider.watch(context)?.model.guest.length ?? 0;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: guestCount,
      itemBuilder: (context, index) {
        return GuestWidget(
          indexInList: index,
        );
      },
    );
  }
}

class CountAndFilBarWidget extends StatelessWidget {
  const CountAndFilBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final guestCount =
        GuestHomeWidgetModelProvider.watch(context)?.model.guest.length;
    var formCount = '';

    if (guestCount == 0 || guestCount! >= 5) {
      formCount = 'гостей';
    } else if (guestCount == 1) {
      formCount = 'гость';
    } else {
      formCount = 'гостя';
    }
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$guestCount $formCount',
            style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 20.23.h / 14.sp,
                color: Color.fromRGBO(78, 67, 67, 1)),
          ),
          Text(
            'По имени   ▼',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 20.23.h / 14.sp,
                color: Color.fromRGBO(78, 67, 67, 1)),
          )
        ],
      ),
    );
  }
}

class GuestWidget extends StatelessWidget {
  final int indexInList;
  const GuestWidget({
    super.key,
    required this.indexInList,
  });

  void _deleteGuestAll(context) {
    GuestHomeWidgetModelProvider.read(context)!.model.deleteGuest(indexInList);
  }

  @override
  Widget build(BuildContext context) {
    final model = GuestHomeWidgetModelProvider.read(context)!.model;
    final guest = model.guest[indexInList];

    return GestureDetector(
      onDoubleTap: () =>
          GuestHomeWidgetModelProvider.read(context)?.model.showForm(context),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => model.deleteGuest(indexInList),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Image.asset('assets/avatarImage/avatar.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guest.name + guest.surname,
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      height: 20.23.h / 14.sp),
                ),
                Text(
                  guest.data + ' лет',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      height: 12.h / 12.sp),
                ),
                Text(
                  guest.profession,
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      height: 20.23.h / 14.sp),
                ),
                Divider(
                  height: 16.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
