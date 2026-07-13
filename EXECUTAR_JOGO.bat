@echo off
setlocal
cd /d "%~dp0src\asm"

set "SIMULADOR=fpgrars-x86_64-pc-windows-msvc--unb.exe"
set "CODIGO=jogoOAC.asm"

if not exist "%SIMULADOR%" (
    echo ERRO: simulador nao encontrado em src\asm.
    pause
    exit /b 1
)

if not exist "%CODIGO%" (
    echo ERRO: jogoOAC.asm nao encontrado em src\asm.
    pause
    exit /b 1
)

"%SIMULADOR%" "%CODIGO%"
set "STATUS=%ERRORLEVEL%"

if not "%STATUS%"=="0" (
    echo.
    echo A simulacao terminou com erro %STATUS%.
    pause
)

exit /b %STATUS%
