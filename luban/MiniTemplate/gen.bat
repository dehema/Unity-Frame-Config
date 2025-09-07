set Dir_Project=..\..\..\
set Dir_Luban=%Dir_Project%\Config\luban
set LUBAN_DLL=%Dir_Luban%\Tools\Luban\Luban.dll

dotnet %LUBAN_DLL% ^
    -t all ^
    -c cs-simple-json^
    -d json ^
    --conf .\gen.conf ^
    -x outputCodeDir=%Dir_Project%\Assets\RainFramework\Runtime\Config^
    -x outputDataDir=%Dir_Project%\Assets\StreamingAssets\config

pause

