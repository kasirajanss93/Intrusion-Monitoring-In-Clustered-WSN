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
 set val(nn)           12                       ;# number of mobilenodes
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
                 -agentTrace ON \
                 -routerTrace ON \
                 -macTrace ON \
                 -movementTrace OFF \
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
  global node-id1 sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 f0
    
 
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


$ns at 0.0 "$n(0) label SENDER_NODE"

$ns at 0.0 "$n(4) label SENDER_NODE"
$ns at 0.0 "$n(2) label RECEIVER_NODE"
$ns at 0.0 "$n(11) label RECEIVER_NODE"


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

set cbr2112 [attach-CBR-traffic $n(0) $sink11 500 .03]
set cbr2113 [attach-CBR-traffic $n(4) $sink2 500 .03]
#==========================================================================================
  

$ns at 0.1 "$cbr2112 start"
$ns at 0.2 "$cbr2113 start"

#=====================================================================================
$ns at 8.0 "finish"
#=====================================================================================

puts "Start of simulation.."
$ns run
#======================================================================================
 

