#!/bin/bash
xgraph -bg white -x time -y delay -lw 3 -t average_delay delay.tr
xgraph -bg white -x time -y pdr -lw 3 -t pdr pdr.tr
