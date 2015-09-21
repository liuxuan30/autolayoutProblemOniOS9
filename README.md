# autolayoutProblemOniOS9
autolayout Problem On iOS9 

check http://stackoverflow.com/questions/32577211/view-frame-width-is-not-correct-after-layoutsubviews-against-its-constraints-on

So far, I contact Apple technical support today, They said:
```
A way to work around your issue is to remove the size class specifications from all your constraints and from all your views.  
You have everything configured for the compact width regular height size classes (wC hR in Interface Builder).  
If you remove that size class for each constraint and each view (click the little x), 
and instead turn on the default size class for Any Width Any Height, 
your view will have consistent behavior on iOS 8 and iOS 9.  
```

My workaround for now is to override layoutSubViews and set the width again after calling [super layoutSubViews].

Use any:any size class also help, but I need to support landscape mode, so this is not an option to me. Stay tuned for the followups.
