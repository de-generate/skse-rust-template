@echo off

RMDIR dist /S /Q

cargo build --release
if %ERRORLEVEL% NEQ 0 exit 1

cmake --build --preset vs2022-windows --config Release
if %ERRORLEVEL% NEQ 0 exit 1

xcopy "build\release\*.dll" "dist\SKSE\Plugins\" /I /Y
xcopy "build\release\*.pdb" "dist\SKSE\Plugins\" /I /Y

xcopy "package" "dist" /I /Y /E
