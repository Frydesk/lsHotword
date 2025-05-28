@echo off
REM Install uv using pip
pip install uv

REM Remove old Poetry virtual environment if it exists
if exist .venv rmdir /s /q .venv

REM Create new virtual environment using uv
uv venv

REM Activate the virtual environment
call .venv\Scripts\activate.bat

REM Install dependencies using uv
uv pip install -r requirements.txt

REM Install the package in editable mode
uv pip install -e .

echo UV setup complete! Your virtual environment is ready.
pause