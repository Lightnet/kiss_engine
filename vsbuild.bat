@echo off
call "%VS140COMNTOOLS%\vsvars32.bat" && scons mode=release
REM pause