#module "Data > Serialize"
#module "File"
#module "System"

//interface to expose to view

object Interface
{
    Fn@(void) StartTimer = null;
    Fn@(void) StopTimer = null;
    Fn@(void) ResetTimer = null;
    Fn@(bool) IsRunning = null;
   Fn@(Float32) GetElapsed = null;
};
