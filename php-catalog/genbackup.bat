@REM Batch script to create a backup of all source files
@REM You may use another archivator, not necessary RAR
@echo off
erase Data.rar
"%ProgramW6432%\WinRAR\Rar.exe" a Data.rar @list1
