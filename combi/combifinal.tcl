# ======================================================================
# Define options
# ======================================================================
 set val(chan)         Channel/WirelessChannel  ;# channel type
 set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
 set val(ant)          Antenna/OmniAntenna      ;# Antenna type
 set val(ll)           LL                       ;# Link layer type
 set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
 set val(ifqlen)       200                      ;# max packet in ifq
 set val(netif)        Phy/WirelessPhy          ;# network interface type
 set val(mac)          Mac/802_11               ;# MAC type
 set val(nn)           40                       ;# number of mobilenodes
 set val(rp)           AODV                     ;# routing protocol
 set val(x)            500
 set val(y)            500
set base_station 	4
 set ns [new Simulator]
#==========================================================================

#==========================================================================
$ns color 0 brown 
set f [open log.tr w]
$ns trace-all $f
set namtrace [open log.nam w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
 
#===========================================================================
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
#===========================================================================
create-god $val(nn)
#===========================================================================
set chan_1 [new $val(chan)]
set chan_2 [new $val(chan)]
set chan_3 [new $val(chan)]
set chan_4 [new $val(chan)]
#===========================================================================
 
# CONFIGURE AND CREATE NODES
 
$ns node-config  -adhocRouting $val(rp) \
                 -llType $val(ll) \
                 -macType $val(mac) \
                 -ifqType $val(ifq) \
                 -ifqLen $val(ifqlen) \
                 -antType $val(ant) \
                 -propType $val(prop) \
                 -phyType $val(netif) \
                 -topoInstance $topo \
		 -energyModel "EnergyModel"\
		 -initialEnergy 90\
		 -txPower 1.175\
	         -rxPower 0.175\
		 -idlePower 1.0\
		 -sensePower 1.00000175\
		 -sleepPower 1.001\
                 -agentTrace ON \
                 -routerTrace ON \
                 -macTrace ON \
                 -movementTrace ON \
                 -channel $chan_1   \
#================================================================================
 proc finish {} {
        global ns f namtrace
        $ns flush-trace
        close $namtrace


        exec nam log.nam &
 
        exit 0
}
#===============================================================================
proc record {} {
  global node-id1 sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink12 sink13 sink14 sink15 sink16 sink17 sink18 sink19 sink20 sink21 sink22 sink23 sink24 sink25 sink26 sink27 sink28 sink29 sink30 sink31 sink32 sink33 sink34 sink35 sink36 sink37 sink38 sink39 sink(BS0) sink(BS1) sink(BS2) sink(BS3) f0
    
 
#Get An Instance Of The Simulator
   set ns [Simulator instance]
    
#Set The Time After Which The Procedure Should Be Called Again
   set time 0.05
 
#Get The Current Time
   set now [$ns now]
    
 
#Re-Schedule The Procedure
   $ns at [expr $now+$time] "record"
  }
#================================================================================
# define color index

for {set i 0} {$i < $base_station } { incr i }	 {
	 set Police_($i) [$ns node]
	 
     set f [expr rand()*499]
     set Police_X1($i) $f
     set f [expr rand()*499]
     set Police_X2($i) $f
     $Police_($i) set X_ $Police_X1($i)
     $Police_($i) set Y_ $Police_X2($i)
     $Police_($i) color green
      
}  

                         
set n(0) [$ns node]
$ns at 0.0 "$n(0) color blue"
$n(0) color red
$n(0) shape "circle"

set n(1) [$ns node]
$ns at 0.0 "$n(1) color red"

$n(1) color red
$n(1) shape "circle"

set n(2) [$ns node]
$ns at 0.0 "$n(2) color darkgreen"
$n(2) color red
$n(2) shape "circle"

set n(3) [$ns node]
$ns at 0.0 "$n(3) color red"
$n(3) color red
$n(3) shape "circle"

set n(4) [$ns node]
$ns at 0.0 "$n(4) color blue"
$n(4) color red
$n(4) shape "circle"
                                                                                                                                             
set n(5) [$ns node]
$ns at 0.0 "$n(5) color red"

$n(5) color red
$n(5) shape "circle"

set n(6) [$ns node]
$ns at 0.0 "$n(6) color red"
$n(6) color red
$n(6) shape "circle"

set n(7) [$ns node]
$ns at 0.0 "$n(7) color red"
$n(7) color red
$n(7) shape "circle"
                                                                                                                                             
set n(8) [$ns node]
$ns at 0.0 "$n(8) color red"
$n(8) color red
$n(8) shape "circle"
                                                                                                                                             
set n(9) [$ns node]
$ns at 0.0 "$n(9) color red"
$n(9) color red
$n(9) shape "circle"
                                                                                                                                             
set n(10) [$ns node]
$ns at 0.0 "$n(10) color red"
$n(10) color red
$n(10) shape "circle"
                                                                                                                                             
set n(11) [$ns node]
$ns at 0.0 "$n(11) color darkgreen"
$n(11) color red
$n(11) shape "circle"

set n(12) [$ns node]
$ns at 0.0 "$n(12) color darkgreen"
$n(12) color red
$n(12) shape "circle"

set n(13) [$ns node]
$ns at 0.0 "$n(13) color red"
$n(13) color red
$n(13) shape "circle"
                                                                                                                                             
set n(14) [$ns node]
$ns at 0.0 "$n(14) color blue"
$n(14) color red
$n(14) shape "circle"    

set n(15) [$ns node]
$ns at 0.0 "$n(15) color blue"
$n(15) color red
$n(15) shape "circle"

set n(16) [$ns node]
$ns at 0.0 "$n(16) color red"
$n(16) color red
$n(16) shape "circle"

set n(17) [$ns node]
$ns at 0.0 "$n(17) color red"
$n(17) color red
$n(17) shape "circle"

set n(18) [$ns node]
$ns at 0.0 "$n(18) color blue"
$n(18) color red
$n(18) shape "circle"

set n(19) [$ns node]
$ns at 0.0 "$n(19) color blue"
$n(19) color red
$n(19) shape "circle"

set n(20) [$ns node]
$ns at 0.0 "$n(20) color darkgreen"
$n(20) color red
$n(20) shape "circle"

set n(21) [$ns node]
$ns at 0.0 "$n(21) color darkgreen"
$n(21) color red
$n(21) shape "circle"

set n(22) [$ns node]
$ns at 0.0 "$n(22) color darkgreen"
$n(22) color red
$n(22) shape "circle"

set n(23) [$ns node]
$ns at 0.0 "$n(23) color red"
$n(23) color red
$n(23) shape "circle"
                                                                                                                                             
set n(24) [$ns node]
$ns at 0.0 "$n(24) color blue"
$n(24) color red
$n(24) shape "circle"    

set n(25) [$ns node]
$ns at 0.0 "$n(25) color blue"
$n(25) color red
$n(25) shape "circle"

set n(26) [$ns node]
$ns at 0.0 "$n(26) color red"
$n(26) color red
$n(26) shape "circle"

set n(27) [$ns node]
$ns at 0.0 "$n(27) color red"
$n(27) color red
$n(27) shape "circle"

set n(28) [$ns node]
$ns at 0.0 "$n(28) color blue"
$n(28) color red
$n(28) shape "circle"

set n(29) [$ns node]
$ns at 0.0 "$n(29) color blue"
$n(29) color red
$n(29) shape "circle"

set n(30) [$ns node]
$ns at 0.0 "$n(30) color darkgreen"
$n(30) color red
$n(30) shape "circle"

set n(31) [$ns node]
$ns at 0.0 "$n(31) color darkgreen"
$n(31) color red
$n(31) shape "circle"

set n(32) [$ns node]
$ns at 0.0 "$n(32) color darkgreen"
$n(32) color red
$n(32) shape "circle"

set n(33) [$ns node]
$ns at 0.0 "$n(33) color red"
$n(33) color red
$n(33) shape "circle"
                                                                                                                                             
set n(34) [$ns node]
$ns at 0.0 "$n(34) color blue"
$n(34) color red
$n(34) shape "circle"    

set n(35) [$ns node]
$ns at 0.0 "$n(35) color blue"
$n(35) color red
$n(35) shape "circle"

set n(36) [$ns node]
$ns at 0.0 "$n(36) color red"
$n(36) color red
$n(36) shape "circle"

set n(37) [$ns node]
$ns at 0.0 "$n(37) color red"
$n(37) color red
$n(37) shape "circle"

set n(38) [$ns node]
$ns at 0.0 "$n(38) color blue"
$n(38) color red
$n(38) shape "circle"

set n(39) [$ns node]
$ns at 0.0 "$n(39) color blue"
$n(39) color red
$n(39) shape "circle"

                                                                                                                  



 
#================================================================================
 
 
 
for {set i 0} {$i < $val(nn)} {incr i} {
        $ns initial_node_pos $n($i) 20+i*10
}

$ns at 0.0 "$Police_(0) setdest 250.0 200.0 10000.0"
$ns at 0.0 "$Police_(1) setdest 250.0 300.0 10000.0"
$ns at 0.0 "$Police_(2) setdest 200.0 250.0 10000.0"
$ns at 0.0 "$Police_(3) setdest 300.0 250.0 10000.0"

#===============================================================================
 
$ns at 0.0 "$n(0) setdest 50.0 50.0 10000.0"
$ns at 0.0 "$n(1) setdest 50.0 150.0 10000.0"
$ns at 0.0 "$n(2) setdest 283.0 262.0 10000.0"
$ns at 0.0 "$n(3) setdest 50.0 350.0 10000.0"
$ns at 0.0 "$n(4) setdest 50.0 450.0 10000.0"


$ns at 0.0 "$n(5) setdest 150.0 50.0 10000.0"
$ns at 0.0 "$n(6) setdest 140.0 136.0 10000.0"
$ns at 0.0 "$n(7) setdest 215.0 321.0 10000.0"
$ns at 0.0 "$n(8) setdest 150.0 350.0 10000.0"
$ns at 0.0 "$n(9) setdest 150.0 450.0 10000.0"

$ns at 0.0 "$n(10) setdest 214.0 199.0 10000.0"
$ns at 0.0 "$n(11) setdest 371.0 265.0 10000.0"
$ns at 0.0 "$n(12) setdest 250.0 250.0 10000.0"
$ns at 0.0 "$n(13) setdest 250.0 5.0.0 10000.0"
$ns at 0.0 "$n(14) setdest 250.0 450.0 10000.0"
$ns at 0.0 "$n(15) setdest 5.0.0 50.0 10000.0"
$ns at 0.0 "$n(16) setdest 5.0.0 150.0 10000.0"
$ns at 0.0 "$n(17) setdest 5.0.0 250.0 10000.0"
$ns at 0.0 "$n(18) setdest 5.0.0 5.0.0 10000.0"
$ns at 0.0 "$n(19) setdest 5.0.0 450.0 10000.0"
$ns at 0.0 "$n(20) setdest 450.0 50.0 10000.0"
$ns at 0.0 "$n(21) setdest 450.0 150.0 10000.0"
$ns at 0.0 "$n(22) setdest 450.0 250.0 10000.0"
$ns at 0.0 "$n(23) setdest 450.0 5.0.0 10000.0"
$ns at 0.0 "$n(24) setdest 450.0 450.0 10000.0"
$ns at 0.0 "$n(25) setdest 0.1 0.1 10000.0"
$ns at 0.0 "$n(26) setdest 450.0 10.0 10000.0"
$ns at 0.0 "$n(27) setdest 499.0 250.0 10000.0"
$ns at 0.0 "$n(28) setdest 499.0 5.0.0 10000.0"
$ns at 0.0 "$n(29) setdest 499.0 150.0 10000.0"
$ns at 0.0 "$n(30) setdest 475.0 50.0 10000.0"
$ns at 0.0 "$n(31) setdest 425.0 150.0 10000.0"
$ns at 0.0 "$n(32) setdest 375.0 250.0 10000.0"
$ns at 0.0 "$n(33) setdest 275.0 5.0.0 10000.0"
$ns at 0.0 "$n(34) setdest 275.0 450.0 10000.0"
$ns at 0.0 "$n(35) setdest 50.1 0.1 10000.0"
$ns at 0.0 "$n(36) setdest 200.0 10.0 10000.0"
$ns at 0.0 "$n(37) setdest 324.0 250.0 10000.0"
$ns at 0.0 "$n(38) setdest 224.0 5.0.0 10000.0"
$ns at 0.0 "$n(39) setdest 349.0 150.0 10000.0"


$ns at 0.0 "$n(0) label SENDER_NODE"
$ns at 0.0 "$n(4) label SENDER_NODE"
$ns at 0.0 "$n(2) label RECEIVER_NODE"
$ns at 0.0 "$n(11) label RECEIVER_NODE"

$ns at 3.1 "$n(0) setdest 450.0 150.0 50.0"
$ns at 3.1 "$n(1) setdest 450.0 50.0 50.0"
$ns at 3.1 "$n(2) setdest 150.0 150.0 50.0"
$ns at 3.1 "$n(3) setdest 50.0 150.0 50.0"
$ns at 3.1 "$n(4) setdest 150.0 50.0 50.0"
$ns at 3.1 "$n(5) setdest 5.0.0 50.0 50.0"
$ns at 3.1 "$n(6) setdest 250.0 50.0 50.0"
$ns at 3.1 "$n(7) setdest 250.0 150.0 50.0"
$ns at 3.1 "$n(8) setdest 50.0 250.0 50.0"
$ns at 3.1 "$n(9) setdest 50.0 50.0 50.0"
$ns at 3.1 "$n(10) setdest 5.0.0 150.0 50.0"
$ns at 3.1 "$n(11) setdest 5.0.0 250.0 50.0"
$ns at 3.1 "$n(12) setdest 250.0 250.0 50.0"
$ns at 3.1 "$n(13) setdest 150.0 250.0 50.0"
$ns at 3.1 "$n(14) setdest 150.0 5.0.0 50.0"
$ns at 3.1 "$n(15) setdest 5.0.0 450.0 50.0"
$ns at 3.1 "$n(16) setdest 450.0 250.0 50.0"
$ns at 3.1 "$n(17) setdest 250.0 5.0.0 50.0"
$ns at 3.1 "$n(18) setdest 250.0 450.0 50.0"
$ns at 3.1 "$n(19) setdest 150.0 450.0 50.0"
$ns at 3.1 "$n(20) setdest 450.0 5.0.0 50.0"
$ns at 3.1 "$n(21) setdest 450.0 450.0 50.0"
$ns at 3.1 "$n(22) setdest 5.0.0 5.0.0 50.0"
$ns at 3.1 "$n(23) setdest 50.0 450.0 50.0"
$ns at 3.1 "$n(24) setdest 50.0 5.0.0 50.0"
$ns at 3.1 "$n(27) setdest 499.0 250.0 50.0"
$ns at 3.1 "$n(28) setdest 499.0 5.0.0 50.0"
$ns at 3.1 "$n(29) setdest 499.0 450.0 50.0"
$ns at 5.0 "$n(30) setdest 475.0 50.0 50.0"
$ns at 5.0 "$n(31) setdest 425.0 150.0 50.0"
$ns at 5.0 "$n(32) setdest 375.0 250.0 50.0"
$ns at 5.0 "$n(33) setdest 275.0 5.0.0 50.0"
$ns at 5.0 "$n(34) setdest 275.0 450.0 50.0"
$ns at 5.0 "$n(35) setdest 50.1 0.1 50.0"
$ns at 5.0 "$n(36) setdest 200.0 10.0 50.0"
$ns at 5.0 "$n(37) setdest 324.0 250.0 50.0"
$ns at 5.0 "$n(38) setdest 224.0 5.0.0 50.0"
$ns at 5.0 "$n(39) setdest 349.0 150.0 50.0"
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                                  
for {set i 0} {$i < $base_station} { incr i } {
    $ns initial_node_pos $Police_($i) 30+i*10
     $ns at 0.0 "$Police_($i) label BASE_STATION"
     $ns at 0.0 "$Police_($i) color blue"
}


#==================================================================================
# CONFIGURE AND SET UP A FLOW
set sink0 [new Agent/LossMonitor]
set sink1 [new Agent/LossMonitor]
set sink2 [new Agent/LossMonitor]
set sink3 [new Agent/LossMonitor]
set sink4 [new Agent/LossMonitor]
set sink5 [new Agent/LossMonitor]
set sink6 [new Agent/LossMonitor]
set sink7 [new Agent/LossMonitor]
set sink8 [new Agent/LossMonitor]
set sink9 [new Agent/LossMonitor]
set sink10 [new Agent/LossMonitor]
set sink11 [new Agent/LossMonitor]
set sink12 [new Agent/LossMonitor]
set sink13 [new Agent/LossMonitor]
set sink14 [new Agent/LossMonitor]
set sink15 [new Agent/LossMonitor]
set sink16 [new Agent/LossMonitor]
set sink17 [new Agent/LossMonitor]
set sink18 [new Agent/LossMonitor]
set sink19 [new Agent/LossMonitor]
set sink20 [new Agent/LossMonitor]
set sink21 [new Agent/LossMonitor]
set sink22 [new Agent/LossMonitor]
set sink23 [new Agent/LossMonitor]
set sink24 [new Agent/LossMonitor]
set sink25 [new Agent/LossMonitor]
set sink26 [new Agent/LossMonitor]
set sink27 [new Agent/LossMonitor]
set sink28 [new Agent/LossMonitor]
set sink29 [new Agent/LossMonitor]
set sink30 [new Agent/LossMonitor]
set sink31 [new Agent/LossMonitor]
set sink32 [new Agent/LossMonitor]
set sink33 [new Agent/LossMonitor]
set sink34 [new Agent/LossMonitor]
set sink35 [new Agent/LossMonitor]
set sink36 [new Agent/LossMonitor]
set sink37 [new Agent/LossMonitor]
set sink38 [new Agent/LossMonitor]
set sink39 [new Agent/LossMonitor]
set sink(B0) [new Agent/LossMonitor]
set sink(B1) [new Agent/LossMonitor]
set sink(B2) [new Agent/LossMonitor]
set sink(B3) [new Agent/LossMonitor]

$ns attach-agent $n(0) $sink0 
#===================================================================================
$ns attach-agent $n(0) $sink0
$ns attach-agent $n(1) $sink1
$ns attach-agent $n(2) $sink2
$ns attach-agent $n(3) $sink3
$ns attach-agent $n(4) $sink4
$ns attach-agent $n(5) $sink5
$ns attach-agent $n(6) $sink6
$ns attach-agent $n(7) $sink7
$ns attach-agent $n(8) $sink8
$ns attach-agent $n(9) $sink9
$ns attach-agent $n(10) $sink10
$ns attach-agent $n(11) $sink11
$ns attach-agent $n(12) $sink12
$ns attach-agent $n(13) $sink13
$ns attach-agent $n(14) $sink14
$ns attach-agent $n(15) $sink15
$ns attach-agent $n(16) $sink16
$ns attach-agent $n(17) $sink17
$ns attach-agent $n(18) $sink18
$ns attach-agent $n(19) $sink19
$ns attach-agent $n(20) $sink20
$ns attach-agent $n(21) $sink21
$ns attach-agent $n(22) $sink22
$ns attach-agent $n(23) $sink23
$ns attach-agent $n(24) $sink24
$ns attach-agent $n(25) $sink25
$ns attach-agent $n(26) $sink26
$ns attach-agent $n(27) $sink27
$ns attach-agent $n(28) $sink28
$ns attach-agent $n(29) $sink29
$ns attach-agent $n(30) $sink30
$ns attach-agent $n(31) $sink31
$ns attach-agent $n(32) $sink32
$ns attach-agent $n(33) $sink33
$ns attach-agent $n(34) $sink34
$ns attach-agent $n(35) $sink35
$ns attach-agent $n(36) $sink36
$ns attach-agent $n(37) $sink37
$ns attach-agent $n(38) $sink38
$ns attach-agent $n(39) $sink39

$ns attach-agent $Police_(0) $sink(B0)
$ns attach-agent $Police_(1) $sink(B1)
$ns attach-agent $Police_(2) $sink(B2)
$ns attach-agent $Police_(3) $sink(B3)

#===================================================================================
#transmission control protocol
set tcp0 [new Agent/TCP]
$ns attach-agent $n(0) $tcp0
set tcp1 [new Agent/TCP]
$ns attach-agent $n(1) $tcp1
set tcp2 [new Agent/TCP]
$ns attach-agent $n(2) $tcp2
set tcp3 [new Agent/TCP]
$ns attach-agent $n(3) $tcp3
set tcp4 [new Agent/TCP]
$ns attach-agent $n(4) $tcp4
set tcp5 [new Agent/TCP]
$ns attach-agent $n(5) $tcp5
set tcp6 [new Agent/TCP]
$ns attach-agent $n(6) $tcp6
                                                                                                                 
set tcp7 [new Agent/TCP]
$ns attach-agent $n(7) $tcp7
set tcp8 [new Agent/TCP]
$ns attach-agent $n(8) $tcp8
set tcp9 [new Agent/TCP]
$ns attach-agent $n(9) $tcp9
set tcp10 [new Agent/TCP]
$ns attach-agent $n(10) $tcp10
set tcp11 [new Agent/TCP]
$ns attach-agent $n(11) $tcp11
set tcp12 [new Agent/TCP]
$ns attach-agent $n(12) $tcp12
set tcp13 [new Agent/TCP]
$ns attach-agent $n(13) $tcp13
set tcp14 [new Agent/TCP]
$ns attach-agent $n(14) $tcp14
set tcp15 [new Agent/TCP]
$ns attach-agent $n(15) $tcp15
set tcp16 [new Agent/TCP]
$ns attach-agent $n(16) $tcp16
set tcp17 [new Agent/TCP]
$ns attach-agent $n(17) $tcp17
set tcp18 [new Agent/TCP]
$ns attach-agent $n(18) $tcp18
set tcp19 [new Agent/TCP]
$ns attach-agent $n(19) $tcp19
set tcp20 [new Agent/TCP]
$ns attach-agent $n(20) $tcp20
set tcp21 [new Agent/TCP]
$ns attach-agent $n(21) $tcp21
set tcp22 [new Agent/TCP]
$ns attach-agent $n(22) $tcp22
set tcp23 [new Agent/TCP]
$ns attach-agent $n(23) $tcp23
set tcp24 [new Agent/TCP]
$ns attach-agent $n(24) $tcp24
set tcp25 [new Agent/TCP]
$ns attach-agent $n(25) $tcp25
set tcp26 [new Agent/TCP]
$ns attach-agent $n(26) $tcp26
set tcp27 [new Agent/TCP]
$ns attach-agent $n(27) $tcp27
set tcp28 [new Agent/TCP]
$ns attach-agent $n(28) $tcp28
set tcp29 [new Agent/TCP]
$ns attach-agent $n(29) $tcp29
set tcp30 [new Agent/TCP]
$ns attach-agent $n(30) $tcp30
set tcp31 [new Agent/TCP]
$ns attach-agent $n(31) $tcp31
set tcp32 [new Agent/TCP]
$ns attach-agent $n(32) $tcp32
set tcp33 [new Agent/TCP]
$ns attach-agent $n(33) $tcp33
set tcp34 [new Agent/TCP]
$ns attach-agent $n(34) $tcp34
set tcp35 [new Agent/TCP]
$ns attach-agent $n(35) $tcp35
set tcp36 [new Agent/TCP]
$ns attach-agent $n(36) $tcp36
set tcp37 [new Agent/TCP]
$ns attach-agent $n(37) $tcp37
set tcp38 [new Agent/TCP]
$ns attach-agent $n(38) $tcp38
set tcp39 [new Agent/TCP]
$ns attach-agent $n(39) $tcp39

set tcpb0 [new Agent/TCP]
$ns attach-agent $Police_(0) $tcpb0
set tcpb1 [new Agent/TCP]
$ns attach-agent $Police_(1) $tcpb1
set tcpb2 [new Agent/TCP]
$ns attach-agent $Police_(2) $tcpb2
set tcpb3 [new Agent/TCP]
$ns attach-agent $Police_(3) $tcpb3

#====================================================================================
 
proc attach-CBR-traffic { node sink size interval } {
   #Get an instance of the simulator
   set ns [Simulator instance]
   #Create a CBR  agent and attach it to the node
   set cbr [new Agent/CBR]
   $ns attach-agent $node $cbr
   $cbr set packetSize_ $size
   $cbr set interval_ $interval
 
   #Attach CBR source to sink;
   $ns connect $cbr $sink
   return $cbr
  }


proc myRand { min max } {
set maxFactor [expr [expr $max + 1] - $min]
set value [expr int([expr rand() * 100])]
set value [expr [expr $value % $maxFactor] + $min]
return $value
}
proc myRand1 {} {
set p [expr int([expr rand() * 100])]
set p [format "%.2f" [expr {double(round($p))/100}]]
return $p
}
set div 0
proc leach {r} {
global val
global div
set p [expr int([expr rand() * 100])]
puts "p:$p"
set p [format "%.2f" [expr {double(round($p))/100}]]
set 1p [expr int([expr {1/$p}])]
puts "p:$p"
puts "1p:$1p"
set r [expr {$r+1}]
puts "r:$r"
set de [expr {($r)%($1p)}]
set de [expr {($p)*($de)}]
set de [expr {(1)-($de)}]
set t [format "%.2f" [expr {($p)/($de)}]]
puts "de:$de"
puts "t:$t"
set ch1 0
set ch1r 0
set ch2 0
set ch2r 0
set ch3 0
set ch3r 0
set ch4 0
set ch4r 0
set div [expr {($val(nn))/4}]
puts "div:$div"
set first 0
set second [expr {$first+$div}]
set third [expr {$second+1}]
set fourth [expr {$third+$div}]
set fifth [expr {$fourth+1}]
set sixth [expr {$fifth+$div}]
set seventh [expr {$sixth+1}]
set final [expr {$val(nn)-$seventh}]
set eighth [expr {$seventh+$final}]
set eighth [expr {$eighth-(1)}]
puts "eighth:$eighth"
while {1} {

set ch1 [myRand $first $second]
puts "ch1:$ch1"
set ch1r [myRand1]
puts "ch1r:$ch1r"
if {$ch1r<$t} {
break;
}
}
while {1} {
set ch2 [myRand $third $fourth]
puts "ch2:$ch2"
set ch2r [myRand1]
puts "ch2r:$ch2r"
if {$ch2r<$t} {
break;
}
}
while {1} {
set ch3 [myRand $fifth $sixth]
puts "ch3:$ch3"
set ch3r [myRand1]
puts "ch3r:$ch3r"
if {$ch3r<$t} {
break;
}
}

while {1} {
set ch4 [myRand $seventh $eighth]
puts "ch4:$ch4"
set ch4r [myRand1]
puts "ch4r:$ch4r"
if {$ch4r<$t} {
break;
}
}
set ans {}
lappend ans $ch1 $ch2 $ch3 $ch4
return $ans
}
#======================================================================================
proc ran {} {
set X 6
set s [myRand 0 1]
set i [expr int([expr rand() * $X])]
set j [expr int([expr rand() * $X])]
set u [expr int([expr rand() * $X])]
set ans {}
lappend ans $s $i $j $u
return $ans
}


proc keygen {val ch1 ch2 ch3 ch4} {
puts "val:$val"

global div
set fid [open txt/base.txt w]
for {set i 0} {$i<$val} {incr i} {
set ans [ran]
puts $fid $ans
}
close $fid
set fid [open "txt/base.txt" r]
set file_data [read $fid]
set fid1 [open "txt/$ch1.txt" w]
set fid2 [open "txt/$ch2.txt" w]
set fid3 [open "txt/$ch3.txt" w]
set fid4 [open "txt/$ch4.txt" w]
set data [split $file_data "\n"]
set count 0
set first 0
set second [expr {$first+$div}]
set third [expr {$second+1}]
set fourth [expr {$third+$div}]
set fifth [expr {$fourth+1}]
set sixth [expr {$fifth+$div}]
set seventh [expr {$sixth+1}]
set final [expr {$val-$seventh}]
set eighth [expr {$seventh+$final}]
set eighth [expr {$eighth-(1)}]
foreach line $data {
if {$count>=$first && $count<=$second} {
puts $fid1 $line
} elseif {$count>=$third && $count<=$fourth} {
puts $fid2 $line
} elseif {$count>=$fifth && $count<=$sixth} {
puts $fid3 $line
} elseif {$count>=$seventh && $count<=$eighth} {
puts $fid4 $line
}
set count [expr {$count+1}]
}
close $fid1
close $fid2
close $fid3
close $fid4
close $fid
set fid1 [open "txt/$ch1.txt" r]
set file_data1 [read $fid1]
set data1 [split $file_data1 "\n"]
set fid2 [open "txt/$ch2.txt" r]
set file_data2 [read $fid2]
set data2 [split $file_data2 "\n"]
set fid3 [open "txt/$ch3.txt" r]
set file_data3 [read $fid3]
set data3 [split $file_data3 "\n"]
set fid4 [open "txt/$ch4.txt" r]
set file_data4 [read $fid4]
set data4 [split $file_data4 "\n"]
set count $first
foreach line $data1 {
if {$count!=$ch1} {
set fid_node [open "txt/$count.txt" w]
puts $fid_node $line
close $fid_node
} else {
set fid_node [open "txt/test.txt" w]
puts $fid_node $line
close $fid_node
}
set count [expr {$count+1}]
}
set fidc [open "txt/test.txt" r]
set file_datac [read $fidc]
set fid_node [open "txt/$ch1.txt" w]
puts $fid_node $file_datac
close $fid_node
close $fidc

set count $third
foreach line $data2 {
if {$count!=$ch2} {
set fid_node [open "txt/$count.txt" w]
puts $fid_node $line
close $fid_node
} else {
set fid_node [open "txt/test.txt" w]
puts $fid_node $line
close $fid_node
}
set count [expr {$count+1}]
}
set fidc [open "txt/test.txt" r]
set file_datac [read $fidc]
set fid_node [open "txt/$ch2.txt" w]
puts $fid_node $file_datac
close $fid_node
close $fidc

set count $fifth
foreach line $data3 {
if {$count!=$ch3} {
set fid_node [open "txt/$count.txt" w]
puts $fid_node $line
close $fid_node
} else {
set fid_node [open "txt/test.txt" w]
puts $fid_node $line
close $fid_node
}
set count [expr {$count+1}]
}
set fidc [open "txt/test.txt" r]
set file_datac [read $fidc]
set fid_node [open "txt/$ch3.txt" w]
puts $fid_node $file_datac
close $fid_node
close $fidc


set count $seventh
foreach line $data4 {
if {$count!=$ch4} {
set fid_node [open "txt/$count.txt" w]
puts $fid_node $line
close $fid_node
} else {
set fid_node [open "txt/test.txt" w]
puts $fid_node $line
close $fid_node
}
set count [expr {$count+1}]
}
set fidc [open "txt/test.txt" r]
set file_datac [read $fidc]
set fid_node [open "txt/$ch4.txt" w]
puts $fid_node $file_datac
close $fid_node
close $fidc
}

proc keydis {i j u i1 j1 u1} {
package require sha1

set q 2
set k 10
if {$u==$u1} {
puts "No Common key"
return 0
} else {
set i_i1 [expr {($i)-($i1)}]
puts "i_i1:$i_i1"
set j_j1 [expr {($j)-($j1)}]
puts "j_j1:$j_j1"
set sec [expr {($j_j1)*(4)}]
puts "sec:$sec"
#set m [expr int([expr rand() * $n])]
set sq [expr int([expr {($i_i1)*($i_i1)}])]
set sum [expr {($sq)+($sec)}]
puts "sum:$sum"
set y [expr {($sum)%($q)}]
puts "y:$y"
set sqr [expr { sqrt($y)}]
puts "ans:$sqr"
if {$sqr} {
set num [expr {($i_i1)+($sqr)}]
set num1 [expr int([expr {($num)/(2)}])]
set x1 [expr {($num1)%($q)}]
set numm [expr {($i_i1)-($sqr)}]
set numm1 [expr int([expr {($numm)/(2)}])]
set x2 [expr {($numm1)%($q)}]
puts "x1:$x1,x2:$x2"
if {($x1<$k)&&($x2<$k)} {
set xab [append ans $x1 $x2]
puts "xab:$xab"
set key [sha1::sha1 $xab]
puts "$key"
return $key

} else {
puts "No common key"
return 0
}
} else {
puts "No common key"
return 0
}
}
}
#======================================================================================
proc readvalue {n1 n2} {
puts "n1:$n1"
puts "n2:$n2"
set fid1 [open "txt/$n1.txt" r]
set fid2 [open "txt/$n2.txt" r]
set file_data1 [read $fid1]
set file_data2 [read $fid2]
puts "filedata1:$file_data1"
set s 0
set i 0
set j 0
set u 0
set s1 0
set i1 0
set j1 0 
set u1 0
set count 0
foreach linec $file_data1 {
set count [expr {$count+1}]
	if {$count==1} {
	set s $linec
	}	
	if {$count==2} {
	set i $linec
	}
	if {$count==3} {
	set j $linec
	}
	if {$count==4} {
	set u $linec
	}
}
set count 0
foreach linec $file_data2 {
set count [expr {$count+1}]
	if {$count==1} {
	set s1 $linec
	}
	if {$count==2} {
	set i1 $linec
	}
	if {$count==3} {
	set j1 $linec
	}
	if {$count==4} {
	set u1 $linec
	}
}
puts "i:$i"
puts "j:$j"
puts "u:$u"
puts "i1:$i1"
puts "j1:$j1"
puts "u1:$u1"
set ans [keydis $i $j $u $i1 $j1 $u1]
return $ans

}

set udp0 [new Agent/UDP]
$ns attach-agent $n(0) $udp0

array set dbans {
    "how are you" "fine"
    "Are you there" "yes"
    "hi" "Thanks"        
    "" "Not Found"
}

set udp1 [new Agent/UDP]




$ns attach-agent $n(1) $udp1
$ns connect $udp0 $udp1
for {set j 0} {$j<$val(nn)} {incr j} {
for {set i 0} {$i<$val(nn)} {incr i} {
set session($j,$i) 0

}

}
puts "sesssion:$session(0,0)"



set udp02 [new Agent/UDP]
set udp2 [new Agent/UDP]
$ns attach-agent $n(0) $udp02
$ns attach-agent $n(2) $udp2
$ns connect $udp02 $udp2

Agent/UDP instproc process_data {size data} {
    global ns
    global udp0
    global udp1
    global udp02
    global udp2
    global dbans
    global session
    $self instvar node_
set tes [$node_ node-addr]
set tes [expr {($tes)-4}]
puts "tes:$tes"
#puts "self:$self node:$node_"
if {$data=="sstart"} {
puts "test"
set session(0,$tes) 1
puts "session0:$session(0,$tes)"
} elseif {$data=="sstop"} {
set session(0,$tes) 0
} else {
puts "test test"
puts "session:$session(0,$tes)"
if {$session(0,$tes)==1} {
puts "test1 test1"
set key [readvalue 0 $tes]
puts "key at udp:$key"
set decrypt [aes::aes -dir decrypt -key $key $data]
set res [string trimright $decrypt \0]
#set res $data
    # note in the trace file that the packet was received
    $ns trace-annotate "[$node_ node-addr] received {$res}"
    set flag1 "0"
    set flag "0"
    foreach db [array names dbans] {
    set str3 [string equal $db $res]
    
    if {$str3 == "1"} {
    set flag "1"
    #set strr []
    set str4 [$node_ node-addr]
puts "str4:$str4"
#set str4 [expr {($str4)-4}]
   puts "str4:$str4"
 #puts "strr:$strr"
#puts "udp:$udp0"
    $ns trace-annotate "Replying correct question for recieved data:{$res}"
    $ns trace-annotate "question: $db answer: $dbans($db)"
    set ans "$dbans($db)"     
puts "testify:$str4"
    switch $str4 {

	
        4 {$ns at 8.0 "$udp0 send 828 replied:$ans"}

        5 {$ns at 8.2 "$udp1 send 828 replied:$ans"}

        6 {$ns at 9.0 "$udp2 send 828 replied:$ans"}

        default {puts "I don't know what the number is"}

    }

    }

}
    set str5 [string equal $flag $flag1]
    
    if {$str5 == "1"} {
    
    $ns trace-annotate "Answer not found in database"
}

}
}

}
#======================================================================================
set r 0
set cluster [leach $r]
set count 0
set ch1 0
set ch2 0
set ch3 0
set ch4 0
foreach linec $cluster {
set count [expr {$count+1}]
	if {$count==1} {
	set ch1 $linec
	}
	if {$count==2} {
	set ch2 $linec
	}
	if {$count==3} {
	set ch3 $linec
	}
	if {$count==4} {
	set ch4 $linec
	}
}
keygen $val(nn) $ch1 $ch2 $ch3 $ch4
puts "ch1main:$ch1"

#puts "node_x:$node_x"  
set sessionstart sstart
$ns at 0.1 "$udp02 send 500 $sessionstart"
#puts "session:$session"
set key [readvalue 0 2]

$ns at 3.0 "$udp02 send 500 sstop"
if {$key!=0} {
puts "key:$key"
package require aes
set fulldata {Are you there}
set encryptedData [aes::aes -dir encrypt -key $key $fulldata]
$ns at 2.0 "$udp02 send 500 $encryptedData"

}


set sessionstart sstart
$ns at 1.0 "$udp0 send 500 $sessionstart"
#puts "session:$session"
set key1 [readvalue 0 1]

$ns at 5.0 "$udp0 send 500 sstop"
if {$key1!=0} {
puts "key1:$key1"
package require aes
set fulldata1 {how are you}
set encryptedData1 [aes::aes -dir encrypt -key $key1 $fulldata1]
$ns at 3.0 "$udp0 send 500 $encryptedData1"
}


set cbr2112 [attach-CBR-traffic $n($ch1) $sink(B0) 800 .03]
set cbr2113 [attach-CBR-traffic $n(4) $sink2 800 .03]
#==========================================================================================
$ns at 0.1 "$cbr2112 start"
$ns at 0.2 "$cbr2113 start"

#=====================================================================================
$ns at 12.0 "finish"
#=====================================================================================

puts "Start of simulation.."
$ns run
#======================================================================================
 

