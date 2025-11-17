#resource (stylesheet) "styles.txt" as styles;

#include "interface.h"

#module "System"



//get interface

Interface iface = app#iface;



//build self

using GLX;

self.SetStyle(styles);

self.SetFlow(kFlowY);

self#resize = true;


//define style variable if reusable
auto buttonsrow = styles#ButtonsRow;

auto box = new Object;
box.SetStyle(styles#Box);
self.AddInlineFlex(box);

auto buttons= Init (new, buttonsrow);
self.AddInline(buttons);

auto startbutton = new Object;
startbutton.SetStyle(styles#StartButton);
startbutton.SetText("Start");
buttons.AddInlineFlex(startbutton);
startbutton.SetFlow(kFlowCenter);

auto stopbutton = new Object;
stopbutton.SetStyle(styles#StopButton);
stopbutton.SetText("Stop");

auto resetbutton = new Object;
resetbutton.SetText("Reset");
resetbutton.SetStyle(styles#ResetButton);

auto timeDisplay = Init(new, styles#TimeDisplay);
box.AddFloat(timeDisplay, kAlignmentCenter);
timeDisplay.SetText("0.00"); 


stopbutton.Detach(); 

resetbutton.Detach(); 



startbutton#MouseDown = []()
{
    if (!iface.IsRunning())
    {
        iface.StartTimer();
        startbutton.SetState("selected", true);
        stopbutton.SetState("selected", false);
		startbutton.Detach();
		buttons.AddInlineFlex(stopbutton);
	
		
    }
	buttons.AddInlineFlex(resetbutton);
};

stopbutton#MouseDown = []()
{
    if (iface.IsRunning())
    {
        iface.StopTimer();
        startbutton.SetState("selected", false);
        stopbutton.SetState("selected", true);
		buttons.AddInlineFlex(startbutton);
		stopbutton.Detach(); 
		
    }
};

resetbutton#MouseDown = []()
{	  
    iface.ResetTimer();
    startbutton.SetState("selected", false);
    stopbutton.SetState("selected", false);
    timeDisplay.SetText("0.00");
	stopbutton.Detach(); 
	resetbutton.Detach(); 
	buttons.AddInlineFlex(startbutton);
};

void OnReset()
{
    timeDisplay.SetText("0.00");
    startbutton.SetState("selected", false);
    stopbutton.SetState("selected", false);
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


