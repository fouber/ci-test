@echo off
set root=%~dp0%
%root%..\node_modules\.bin\mocha  %root%ut --recursive -R spec