@echo off

rem General settings (you may want to adapt this)
rem MinGW
set MINGW_X86_ROOT=C:\MinGW64
set MINGW_X64_ROOT=C:\MinGW64
set MINGW_VERSION=mgw47

rem MSVC
set MSVC_VERSION=vc100

rem Boost
set BOOST_MINGW_X86_ROOT=C:\Boost
set BOOST_MINGW_X64_ROOT=C:\Boost-x64
set BOOST_MSVC_X86_ROOT=C:\Boost-VC
set BOOST_MSVC_X64_ROOT=C:\Boost-VC-x64
set BOOST_VERSION=1_53

rem OpenSSL
set OPENSSL_MINGW_X86_ROOT=C:\OpenSSL
set OPENSSL_MINGW_X64_ROOT=C:\OpenSSL-x64
set OPENSSL_MSVC_X86_ROOT=C:\OpenSSL-VC
set OPENSSL_MSVC_X64_ROOT=C:\OpenSSL-VC-x64

rem iconv
set ICONV_MINGW_X86_ROOT=C:\iconv
set ICONV_MINGW_X64_ROOT=C:\iconv-x64
set ICONV_MSVC_X86_ROOT=C:\iconv-VC
set ICONV_MSVC_X64_ROOT=C:\iconv-VC-x64

rem cURL
set CURL_MINGW_X86_ROOT=C:\cURL
set CURL_MINGW_X64_ROOT=C:\cURL-x64
set CURL_MSVC_X86_ROOT=C:\cURL-VC
set CURL_MSVC_X64_ROOT=C:\cURL-VC-x64

rem Get the root directory
set FREELAN_ALL_ROOT=%~dp0..\..

rem BUILD_ROOT is a directory which contains include, lib and bin sub-directories.
set FREELAN_BUILD_ROOT=%FREELAN_ALL_ROOT%\build

rem INSTALL_ROOT is a directory which contains include, lib and bin sub-directories.
set FREELAN_INSTALL_ROOT=%FREELAN_ALL_ROOT%\install

rem Create the compilers subdirectories
set FREELAN_MINGW_BUILD_ROOT=%FREELAN_BUILD_ROOT%\mingw
set FREELAN_MSVC_BUILD_ROOT=%FREELAN_BUILD_ROOT%\msvc
set FREELAN_MINGW_INSTALL_ROOT=%FREELAN_INSTALL_ROOT%\mingw
set FREELAN_MSVC_INSTALL_ROOT=%FREELAN_INSTALL_ROOT%\msvc

rem Create the architectures subdirectories
set FREELAN_MINGW_X86_BUILD_ROOT=%FREELAN_MINGW_BUILD_ROOT%\x86
set FREELAN_MINGW_X64_BUILD_ROOT=%FREELAN_MINGW_BUILD_ROOT%\x64
set FREELAN_MSVC_X86_BUILD_ROOT=%FREELAN_MSVC_BUILD_ROOT%\x86
set FREELAN_MSVC_X64_BUILD_ROOT=%FREELAN_MSVC_BUILD_ROOT%\x64
set FREELAN_MINGW_X86_INSTALL_ROOT=%FREELAN_MINGW_INSTALL_ROOT%\x86
set FREELAN_MINGW_X64_INSTALL_ROOT=%FREELAN_MINGW_INSTALL_ROOT%\x64
set FREELAN_MSVC_X86_INSTALL_ROOT=%FREELAN_MSVC_INSTALL_ROOT%\x86
set FREELAN_MSVC_X64_INSTALL_ROOT=%FREELAN_MSVC_INSTALL_ROOT%\x64

if "%1" == "" goto x86
if not "%2" == "" goto usage

if /i %1 == x86 goto x86
if /i %1 == amd64 goto amd64
if /i %1 == x64 goto amd64
goto usage

