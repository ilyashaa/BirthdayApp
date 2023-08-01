import 'package:birthday_app/model/guest_add_widget_model.dart';
import 'package:birthday_app/model/guest_home_model.dart';
import 'package:birthday_app/screens/guest_screen/new_guest_add.dart';
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
    return GuestHomeWidgetModelProvider(
        model: model, child: const _GuestHomeWidgetBody());
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
          child: Column(children: [StartWidget(), _ListGuestWidget()]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            GuestHomeWidgetModelProvider.read(context)?.model.showForm(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
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
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: guestCount,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return TestWidget(
          indexInList: index,
        );
      },
    );
  }
}

class StartWidget extends StatelessWidget {
  const StartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2 гостя',
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

class TestWidget extends StatelessWidget {
  final int indexInList;
  const TestWidget({
    super.key,
    required this.indexInList,
  });

  @override
  Widget build(BuildContext context) {
    final model = GuestHomeWidgetModelProvider.read(context)!.model;
    final guest = model.guest[indexInList];

    return Slidable(
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
      child: ListTile(
        title: Text(guest.name),
      ),
    );
  }
}
