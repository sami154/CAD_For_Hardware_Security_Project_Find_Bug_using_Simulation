#!/usr/bin/bash


vcs -sverilog ../buggyAES_Netlist/*.v ../designLibrary/GSCLib_3.0.v ./tb_aes_1b.sv -R +v2k -debug_access+r -full64 -timescale=1ns/1ps

