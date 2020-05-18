@echo off
@setlocal enableextensions enabledelayedexpansion

SET null=0
for /F %%i in ('Dir *.* /B') do ( 
	SET var=%%i
	if "!var!" == ".git" (
		SET null=0
	) else if "!var!" == ".gitattributes" (
		SET null=0
	) else if "!var!" == ".gitignore" (
		SET null=0
	) else if "!var!" == "Atlas300MultiRtspSsd.pro" (
		SET null=0
	) else if "!var!" == "Atlas300MultiRtspSsd.pro.user" (
		SET null=0
	) else if "!var!" == "data" (
		SET null=0
	) else if "!var!" == "config" (
		SET null=0
	) else if "!var!" == "graph.config" (
		SET null=0
	) else if "!var!" == "libs" (
		SET null=0
	) else if "!var!" == "libs_arm" (
		SET null=0
	) else if "!var!" == "run.sh" (
		SET null=0
	) else (
		echo !var!
		scp -i C:\Users\zxsj_wtxu\.ssh\id_rsa -r %%i "HwHiAiUser@111.160.23.205:/home/HwHiAiUser/wtxu/GateWayShanghai"
	)		
)
ssh -i C:\Users\zxsj_wtxu\.ssh\id_rsa HwHiAiUser@111.160.23.205 "cd /home/HwHiAiUser/wtxu/GateWayShanghai;sed -i 's/\r//g' Common/scripts/build_tools.sh"
::ssh -i C:\Users\zxsj_wtxu\.ssh\id_rsa HwHiAiUser@111.160.23.205 "sed -i 's/#add_definitions(-DC32B082)/add_definitions(-DC32B082)/g' /home/HwHiAiUser/wtxu/GateWayShanghai/build/CMakeLists.txt"
ssh -i C:\Users\zxsj_wtxu\.ssh\id_rsa HwHiAiUser@111.160.23.205 "sed -i 's/aarch64-linux-gcc7.3.0/aarch64-linux-gcc6.3/g' /home/HwHiAiUser/wtxu/GateWayShanghai/CMake/Ascend.cmake"
ssh -i C:\Users\zxsj_wtxu\.ssh\id_rsa HwHiAiUser@111.160.23.205 "cd /home/HwHiAiUser/wtxu/GateWayShanghai;./run.sh"
pause