# autolayoutProblemOniOS9
autolayout Problem On iOS9 

### UPDATE after WWDC 2016

So I went to WWDC 2016 and talked to a lab engineer, he said I could use
`self.contentView.translatesAutoresizingMaskIntoConstraints = NO;`
to solve it.

However, an evangelist for UIKit technologies reached me out a few days later saying it's not a valid fix because I don't own contentView, and they are pulling back this issue again under investigation, and advice me using the old workdaround

Thus except for my workaround, use above code at your own risk right now.


### Still not fixed in iOS 9.3.2

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
