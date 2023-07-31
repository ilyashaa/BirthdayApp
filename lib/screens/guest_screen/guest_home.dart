import 'package:birthday_app/screens/guest_screen/new_guest_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GuestHome extends StatelessWidget {
  const GuestHome({super.key});

  void _showForm(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => NewGuest(),
    );
  }

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
          child: Column(children: [StartWidget(), ListGuestWidget()]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ListGuestWidget extends StatefulWidget {
  const ListGuestWidget({
    super.key,
  });

  @override
  State<ListGuestWidget> createState() => _ListGuestWidgetState();
}

class _ListGuestWidgetState extends State<ListGuestWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return TestWidget();
      },
      itemBuilder: (BuildContext context, int index) {
        return Divider(
          height: 10,
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
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: ListTile(
        title: Text('Text for me'),
      ),
    );
  }
}