:x86
title freelan x86 environment
set FREELAN_ARCH=x86
set FREELAN_MINGW_BUILD_PREFIX=%FREELAN_MINGW_X86_BUILD_ROOT%
set FREELAN_MSVC_BUILD_PREFIX=%FREELAN_MSVC_X86_BUILD_ROOT%
set FREELAN_MINGW_INSTALL_PREFIX=%FREELAN_MINGW_X86_INSTALL_ROOT%
set FREELAN_MSVC_INSTALL_PREFIX=%FREELAN_MSVC_X86_INSTALL_ROOT%
set CPLUS_INCLUDE_PATH=%CPLUS_INCLUDE_PATH%;%BOOST_MINGW_X86_ROOT%\include\boost-%BOOST_VERSION%;%OPENSSL_MINGW_X86_ROOT%\include;%ICONV_MINGW_X86_ROOT%\include;%CURL_MINGW_X86_ROOT%\include
set LIBRARY_PATH=%LIBRARY_PATH%;%BOOST_MINGW_X86_ROOT%\lib;%OPENSSL_MINGW_X86_ROOT%\lib;%ICONV_MINGW_X86_ROOT%\lib;%CURL_MINGW_X86_ROOT%\lib
set INCLUDE=%INCLUDE%;%BOOST_MSVC_X86_ROOT%\include\boost-%BOOST_VERSION%;%OPENSSL_MSVC_X86_ROOT%\include;%ICONV_MSVC_X86_ROOT%\include;%CURL_MSVC_X86_ROOT%\include;%FREELAN_MSVC_INSTALL_PREFIX%\include
set LIB=%LIB%;%BOOST_MSVC_X86_ROOT%\lib;%OPENSSL_MSVC_X86_ROOT%\lib;%ICONV_MSVC_X86_ROOT%\lib;%CURL_MSVC_X86_ROOT%\lib;%FREELAN_MSVC_INSTALL_PREFIX%\lib
set PROMPT=[freelan-x86] $P$G
set PATH=%OPENSSL_MINGW_X86_ROOT%\bin;%CURL_MINGW_X86_ROOT%\bin;%ICONV_MINGW_X86_ROOT%\bin;%PATH%
call %MINGW_X86_ROOT%\mingwvars.bat
echo x86 environment loaded.
goto :common

:amd64
title freelan amd64 environment
set FREELAN_ARCH=amd64
set FREELAN_MINGW_BUILD_PREFIX=%FREELAN_MINGW_X64_BUILD_ROOT%
set FREELAN_MSVC_BUILD_PREFIX=%FREELAN_MSVC_X64_BUILD_ROOT%
set FREELAN_MINGW_INSTALL_PREFIX=%FREELAN_MINGW_X64_INSTALL_ROOT%
set FREELAN_MSVC_INSTALL_PREFIX=%FREELAN_MSVC_X64_INSTALL_ROOT%
set CPLUS_INCLUDE_PATH=%CPLUS_INCLUDE_PATH%;%BOOST_MINGW_X64_ROOT%\include\boost-%BOOST_VERSION%;%OPENSSL_MINGW_X64_ROOT%\include;%ICONV_MINGW_X64_ROOT%\include;%CURL_MINGW_X64_ROOT%\include
set LIBRARY_PATH=%LIBRARY_PATH%;%BOOST_MINGW_X64_ROOT%\lib;%OPENSSL_MINGW_X64_ROOT%\lib;%ICONV_MINGW_X64_ROOT%\lib;%CURL_MINGW_X64_ROOT%\lib
set INCLUDE=%INCLUDE%;%BOOST_MSVC_X64_ROOT%\include\boost-%BOOST_VERSION%;%OPENSSL_MSVC_X64_ROOT%\include;%ICONV_MSVC_X64_ROOT%\include;%CURL_MSVC_X64_ROOT%\include;%FREELAN_MSVC_INSTALL_PREFIX%\include
set LIB=%LIB%;%BOOST_MSVC_X64_ROOT%\lib;%OPENSSL_MSVC_X64_ROOT%\lib;%ICONV_MSVC_X64_ROOT%\lib;%CURL_MSVC_X64_ROOT%\lib;%FREELAN_MSVC_INSTALL_PREFIX%\lib
set PROMPT=[freelan-x64] $P$G
set PATH=%OPENSSL_MINGW_X64_ROOT%\bin;%CURL_MINGW_X64_ROOT%\bin;%ICONV_MINGW_X64_ROOT%\bin;%PATH%
call %MINGW_X64_ROOT%\mingwvars.bat
echo amd64 environment loaded.
goto :common

:usage
echo You must specify a target platform. Either x86 or x64.
goto :eof

:common
rem Default toolset is set to mingw
set FREELAN_TOOLSET=mingw
set FREELAN_MINGW_RELEASE_BOOST_SUFFIX=-%MINGW_VERSION%-mt-%BOOST_VERSION%
set FREELAN_MINGW_DEBUG_BOOST_SUFFIX=-%MINGW_VERSION%-mt-d-%BOOST_VERSION%
set FREELAN_MSVC_RELEASE_BOOST_PREFIX=lib
set FREELAN_MSVC_RELEASE_BOOST_SUFFIX=-%MSVC_VERSION%-mt-%BOOST_VERSION%
set FREELAN_MSVC_DEBUG_BOOST_SUFFIX=-%MSVC_VERSION%-mt-gd-%BOOST_VERSION%
set FREELAN_SERVER_CONFIGURATION_FILE=%FREELAN_ALL_ROOT%\tools\server\freelan-server.cfg
:eof