
# Export poetry requirements to requirements.txt
poetry export -f requirements.txt --output requirements.txt
# Now set environment variables properly in powershell
$env:PYAPP_PROJECT_VERSION="0.1.0"
$env:PYAPP_PROJECT_NAME="pyappexample"
$env:PYAPP_PROJECT_DEPENDENCY_FILE="./requirements.txt"
$env:CARGO_TARGET_DIR="./target" # For speeding up future builds
$env:PYAPP_EXEC_SCRIPT="./pyappexample/circle.py"
cargo install pyapp
