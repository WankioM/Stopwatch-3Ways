#include "reflex_ext/bootstrap/vm_app.h"




//
//entrypoint

TRef <Object> System::App::OnStart(const CString::View & cmdline, Configuration & config)
{
	return Bootstrap::StartVmApp
	(
		config,
		"reflex",
		"reflex",
		K32("reflex"),
		__FILE__,
		L":res:reflex/main.c",
		L":res:reflex/view.c"
	);
}
