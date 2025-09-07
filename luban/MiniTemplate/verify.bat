set WORKSPACE=..
set LUBAN_DLL=%WORKSPACE%\Tools\Luban\Luban.dll
set CONF_ROOT=.

dotnet %LUBAN_DLL% ^
    -t all ^
    -c cs-bin ^
    -c java-json ^
    -d bin ^
    -d json ^
    --conf %CONF_ROOT%\verify.conf ^
    -x cs-bin.outputCodeDir=..\..\output\extAndVld\gen ^
    -x java-json.outputCodeDir=..\..\output\code\java ^
    -x bin.outputDataDir=..\..\output\extAndVld\data ^
    -x json.outputDataDir=..\..\output\data\json ^
    -x namingConvention.cs-bin.namespace=pascal ^
    -x namingConvention.cs-bin.type=pascal ^
    -x namingConvention.cs-bin.method=pascal ^
    -x namingConvention.cs-bin.property=pascal ^
    -x namingConvention.cs-bin.field=camel ^
    -x namingConvention.cs-bin.enumItem=pascal

dotnet test ..\..\output\extAndVld
