@echo off
rem ==================================================================
rem  Caixa do Dia - cria o atalho "Caixa do Dia" na Area de Trabalho.
rem  Rode uma unica vez, depois de descompactar o ZIP.
rem
rem  O trabalho e feito por app\criar-atalho.ps1 (PowerShell + WScript.Shell).
rem  Sem acentos neste arquivo de proposito (o prompt estragaria a codificacao).
rem ==================================================================
setlocal DisableDelayedExpansion

set "SCRIPT=%~dp0app\criar-atalho.ps1"
if not exist "%SCRIPT%" goto naoachou

rem -ExecutionPolicy Bypass vale so para esta execucao; nao muda nada no Windows.
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%" %*
exit /b %errorlevel%

:naoachou
echo.
echo  Nao encontrei a pasta "app".
echo  Descompacte o ZIP (botao direito, "Extrair tudo...") e rode
echo  este arquivo de dentro da pasta extraida.
echo.
pause
exit /b 1
