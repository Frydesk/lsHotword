@echo off
echo Setting up IsHotWord System...

:: Check if Python is already installed in the project folder
if exist "python\python.exe" (
    echo Local Python installation found.
    set PYTHON_CMD=python\python.exe
) else (
    echo Installing Python 3.8 locally...
    
    :: Create python directory if it doesn't exist
    if not exist "python" mkdir python
    
    :: Download Python 3.8 installer
    curl -o python_installer.exe https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe
    
    :: Install Python locally
    python_installer.exe /quiet InstallAllUsers=0 TargetDir=%CD%\python PrependPath=0 Include_pip=1
    
    :: Clean up installer
    del python_installer.exe
    
    set PYTHON_CMD=python\python.exe
)

:: Check if pip is installed
%PYTHON_CMD% -m pip --version >nul 2>&1
if errorlevel 1 (
    echo Installing pip...
    curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
    %PYTHON_CMD% get-pip.py
    del get-pip.py
)

:: Set Poetry environment variables to use local Python
set POETRY_HOME=%CD%\.poetry
set PATH=%POETRY_HOME%\bin;%PATH%

:: Install Poetry using the local Python
echo Installing Poetry...
%PYTHON_CMD% -m pip install poetry

:: Configure Poetry
echo Configuring Poetry...
:: Set Poetry to create venvs in project directory
%PYTHON_CMD% -m poetry config virtualenvs.in-project true
:: Tell Poetry to use our local Python installation
%PYTHON_CMD% -m poetry config virtualenvs.path "%CD%\.venv"
%PYTHON_CMD% -m poetry config virtualenvs.prefer-active-python true

:: Install dependencies using Poetry
echo Installing project dependencies...
%PYTHON_CMD% -m poetry env use "%CD%\python\python.exe"
%PYTHON_CMD% -m poetry install

echo.
echo Setup complete! To activate the environment, run: .\python\python.exe -m poetry shell
echo.
pause 