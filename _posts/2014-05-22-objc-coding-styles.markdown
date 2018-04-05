---
layout: 	post
section:	blog
title:  	"Objective-C coding styles"
date:  		2014-05-22 16:57:51
excerpt_separator:  "<!--more-->"
---

Where Java has its [*Code Conventions for the Java Programming Language*](http://www.oracle.com/technetwork/java/codeconvtoc-136057.html), Python its [*PEP 8*](http://legacy.python.org/dev/peps/pep-0008/) or C# its [*Coding Conventions*](http://msdn.microsoft.com/en-us/library/ff926074.aspx), Objective-C doesn't have any official guidelines for formatting sourcecodes. The official [Coding Guidelines for Cocoa](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html) exists, but doesn't cover code formatting or recent features of Objective-C like object literals.

However, there are guidelines that reference best practices, including about formatting that is missing in Apple's official documentation. In this post, I will highlight topics that sounds particularly pertinents to me. It can be considered as *my* guidelines for Objective-C code formatting and will be formalized soon in a Github repository.

<!--more-->

# [NYTimes Objective-C Style Guide](https://github.com/NYTimes/objective-c-style-guide)
The iOS development team of *The New York Times* formalized its coding conventions in a Github repo. It is a great document, that covers a lot of syntax topics. I globally agree with this coding style. Here is a list of my favorite tips.

### Dot-notation syntax
NYTimes suggest to always use the dot-notation syntax for accessing or mutating properties, but to use bracket notation in every other cases.

{% highlight objc %}
view.backgroundColor = [UIColor orangeColor];
[UIApplication sharedApplication].delegate;
{% endhighlight %}

### Conditionals
Always use braces when a conditional body could be written without, to prevent errors. It also help with reading.

The ternary operator might be used only when it increase code neatness or readability. It should never been used to evaluate multiple conditions, except refactored in multiple boolean variables.

### Error handling
If a method returns a `NSError` instance by reference, the good practice is to switch on the returned value, not on the error variable (switching on the error variable value can cause false negatives in some cases).

{% highlight objc %}
NSError *error;
if (![self trySomethingWithError:&error]) {
    // Handle Error
}
{% endhighlight %}

### Methods
Method signatures should be formated with a space after the scope (-/+ char)  and a space between each method segment.

{% highlight objc %}
- (void)setExampleText:(NSString *)text image:(UIImage *)image;
{% endhighlight %}

### Variables
Variables have to be named as descriptively as possible and single letter names should be reserved to `for()` or `while()` loops.

The asterisk indicating pointers is sticker with the variable name, with a space before : `NSString *aString`.

Property instances should be used instead of simple instances variables. Direct instance variables access may be reserved to initializer, dealloc and setter/getter methods.

Apple naming guidelines should be followed at all time.

### Comments

When needed, comments have to be used to explain why a piece of code does something. Most of the comments could be avoided by great code formatting and variable/methods naming.

### `init` and `dealloc`
The `dealloc` method should be placed at the top of the implementation, with `init` just behind. `init` methods should be formatted as follows :

{% highlight objc %}
- (instancetype)init {
	self = [super init]; // or call the designated initalizer
    if (self) {
	      // Custom initialization
    }
    return self;
}
{% endhighlight %}

`instancetype` is, here, prefered to `id`, essentially because your compiler and IDE can check your code and autocomplete better.

### Literals
`NSNumber`, `NSString`, `NSArray` and `NSDictionnary` haves literal notations that has to be used when creating immutable instances of those objects.

{% highlight objc %}
NSArray *names = @[@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul"];
NSDictionary *productManagers = @{@"iPhone" : @"Kate", @"iPad" : @"Kamal", @"Mobile Web" : @"Bill"};
NSNumber *shouldUseLiterals = @YES;
NSNumber *buildingZIPCode = @10018;
{% endhighlight %}

### Constants
Constants should be declared as static constantes instead of `#define` macros. `#define` can be used only as an explicit macro.

{% highlight objc %}
static NSString * const NYTAboutViewControllerCompanyName = @"The New York Times Company";
{% endhighlight %}

### Enumerated types
Use the macro `NS_ENUM()`included with the SDK instead of `C`'s `enum`. It has stronger type checking and code completion.

{% highlight objc %}
typedef NS_ENUM(NSInteger, NYTAdRequestState) {
	NYTAdRequestStateInactive,
	NYTAdRequestStateLoading
};
{% endhighlight %}

### Private properties
Private properties should be declared in the implementation file using a class extension. Man should avoid named categories, unless when extending external classes.

{% highlight objc %}
@interface NYTAdvertisement ()

@property (nonatomic, strong) GADBannerView *googleAdView;
@property (nonatomic, strong) ADBannerView *iAdView;
@property (nonatomic, strong) UIWebView *adXWebView;

@end
{% endhighlight %}

### Images
Images should be named as a Camel Cased string in very descriptive way. It's name must help preserve project organization and developers sanity. It is prefixed with the name of the class where it is used (wich has to be correctly named as well). For example : `RefreshBarButtonItem` or `RefreshBarButtonItemSelected`.

Images can be grouped in folders when they are used for similar purposes.

### Singletons
Singleton objects should use a thread safe implementation for creating or getting their shared instances.

{% highlight objc %}
+ (instancetype)sharedInstance {
	static id sharedInstance = nil;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
  	sharedInstance = [[self alloc] init];
	});

	return sharedInstance;
}
{% endhighlight %}

