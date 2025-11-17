#include "interface.h"

#module "System"

//state
bool gIsRunning = false;
Float32 gStartTime = 0.0f;
Float32 gPausedTime = 0.0f;

//Bootstrap persistence callbacks
void OnReset()
{
    gIsRunning = false;
    gStartTime = 0.0f;
    gPausedTime = 0.0f;
}

void OnRestore(Data::BinaryObject chunk)
{
    Array@UInt8 stream = chunk;
    
    Data::Restore(stream, gIsRunning, gStartTime, gPausedTime);
}

Data::BinaryObject OnStore()
{
    Array@UInt8 stream;
    
    Data::Store(stream, gIsRunning, gStartTime, gPausedTime);
    
    return stream;
}

//implement and publish interface
self#iface = new Interface
{
    .StartTimer = []()
    {
        gStartTime = System::GetElapsedTime();
        gIsRunning = true;
        self.Notify(true);
    },
    
    .StopTimer = []()
    {
        if (gIsRunning)
        {
            gPausedTime = System::GetElapsedTime() - gStartTime;
            gIsRunning = false;
            self.Notify(true);
        }
    },
    
    .ResetTimer = []()
    {
        gIsRunning = false;
        gStartTime = 0.0f;
        gPausedTime = 0.0f;
        self.Notify(true);
    },
    
    .IsRunning = []bool()
    {
        return gIsRunning;
    },
    
    .GetElapsed = []Float32()
{
    if (gIsRunning)
    {
        return System::GetElapsedTime() - gStartTime;
    }
    
    return gPausedTime;
}


};