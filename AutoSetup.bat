@echo off
title MicroFix Build & Link System
echo Initializing MicroFix Compilation...
setlocal EnableDelayedExpansion

:: Define key paths
set COMPILER_CPP=g++
set COMPILER_JS=node
set COMPILER_PY=pyinstaller
set COMPILER_SH=bash
set OUT_DIR=MicroFix_Build
set EXECUTABLE=MicroFix_Executable.exe

:: Ensure dependencies are installed
echo Verifying Dependencies...
where g++ >nul 2>nul || echo ERROR: Missing g++ Compiler!
where node >nul 2>nul || echo ERROR: Missing Node.js!
where pyinstaller >nul 2>nul || echo ERROR: Missing PyInstaller!
where bash >nul 2>nul || echo ERROR: Missing Bash!

:: Create output directory
if not exist "!OUT_DIR!" mkdir "!OUT_DIR!"

:: Compile C++ components
echo Compiling C++ Modules...
"!COMPILER_CPP!" AIPoweredDebugging.cpp runtime_call.cel -o "!OUT_DIR!\MicroFix_Core.exe"

:: Compile Python components
echo Bundling Python Utility Scripts...
"!COMPILER_PY!" Specs.py --onefile --distpath "!OUT_DIR!"

:: Compile JavaScript components
echo Transpiling JavaScript Directives...
"!COMPILER_JS!" TransCompiler.js

:: Execute Shell script configurations
echo Running Shell-based Integrations...
"!COMPILER_SH!" Structure.sh

:: Package everything into a final archive
echo Packaging Executable...
copy "!OUT_DIR!\*" "!EXECUTABLE!"

echo ✅ MicroFix Build Process Complete!
echo Executable Generated: "!EXECUTABLE!"
endlocal
