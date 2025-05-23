@echo off
REM Activate Poetry virtual environment and run lshUITrainer
powershell -Command "Invoke-Expression (poetry env activate) ; cd Examples ; lshTestModel --model ./model.h5"
pause 