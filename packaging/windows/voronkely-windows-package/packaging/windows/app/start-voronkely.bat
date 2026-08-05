@echo off
setlocal
set APP_DIR=%~dp0
set DATA_DIR=%APPDATA%\Voronkely\data
if not exist "%DATA_DIR%" mkdir "%DATA_DIR%"
cd /d "%APP_DIR%"
java -Djava.awt.headless=false -Duser.dir="%APP_DIR%" -Dspring.datasource.url=jdbc:sqlite:%DATA_DIR%\voronkely.db -jar voronkely.jar
