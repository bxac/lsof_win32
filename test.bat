@IF "%1" EQU "" (
	set p=64
)
@pushd .
@call "\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars%p%.bat"
@popd
@mkdir obj
@mkdir bin

cl /MP8 /Zi /EHsc /Fo"./obj/" /Fe"./bin/test_opened.exe" /DWEBVIEW_EDGE /DWIN32 /D_DEBUG /DUNICODE /D_UNICODE /MTd OpenedFiles.cpp Utils.cpp Advapi32.lib User32.lib ole32.lib Kernel32.lib Psapi.lib

IF %ERRORLEVEL% NEQ 0 (
	echo COMPILE ERROR
)
IF %ERRORLEVEL% EQU 0 (
	echo COMPILE OK
	cd bin
	test_opened.exe
)
