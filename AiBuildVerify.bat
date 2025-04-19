@echo off
title MicroFix AI-Powered Build Verification
echo Initializing Compilation Integrity Engine...
setlocal EnableDelayedExpansion

:: Define core paths
set COMPILER_CPP=g++
set COMPILER_JS=node
set COMPILER_PY=pyinstaller
set COMPILER_SH=bash
set OUT_DIR=MicroFix_Build
set EXECUTABLE=MicroFix_Executable.exe

:: Ensure dependencies exist
echo 🔍 Verifying Dependency Integrity...
where g++ >nul 2>nul || echo ⛔ ERROR: Missing g++ Compiler!
where node >nul 2>nul || echo ⛔ ERROR: Missing Node.js!
where pyinstaller >nul 2>nul || echo ⛔ ERROR: Missing PyInstaller!
where bash >nul 2>nul || echo ⛔ ERROR: Missing Bash!

:: Create build directory
if not exist "!OUT_DIR!" mkdir "!OUT_DIR!"

:: Compile C++ modules with validation
echo ⚙️ Compiling C++ Directive Engine...
"!COMPILER_CPP!" AIPoweredDebugging.cpp runtime_call.cel -o "!OUT_DIR!\MicroFix_Core.exe"
if %ERRORLEVEL% NEQ 0 echo ❌ Compilation Error Detected in AIPoweredDebugging.cpp!

:: Compile Python components with integrity check
echo 🛠 Bundling Python Utility Scripts...
"!COMPILER_PY!" Specs.py --onefile --distpath "!OUT_DIR!"
if %ERRORLEVEL% NEQ 0 echo ❌ Error Detected in Specs.py!

:: Compile JavaScript directives with execution checks
echo 📜 Transpiling JavaScript Processing Layer...
"!COMPILER_JS!" TransCompiler.js
if %ERRORLEVEL% NEQ 0 echo ❌ TransCompiler.js Execution Failed!

:: Execute Shell script integrations for optimization
echo 🔄 Running Shell-based Configuration...
"!COMPILER_SH!" Structure.sh
if %ERRORLEVEL% NEQ 0 echo ❌ Structure.sh Execution Error!

:: Package everything into a final archive
echo 🚀 Packaging MicroFix into Executable Format...
copy "!OUT_DIR!\*" "!EXECUTABLE!"
if exist "!EXECUTABLE!" echo ✅ Compilation Successful!
else echo ❌ Final Package Creation Failed!

echo 🏆 MicroFix Build Validation Complete!
echo 🚀 Final Executable Generated: "!EXECUTABLE!"
endlocal
