@echo OFF
title JO-KEN-PO
mode 80,30
color 3f

:inicio
set vitorias=0
set derrotas=0
set empates=0
cls
echo =====================================
echo ------o0(ctrl + c p/ sair..)0o-------
echo              JO-KEN-PO
echo -------o0(Nome p/ jogar..)0o---------
set /p nome= Digite seu nome:
echo =====================================
goto:sorteio


:sorteio
set /a num = (%Random%%%4) + 1

if %num% == 1 (
set num=PEDRA)
if %num% == 2 (
set num=PAPEL)
if %num% == 3 (
set num=TESOURA)
if %num% == 4 (
set num=LARGATO)

:menu
cls
echo ----------o0(Bem-Vindo)0o-----------
echo       Ao Jogo JO-KEN-PO %nome%
echo ----------------o0o-----------------
echo.
echo [1]PEDRA
echo [2]PAPEL
echo [3]TESOURA
echo [4]LARGATO
echo [E]Encerrar jogo
echo [R]Regras
echo -------------------------------------
echo.

set /p op=Digite a opcao que deseja:
if %op% == 1 (goto:pedra)
if %op% == 2 (goto:papel)
if %op% == 3 (goto:tesoura)
if %op% == 4 (goto:largato)
if /i %op% == e (goto:encerrar)
if /i %op% == r (goto:regras) else (goto:invalida)
goto:menu

:pedra
echo.
echo -------------------------------------
echo  %nome% escolheu: PEDRA
echo Computador escolheu: %num%
echo -------------------------------------
if %num% == PEDRA (goto:empates)
if %num% == PAPEL (goto:derrotas)
if %num% == TESOURA (goto:vitorias)
if %num% == LARGATO (goto:derrotas)
goto:placar

:papel
echo.
echo -------------------------------------
echo  %nome% escolheu: PAPEL
echo Computador escolheu: %num%
echo -------------------------------------
if %num% == PEDRA (goto:vitorias)
if %num% == PAPEL (goto:empates)
if %num% == TESOURA (goto:derrotas)
if %num% == LARGATO (goto:derrotas)
goto:placar

:tesoura
echo.
echo -------------------------------------
echo  %nome% escolheu: TESOURA
echo  Computador escolheu: %num%
echo -------------------------------------
if %num% == PEDRA (goto:derrotas)
if %num% == PAPEL (goto:vitorias)
if %num% == TESOURA (goto:empates)
if %num% == LARGATO (goto:derrotas)
goto:placar

:largato
echo -------------------------------------
echo  %nome% escolheu: LARGATO
echo Computador escolheu: %num%
echo -------------------------------------
if %num% == PEDRA (goto:derrotas)
if %num% == PAPEL (goto:vitorias)
if %num% == TESOURA (goto:vitorias)
if %num% == LARGATO (goto:empates)
goto:placar

:vitorias
echo =====================================
echo         PARABENS.. VOCE VENCEU!
echo =====================================
set /a vitorias=%vitorias% + 1
pause
goto:placar

:derrotas
echo =====================================
echo         QUE PENA.. VOCE PERDEU
echo =====================================
set /a derrotas=%derrotas% + 1
pause
goto:placar

:empates
echo =====================================
echo            OPS.. DEU EMPATE
echo =====================================
set /a empates=%empates% + 1
pause
goto:placar

:placar
cls
echo.
echo =====================================
echo            PLACAR DO JOGO
echo =====================================
echo.
echo VITORIAS: %vitorias%
echo DERROTAS: %derrotas%
echo EMPATES: %empates%
echo.
echo =====================================
pause > nul
set /p resp=DESEJA JOGAR NOVAMENTE ?[S/N]:
if /i %resp% == s (goto:sorteio) else (
    goto:menu
)

:invalida
echo ---------------------------------------
echo            OPCAO INVALIDA
echo ---------------------------------------
pause
goto:sorteio

:encerrar
set /p resp=DESEJA SAIR DO JOGO ? [S/N]:
if /i %resp% == s (goto:bye) else (
    goto:menu)

:bye
echo.
cls
echo        ---================---
echo               ATE MAIS...
echo        -=====================-
echo.
timeout /t 3 /nobreak
exit
pause
