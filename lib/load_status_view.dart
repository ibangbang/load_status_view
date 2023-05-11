library load_status_view;

import 'package:flutter/material.dart';

enum LoadStatus {
  loading,
  success,
  empty,
  error,
  unauthorized,
}

class LoadStatusView extends StatefulWidget {
  final LoadStatus status;

  ///success status show child.
  final Widget? child;

  ///
  final Color? backgroundColor;

  ///divider
  final double dividerHeight;

  ///the status widgets
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final Widget? unauthorizedWidget;

  ///custom widgets for icon
  final Widget? loadingIcon;
  final Widget? emptyIcon;
  final Widget? errorIcon;
  final Widget? unauthorizedIcon;

  ///icon
  final double iconSize;
  final Color? iconColor;
  final Color? loadingIconColor;
  final Color? emptyIconColor;
  final Color? errorIconColor;
  final Color? unauthorizedIconColor;

  ///custom widgets for tip
  final Widget? loadingTipWidget;
  final Widget? emptyTipWidget;
  final Widget? errorTipWidget;
  final Widget? unauthorizedTipWidget;
  final String? loadingTip;
  final String? emptyTip;
  final String? errorTip;
  final String? unauthorizedTip;
  final TextStyle? tipTextStyle;
  final TextStyle? loadingTipTextStyle;
  final TextStyle? emptyTipTextStyle;
  final TextStyle? errorTipTextStyle;
  final TextStyle? unauthorizedTipTextStyle;

  ///custom widgets for button
  final Widget? emptyButton;
  final Widget? errorButton;
  final Widget? unauthorizedButton;

  ///custom properties
  final bool showEmptyButton;
  final bool showUnauthorizedButton;
  final String? errorButtonText;
  final String? emptyButtonText;
  final String? unauthorizedButtonText;

  ///callback
  final VoidCallback? errorCall;
  final VoidCallback? emptyCall;
  final VoidCallback? unauthorizedCall;

  const LoadStatusView({
    Key? key,
    this.status = LoadStatus.loading,
    this.child,
    this.backgroundColor,
    this.dividerHeight = 8,
    this.loadingWidget,
    this.emptyWidget,
    this.errorWidget,
    this.unauthorizedWidget,
    this.loadingIcon,
    this.emptyIcon,
    this.errorIcon,
    this.unauthorizedIcon,
    this.iconSize = 44,
    this.iconColor,
    this.loadingIconColor,
    this.emptyIconColor,
    this.errorIconColor,
    this.unauthorizedIconColor,
    this.loadingTipWidget,
    this.emptyTipWidget,
    this.errorTipWidget,
    this.unauthorizedTipWidget,
    this.loadingTip,
    this.emptyTip,
    this.errorTip,
    this.unauthorizedTip,
    this.tipTextStyle,
    this.loadingTipTextStyle,
    this.emptyTipTextStyle,
    this.errorTipTextStyle,
    this.unauthorizedTipTextStyle,
    this.emptyButton,
    this.errorButton,
    this.unauthorizedButton,
    this.showEmptyButton = false,
    this.showUnauthorizedButton = true,
    this.emptyButtonText,
    this.errorButtonText,
    this.unauthorizedButtonText,
    this.errorCall,
    this.emptyCall,
    this.unauthorizedCall,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LoadStatusView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.backgroundColor),
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget(context),
    );
  }

  Widget _buildWidget(BuildContext context) {
    switch (widget.status) {
      case LoadStatus.loading:
        return widget.loadingWidget ?? _buildLoadingWidget(context);
      case LoadStatus.success:
        return widget.child ?? emptyBox;
      case LoadStatus.empty:
        return widget.emptyWidget ?? _buildEmptyWidget(context);
      case LoadStatus.error:
        return widget.errorWidget ?? _buildErrorWidget(context);
      case LoadStatus.unauthorized:
        return widget.unauthorizedWidget ?? _buildUnauthorizedWidget(context);
    }
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.loadingIcon ??
            SizedBox(
              width: widget.iconSize,
              height: widget.iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: widget.loadingIconColor ?? widget.iconColor,
              ),
            ),
        divider,
        widget.loadingTipWidget ??
            Text(
              widget.loadingTip ?? "loading...",
              style: widget.loadingTipTextStyle ??
                  Theme.of(context).textTheme.bodyMedium,
            )
      ],
    );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    var hasTip = widget.emptyTip?.isNotEmpty == true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.emptyIcon ??
            Icon(
              Icons.no_cell_outlined,
              size: widget.iconSize,
              color: widget.emptyIconColor ?? widget.iconColor,
            ),
        divider,
        hasTip
            ? widget.emptyTipWidget ??
                Text(
                  '${widget.emptyTip}',
                  style: widget.emptyTipTextStyle ??
                      Theme.of(context).textTheme.bodyMedium,
                )
            : emptyBox,
        hasTip ? divider : emptyBox,
        widget.showEmptyButton
            ? widget.emptyButton ??
                ElevatedButton(
                    onPressed: widget.emptyCall,
                    child: Text(widget.emptyButtonText ?? "no data",
                        style: TextStyle(color: labelColor)))
            : emptyBox,
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    var hasTip = widget.errorTip?.isNotEmpty == true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.errorIcon ??
            Icon(
              Icons.error_outline_outlined,
              size: widget.iconSize,
              color: widget.errorIconColor ?? widget.iconColor,
            ),
        divider,
        hasTip
            ? widget.errorTipWidget ??
                Text(
                  '${widget.errorTip}',
                  style: widget.errorTipTextStyle ??
                      Theme.of(context).textTheme.bodyMedium,
                )
            : emptyBox,
        hasTip ? divider : emptyBox,
        widget.errorButton ??
            ElevatedButton(
              onPressed: widget.errorCall,
              child: Text(widget.errorButtonText ?? "retry",
                  style: TextStyle(color: labelColor)),
            )
      ],
    );
  }

  Widget _buildUnauthorizedWidget(BuildContext context) {
    var hasTip = widget.unauthorizedTip?.isNotEmpty == true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.unauthorizedIcon ??
            Icon(
              Icons.no_accounts_outlined,
              size: widget.iconSize,
              color: widget.unauthorizedIconColor ?? widget.iconColor,
            ),
        divider,
        hasTip
            ? widget.unauthorizedTipWidget ??
                Text(
                  '${widget.unauthorizedTip}',
                  style: widget.unauthorizedTipTextStyle ??
                      Theme.of(context).textTheme.bodyMedium,
                )
            : emptyBox,
        hasTip ? divider : emptyBox,
        widget.showUnauthorizedButton
            ? ElevatedButton(
                onPressed: widget.unauthorizedCall,
                child: Text(widget.unauthorizedButtonText ?? "sign in",
                    style: TextStyle(color: labelColor)),
              )
            : emptyBox,
      ],
    );
  }

  Widget get divider => SizedBox(
        height: widget.dividerHeight,
      );

  Widget get emptyBox => const SizedBox();

  Color? get labelColor => Theme.of(context).primaryTextTheme.bodyLarge?.color;
}
