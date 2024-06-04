import '../../Utils/Exports/all_exports.dart';

Widget myRow({required String key, required String value}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: key,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.kTextColor1,
                fontFamily: 'Montserrat-Regular',
                fontSize: 11)),
        TextSpan(
            text: value,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.kTextColor2,
              fontFamily: 'Montserrat-Regular',
            )),
      ],
    ),
  );
}
