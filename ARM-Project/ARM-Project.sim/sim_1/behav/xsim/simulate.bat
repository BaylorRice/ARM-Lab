@echo off
REM ****************************************************************************
REM Vivado (TM) v2021.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Feb 01 16:43:09 -0600 2024
REM SW Build 3367213 on Tue Oct 19 02:48:09 MDT 2021
REM
REM IP Build 3369179 on Thu Oct 21 08:25:16 MDT 2021
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim iFetch_test_behav -key {Behavioral:sim_1:Functional:iFetch_test} -tclbatch iFetch_test.tcl -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/register_test_behav.wcfg -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/adder_test_behav.wcfg -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/mux_test_behav.wcfg -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/instr_mem_test_behav.wcfg -log simulate.log"
call xsim  iFetch_test_behav -key {Behavioral:sim_1:Functional:iFetch_test} -tclbatch iFetch_test.tcl -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/register_test_behav.wcfg -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/adder_test_behav.wcfg -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/mux_test_behav.wcfg -view C:/Users/reese_ford1/Documents/GitHub/ARM-Lab/ARM-Project/instr_mem_test_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
