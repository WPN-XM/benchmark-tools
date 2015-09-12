@echo off

:: +-------------------------------------------------------------------------
:: |
:: | WPN-XM Server Stack - Run Webserver Benchmarks
:: |
:: +-----------------------------------------------------------------------<3

:: stop everything
CALL "stop.bat"

:: start only Nginx and PHP
CALL start.bat nginx
CALL start.bat php

:: define shortcuts to the Apache Benchmark executables
SET AB=%~dp0bin\ab\ab.exe

::
:: Run several benchmarks and store their results to the log folder
::
:: Note: use "127.0.0.1" instead of "localhost" on URLs.
::

echo Running Benchmark - Requesting a HTML file (static)
echo.
%AB% -n 10000 -c 50 -k http://127.0.0.1/tools/benchmark/index.html > %~dp0\logs\benchmark_html.log
echo.
echo Done.

echo.
echo Running Benchmark - Requesting a PHP file (dynamic)
echo.
%AB% -n 10000 -c 50 -k http://127.0.0.1/tools/benchmark/index.php > %~dp0\logs\benchmark_php.log
echo.
echo Done.

echo.
echo Running Benchmark - Requesting an Image file (static)
echo.
%AB% -n 10000 -c 50 -k http://127.0.0.1/tools/benchmark/image.png > %~dp0\logs\benchmark_image.log
echo.
echo Done.

echo.
echo The benchmark results were saved to the %~dp0logs folder.
echo The files are prefixed with benchmark_.
echo.