import 'package:flutter/material.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/touristmodel.dart';
import 'package:hotel_book_task/widgets/input_widget.dart';

class TouristForm extends StatefulWidget {
  final TouristModel tourist;
  const TouristForm({
    super.key,
    required this.tourist,
  });

  @override
  State<TouristForm> createState() => _TouristFormState();
}

class _TouristFormState extends State<TouristForm> {
  TextEditingController namecont = TextEditingController();
  TextEditingController secondnamecont = TextEditingController();
  TextEditingController birthdaycont = TextEditingController();
  TextEditingController citizenshipcont = TextEditingController();
  TextEditingController interpassnumbercont = TextEditingController();
  TextEditingController interpassexpirycont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(0),
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white, // here for close state
            colorScheme: const ColorScheme.light(
              primary: AppColors.blue,
            ),
            dividerColor: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ExpansionTile(
              title: Text(
                'Турист ${widget.tourist.i}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              children: [
                Input('Имя', namecont, change: (v) {
                  setState(() {
                    widget.tourist.setName(v);
                  });
                }),
                Input('Фамилия', secondnamecont, change: (v) {
                  setState(() {
                    widget.tourist.setSecondname(v);
                  });
                }),
                Input('Дата рождения', birthdaycont, change: (v) {
                  setState(() {
                    widget.tourist.setBirthday(v);
                  });
                }),
                Input('Гражданство', citizenshipcont, change: (v) {
                  setState(() {
                    widget.tourist.setCitizenship(v);
                  });
                }),
                Input('Номер загранпаспорта', interpassnumbercont, change: (v) {
                  setState(() {
                    widget.tourist.setInterpassnumber(v);
                  });
                }),
                Input('Срок действия загранпаспорта', interpassexpirycont, change: (v) {
                  setState(() {
                    widget.tourist.setInterpassexpiry(v);
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
