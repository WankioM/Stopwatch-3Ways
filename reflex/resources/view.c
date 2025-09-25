#resource (stylesheet) "styles.txt" as styles;

#include "interface.h"



//get interface

Interface iface = app#iface;



//build self

using GLX;

self.SetStyle(styles);

self.SetFlow(kFlowY);

self#resize = true;

//define style variable if reusable
auto buttonsrow = styles#ButtonsRow;

auto box= CreateObject('Split');
box.SetStyle(styles#Box);
self.AddInline(box);

auto clock= new Object;
clock.SetStyle(styles#Clock);
box.AddInline(clock);
clock#resize = true;

auto buttons= Init (new, buttonsrow);
self.AddInlineFlex(buttons);

auto startbutton = new Object;
startbutton.SetStyle(styles#StartButton);
buttons.AddInlineFlex(startbutton);
startbutton.SetFlow(kFlowCenter);

auto stopbutton = new Object;
stopbutton.SetStyle(styles#StopButton);
buttons.AddInlineFlex(stopbutton);

auto resetbutton = new Object;
resetbutton.SetStyle(styles#ResetButton);
buttons.AddInlineFlex(resetbutton); 



void OnReset()
{
}

void OnRestore(Data::BinaryObject chunk)
{
	Array@UInt8 stream = chunk;
	Float32 w;
	Data::Restore(stream, w);
	SetBounds(clock, 'split_size', {w, 0.0f} , kLarge );
}

Data::BinaryObject OnStore()
{

	Array@UInt8 stream;
	auto w = GetBounds(clock, 'split_size').a.w;
	Data::Store(stream, w);
	return stream;
}


self.SetOnUpdate([]()
{
	//state changed, update the view
});