### Xcode projects
Each physical file should be kept in the project folder. Groups in Xcode may be reflected by folders in the file system. Source files should be grouped by types and modules for greater lisibility.

# [Github's Coding conventions for Objective-C projects](https://github.com/github/objective-c-conventions)

Github's documentation is less complete than the NYTimes' one. It is considered as a subclass of Apple's official [Coding Guidelines for Cocoa](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html). It contains some interesting points of view.

### Whitespaces
Tabs may be used instead of spaces (configure your Xcode that way). You can use as many empty lines as you want to divide code into logical chunks.

### Documentation and organization
Make use of `#pragma mark -` to categorize methods into functional groupings and protocol implementations. A good practice could be to group methods that override methods from the same super class.

### Declarations
Github suggest that you should declare an ivar only if you need to change its type from its declared property. Actually, I didn't know that it was possible, but it sounds nice. Prefer exposing an immutable type for a property, it's a valid reason to declare an ivar for a property.

Don't use a space between an object type and the protocol it conforms to. C functions should have no space before the opening parenthesis. It is suggested to name C functions just like Objective-C classes (with a capital letter at the beginning) but I don't think it is a good practice.

### Expressions
Each long form ternary operator should be wrapped in parenthesis for readability. Il might be used only for assignments and arguments. The shirt form can avoid parenthesis.

{% highlight objc %}
Blah *a = (stuff == thing ? foo : bar);
Blah *b = thingThatCouldBeNil ?: defaultValue;
{% endhighlight %}

Separate binary operands with a single space, but unary operands with none.

{% highlight objc %}
void *ptr = &value + 10 * 3;
NewType a = (NewType)b;

for (int i = 0; i < 10; i++) {
	doCoolThings();
}
{% endhighlight %}

### Control structures
All the curvy braces should begin on the same line as their associated statement. They should end on a new line. Put a single space between the keyword and the parenthesis. No spaces between parenthesis and their content. (I *particularly* love this list !)

{% highlight objc %}
if (something == nil) {
    // do stuff
} else {
    // do other stuff
}
{% endhighlight %}

### Error handling and exceptions
You should use exceptions only to preserve from programmer error, for example to force the override of a method (abstract).

`NSError` should be passed as reference in methods that need to indicate errors.

# [Google Objective-C style guide](https://google.github.io/styleguide/objcguide.xml)

Google's style guide is the most complete and accomplished proposal. It is based on Apple's [Cocoa Coding Guidelines](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html)and Google's [Open Source C++ Style Guide](https://google.github.io/styleguide/cppguide.html). In this guide too, I picked some interesting things.

### Line length
The maximum line length for Objective-C should be 100 colums. You may set Xcode to display a visual limit in text editor. *Please note that it is corresponding to the size of a text window with inspectors displayed on both side and the splitter view in the center. *

### Classes
You should always keep your class simple.  Don't make it a "fourre-tout" by extending the class and it's area. Methods that don't need to be public may not. Better use private categories to prevent cluttering the public header.

Root headers should be imported before individual files. Also keep in mind to `#import` Objective-C headers and `#include` C headers.

### Memory management
When creating new temporary objects, use `autorelease` on the same line as the declaration rather than a separate `release` a few lines later in the same method.

`dealloc` methods should process instances in the same order as declared in the interface, for readability issues.
