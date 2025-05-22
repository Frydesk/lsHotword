@echo off
echo Setting up IsHotWord System...

:: Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed! Please install Python 3.8 or higher.
    pause
    exit /b 1
)

:: Create virtual environment if it doesn't exist
if not exist venv (
    echo Creating virtual environment...
    python -m venv venv
)

:: Activate virtual environment
call venv\Scripts\activate

:: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Install requirements
echo Installing requirements...
pip install lsHotword
pip install pip install -e .

:: Install WebSocket dependencies
echo Installing WebSocket dependencies...
pip install "uvicorn[standard]" websockets

echo.
echo Setup complete!
echo.
pause 