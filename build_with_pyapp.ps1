# This is supposed to be executed in the root of the project

# Export poetry requirements to requirements.txt
poetry export -f requirements.txt --output requirements.txt
# Now set environment variables properly in powershell
$env:PYAPP_PROJECT_VERSION="0.1.0"
$env:PYAPP_PROJECT_NAME="pyappexample"
# Set the path to the requirements.txt file, it is the absolute path of ./requirements.txt
$env:PYAPP_PROJECT_DEPENDENCY_FILE="$((Get-Item -Path "./requirements.txt").FullName)"
$env:PYAPP_EXEC_SCRIPT="$((Get-Item -Path "./pyappexample/circle.py").FullName)"

# if check if pyapp-latest folder not exists
if (!(Test-Path -Path "./pyapp-latest")) {
    # Download the zip file from the URL
    Invoke-WebRequest https://github.com/ofek/pyapp/releases/latest/download/source.zip -OutFile pyapp-source.zip
    # Extract the zip file to the temporary folder using Expand-Archive
    Expand-Archive -Path ./pyapp-source.zip -DestinationPath .
    # Move the extracted folder to the desired location and rename it
    Move-Item -Path ./pyapp-v* -Destination ./pyapp-latest
    Remove-Item -Path ./pyapp-source.zip
}
# Change the current directory to the extracted folder
Set-Location -Path ./pyapp-latest
cargo build --release
# Move Item and rename it to $env:PYAPP_PROJECT_NAME.exe
Move-Item target\release\pyapp.exe ..\$env:PYAPP_PROJECT_NAME.exe
