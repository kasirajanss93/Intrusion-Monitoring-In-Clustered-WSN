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
 set val(nn)           30                       ;# number of mobilenodes
 set val(rp)           AODV                     ;# routing protocol
 set val(x)            500
 set val(y)            500
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
  global node-id1 sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink12 sink13 sink14 sink15 sink16 sink17 sink18 sink19 sink20 sink21 sink22 sink23 sink24 sink25 sink26 sink27 sink28 sink29 sink30 sink31 sink32 sink33 sink34 sink35 sink36 sink37 sink38 sink39 f0
    
 
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
#======================================================================================

set cbr2112 [attach-CBR-traffic $n(0) $sink11 800 .03]
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
 

