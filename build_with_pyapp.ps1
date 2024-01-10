# This is supposed to be executed in the root of the project

# The executable will execute this function when it starts
$env:PYAPP_EXEC_SPEC="pyappexample.circle:run"

$executable_name = "pyappexample"

# We are building the wheel with poetry
if (Test-Path -Path "./dist") {
    Remove-Item -Path ./dist -Recurse -Force
}
poetry build
# Get the full path of the wheel file in the dist directory
$wheel_file = (Get-Item -Path "./dist/*.whl").FullName
# Print wheel file path
Write-Host "Wheel file path: $wheel_file"
$env:PYAPP_PROJECT_PATH=$wheel_file

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
# Move Item and rename it to $env:PYAPP_PROJECT_NAME.exe, overwrite if exists
Move-Item target\release\pyapp.exe ..\$executable_name.exe -Force
# Change the current directory to the root of the project
Set-Location -Path ..
