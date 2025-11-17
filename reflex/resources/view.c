#resource (stylesheet) "styles.txt" as styles;

#include "interface.h"



//get interface

Interface iface = app#iface;



//build self

using GLX;

self.SetStyle(styles);

self.SetFlow(kFlowY);

self#resize = true;


//create items, styled

auto box = Init(new, styles#Box);

auto buttons= Init (new, styles#ButtonsRow);

auto startbutton = Init(new, styles#StartButton, "Start");

auto stopbutton = Init(new, styles#StopButton, "Stop");

auto resetbutton = Init(new, styles#ResetButton, "Reset");

auto timeDisplay = Init(new, styles#TimeDisplay, "0.00");


//add to view

box.AddFloat(timeDisplay, kAlignmentCenter);

self.AddInlineFlex(box);

buttons.AddInlineFlex(startbutton);

self.AddInline(buttons);


startbutton#MouseDown = []()
{
    if (!iface.IsRunning())
    {
        iface.StartTimer();
        startbutton.SetState('selected');	//use single quotes eg 'id' or # eg #id where possible for IDs, as it avoids creating a string 
        stopbutton.ClearState('selected');	//rather than use SetState with constant false arg, prefer ClearState
		startbutton.Detach();
		buttons.AddInlineFlex(stopbutton);
    }
	buttons.AddInlineFlex(resetbutton);
	resetbutton.SendBottom(); //this was a functional change so that button stays in same position
};

stopbutton#MouseDown = []()
{
    if (iface.IsRunning())
    {
        iface.StopTimer();
        startbutton.ClearState('selected');
        stopbutton.SetState('selected');
		buttons.AddInlineFlex(startbutton);
		stopbutton.Detach(); 
    }
};

resetbutton#MouseDown = []()
{	  
    iface.ResetTimer();
    startbutton.ClearState('selected');
    stopbutton.ClearState('selected');
    timeDisplay.SetText("0.00");
	stopbutton.Detach(); 
	resetbutton.Detach(); 
	buttons.AddInlineFlex(startbutton);
};

void OnReset()
{
    timeDisplay.SetText("0.00");
    startbutton.ClearState('selected');
    stopbutton.ClearState('selected');
}

void OnRestore(Data::BinaryObject chunk)
{
	Array@UInt8 stream = chunk;
}

Data::BinaryObject OnStore()
{
	Array@UInt8 stream;

	return stream;
}

self.SetOnClock([timeDisplay](Float32 delta)
{
	auto elapsed = iface.GetElapsed();

	auto text = ToString(elapsed, 2, false);

	timeDisplay.SetText(text);
});


