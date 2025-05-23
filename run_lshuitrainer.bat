@echo off
REM Activate Poetry virtual environment and run lshUITrainer
powershell -Command "Invoke-Expression (poetry env activate) ; lshuitrainer"
pause 