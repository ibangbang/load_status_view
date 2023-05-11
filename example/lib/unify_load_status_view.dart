import 'package:flutter/material.dart';
import 'package:load_status_view/load_status_view.dart';

///unify the style and properties for the whole project.
class UnifyLoadStatusView extends StatefulWidget {
  final LoadStatus status;
  final Widget? child;
  final String? errorTip;
  final VoidCallback? errorCall;
  final VoidCallback? emptyCall;
  final VoidCallback? unauthorizedCall;

  const UnifyLoadStatusView({
    Key? key,
    this.status = LoadStatus.loading,
    this.child,
    this.errorTip,
    this.errorCall,
    this.emptyCall,
    this.unauthorizedCall,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UnifyLoadStatusView> {
  @override
  Widget build(BuildContext context) {
    return LoadStatusView(
      status: widget.status,
      dividerHeight: 16,
      loadingIcon: const SizedBox(
        width: 44,
        height: 44,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.red,
        ),
      ),
      loadingTip: 'loading 😄',
      emptyIcon: Icon(
        Icons.no_backpack_outlined,
        size: 44,
        color: Colors.red,
      ),
      emptyButton: ElevatedButton(
        onPressed: widget.emptyCall,
        child: Text("unify empty"),
      ),
      showEmptyButton: true,
      emptyTip: 'unify no data',
      emptyButtonText: "unify look others",
      errorWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 44, style: FlutterLogoStyle.markOnly),
          SizedBox(
            height: 16,
          ),
          Text('${widget.errorTip}', style: TextStyle(color: Colors.red),),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: widget.errorCall,
            child: Text("unify retry"),
          ),
        ],
      ),
      unauthorizedIcon: Icon(
        Icons.no_accounts_outlined,
        size: 44,
        color: Colors.grey,
      ),
      unauthorizedTip: 'you need sign in first.',
      showUnauthorizedButton: true,
      unauthorizedButtonText: 'Sign in / Sign up',
      unauthorizedCall: widget.unauthorizedCall,
      child: widget.child,
    );
  }
}
