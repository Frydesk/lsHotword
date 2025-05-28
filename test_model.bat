@echo off
REM Activate uv virtual environment and run test model
call .venv\Scripts\activate.bat
cd Examples
lshTestModel --model ./model.h5
cd ..
pause 