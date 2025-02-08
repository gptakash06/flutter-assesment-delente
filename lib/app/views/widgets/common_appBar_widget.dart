import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';



class CommonAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double elevation;
  final Widget? leading;

  const CommonAppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.elevation = 4.0,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color:Colors.white ),).tr(),
      actions: actions,
      leading: leading,
          automaticallyImplyLeading: false,
          // != null ?
          // IconButton(
          //   icon: const Icon(Icons.arrow_back,color: Colors.white,),
          //   onPressed: () {
          //     NavigationHelper.goBack();
          //   },
          // ):null, // Default to back icon if leading is null
      elevation: elevation,
    );
  }
}
