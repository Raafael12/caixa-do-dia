@echo off
rem ==================================================================
rem  Caixa do Dia - abre o aplicativo em uma janela propria.
rem
rem  Ordem: Microsoft Edge > Google Chrome > navegador padrao.
rem  Sempre o MESMO navegador primeiro: as vendas ficam guardadas
rem  dentro do navegador, e trocar de navegador "some" com elas.
rem
rem  Este arquivo usa so letras sem acento de proposito: o prompt do
rem  Windows le o .bat em outra codificacao e estragaria os acentos.
rem  Caminhos com acento funcionam, porque vem de %~dp0 (nao do texto).
rem
rem  Para conferir sem abrir nada:  "Abrir Caixa.bat" /teste
rem ==================================================================

rem Sem "delayed expansion" aqui: assim um "!" no caminho nao se perde.
setlocal DisableDelayedExpansion

rem Pasta deste .bat (ja termina com \) + app\index.html
set "PAGINA=%~dp0app\index.html"

if not exist "%PAGINA%" goto naoachou

rem ---- Procura o Edge nos caminhos padrao --------------------------
set "NAVEGADOR="
if not defined NAVEGADOR if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "NAVEGADOR=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not defined NAVEGADOR if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "NAVEGADOR=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not defined NAVEGADOR if exist "%LOCALAPPDATA%\Microsoft\Edge\Application\msedge.exe" set "NAVEGADOR=%LOCALAPPDATA%\Microsoft\Edge\Application\msedge.exe"

rem ---- Se nao tiver Edge, procura o Chrome -------------------------
if not defined NAVEGADOR if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "NAVEGADOR=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined NAVEGADOR if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "NAVEGADOR=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not defined NAVEGADOR if exist "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" set "NAVEGADOR=%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"

rem ---- Monta a URL file:/// ----------------------------------------
rem Daqui em diante so usamos !VAR!, que nunca reinterpreta o conteudo,
rem entao caracteres como & ^ ( ) ! no caminho ficam intactos.
setlocal EnableDelayedExpansion
set "URL=!PAGINA!"
rem "%%" vira "%" no .bat. O % precisa ser trocado primeiro.
set "URL=!URL:%%=%%25!"
set "URL=!URL: =%%20!"
set "URL=!URL:#=%%23!"
set "URL=!URL:\=/!"
set "URL=file:///!URL!"
rem Letras com acento ficam como estao: o Edge/Chrome converte sozinho.

if /i "%~1"=="/teste" goto teste

if defined NAVEGADOR (
  start "" "!NAVEGADOR!" --app="!URL!" --start-maximized
) else (
  start "" "!PAGINA!"
)
exit /b 0

:teste
echo Pagina:    !PAGINA!
if defined NAVEGADOR (echo Navegador: !NAVEGADOR!) else (echo Navegador: padrao do Windows)
echo URL:       !URL!
exit /b 0

:naoachou
echo.
echo  Nao encontrei o aplicativo (pasta "app").
echo.
echo  Provavelmente o arquivo ZIP nao foi descompactado.
echo  Clique com o botao direito no ZIP, escolha "Extrair tudo..."
echo  e abra o "Abrir Caixa.bat" de dentro da pasta extraida.
echo.
pause
exit /b 1
