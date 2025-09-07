@echo off
:: 设置命令行编码为 UTF-8
chcp 65001 >nul

set "SCRIPT_DIR=%~dp0"
echo 当前脚本所在目录：%SCRIPT_DIR%

rem 设置默认值
set "JAVA_CODE_DIR=%SCRIPT_DIR%..\..\output\serverCode"
set "JSON_DATA_DIR=%SCRIPT_DIR%..\..\output\serverData\meta_luban"
set "CSHARP_CODE_DIR=%SCRIPT_DIR%..\..\output\clientCode"
set "CSHARP_DATA_DIR=%SCRIPT_DIR%..\..\output\clientData\MetaLuBan"

rem 检查是否有参数传入
if not "%~1"=="" set "JAVA_CODE_DIR=%~1"
if not "%~2"=="" set "JSON_DATA_DIR=%~2"
if not "%~3"=="" set "CSHARP_CODE_DIR=%~3"
if not "%~4"=="" set "CSHARP_DATA_DIR=%~4"

echo JAVA_CODE_DIR: %JAVA_CODE_DIR%
echo JSON_DATA_DIR: %JSON_DATA_DIR%
echo CSHARP_CODE_DIR: %CSHARP_CODE_DIR%
echo CSHARP_DATA_DIR: %CSHARP_DATA_DIR%

dotnet "%SCRIPT_DIR%../Tools/Luban/Luban.dll" ^
    --conf "%SCRIPT_DIR%gen.conf" ^
    -t all ^
    -c cs-bin ^
    -x cs-bin.outputCodeDir=%CSHARP_CODE_DIR% ^
    -d bin ^
    -x bin.outputDataDir=%CSHARP_DATA_DIR% ^
    -x namingConvention.cs-bin.namespace=pascal ^
    -x namingConvention.cs-bin.type=pascal ^
    -x namingConvention.cs-bin.method=pascal ^
    -x namingConvention.cs-bin.property=pascal ^
    -x namingConvention.cs-bin.field=camel ^
    -x namingConvention.cs-bin.enumItem=pascal ^
    -c java-json ^
    -x java-json.outputCodeDir=%JAVA_CODE_DIR% ^
    -d json ^
    -x json.outputDataDir=%JSON_DATA_DIR% ^
    -x namingConvention.java-json.namespace=camel ^
    -x namingConvention.java-json.type=pascal ^
    -x namingConvention.java-json.method=camel ^
    -x namingConvention.java-json.property=camel ^
    -x namingConvention.java-json.field=camel ^
    -x namingConvention.java-json.enumItem=pascal

    