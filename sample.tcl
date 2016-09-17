set val(chan)         Channel/WirelessChannel  ;# channel type
set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
set val(ant)          Antenna/OmniAntenna      ;# Antenna type
set val(ll)           LL                       ;# Link layer type
set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
set val(ifqlen)       200                       ;# max packet in ifq
set val(netif)        Phy/WirelessPhy          ;# network interface type
set val(mac)          Mac/802_11               ;# MAC type
set val(rp)           AODV                     ;# ad-hoc routing protocol 
set val(nn)           40                        ;# number of mobilenodes
set val(stop)         150.0                        ;# number of mobilenodes
set val(x) 500
set val(y) 500
set ns [new Simulator]
set tracefd [open sample.tr w]
set namtrace [open sample.nam w]
$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)           
set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)
  $ns node-config -adhocRouting $val(rp) \
                         -llType $val(ll) \
                         -macType $val(mac) \
                         -ifqType $val(ifq) \
                         -ifqLen $val(ifqlen) \
                         -antType $val(ant) \
                         -propType $val(prop) \
                         -phyType $val(netif) \
                         -topoInstance $topo \
			 -energyModel "EnergyModel"\
			 -initialEnergy 0.5\
		         -txPower 1.0\
			 -rxPower 1.0\
			 -idlePower 1.0\
			 -sleepPower 0.001\
			 -transitionPower 0.2\
			 -transitionTime 0.005\
                         -channelType $val(chan) \
                         -agentTrace ON \
                         -routerTrace ON \
                         -macTrace ON \
                         -movementTrace ON 
			 
#================================================================================
 proc finish {} {
        global ns tracefd namtrace
        $ns flush-trace
        close $namtrace
        exec nam sample.nam &
        exit 0
}
#===============================================================================
proc record {} {
  global node-id1 sink(0) sink(1) sink(2) sink(3) sink(4) sink(5) sink(6) sink(7) sink(8) sink(9) sink(10) sink(11) sink(12) sink(13) sink(14) sink(15) sink(16) sink(17) sink(18) sink(19) sink(20) sink(21) sink(22) sink(23) sink(24) sink(25) sink(26) sink(27) sink(28) sink(29) sink(30) sink(31) sink(32) sink(33) sink(34) sink(35) sink(36) sink(37) sink(38) sink(39) f0   
 
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
for {set i 0} {$i < $val(nn)} { incr i } {
set n($i) [$ns node]
$n($i) random-motion 0  ;# disable random motion
$n($i) color red
$ns initial_node_pos $n($i) 15+i*10
$ns at 0.0 "$n($i) label nodes"
}

$ns at 0.0 "$n(0) setdest 50.0 50.0 10000.0"
$ns at 0.0 "$n(1) setdest 50.0 150.0 10000.0"
$ns at 0.0 "$n(2) setdest 50.0 250.0 10000.0"
$ns at 0.0 "$n(3) setdest 50.0 5.0.0 10000.0"
$ns at 0.0 "$n(4) setdest 50.0 450.0 10000.0"
$ns at 0.0 "$n(5) setdest 150.0 50.0 10000.0"
$ns at 0.0 "$n(6) setdest 150.0 150.0 10000.0"
$ns at 0.0 "$n(7) setdest 150.0 250.0 10000.0"
$ns at 0.0 "$n(8) setdest 150.0 5.0.0 10000.0"
$ns at 0.0 "$n(9) setdest 150.0 450.0 10000.0"
$ns at 0.0 "$n(10) setdest 250.0 50.0 10000.0"
$ns at 0.0 "$n(11) setdest 250.0 150.0 10000.0"
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

$ns at 0.3 "$n(1) setdest 50.0 50.0 50.0"
$ns at 0.3 "$n(5) setdest 50.0 150.0 50.0"
$ns at 0.3 "$n(6) setdest 50.0 250.0 50.0"
$ns at 0.3 "$n(4) setdest 50.0 5.0.0 50.0"
$ns at 0.3 "$n(9) setdest 50.0 450.0 50.0"
$ns at 0.3 "$n(7) setdest 150.0 499.0 50.0"
$ns at 0.3 "$n(0) setdest 150.0 50.0 50.0"
$ns at 0.3 "$n(10) setdest 150.0 150.0 50.0"
$ns at 0.3 "$n(2) setdest 150.0 5.0.0 50.0"
$ns at 0.3 "$n(3) setdest 150.0 450.0 50.0"
$ns at 0.3 "$n(16) setdest 250.0 50.0 50.0"
$ns at 0.3 "$n(8) setdest 250.0 450.0 50.0"
$ns at 0.3 "$n(20) setdest 5.0.0 50.0 50.0"
$ns at 0.3 "$n(22) setdest 5.0.0 150.0 50.0"
$ns at 0.3 "$n(14) setdest 5.0.0 5.0.0 50.0"
$ns at 0.3 "$n(24) setdest 5.0.0 450.0 50.0"
$ns at 0.3 "$n(21) setdest 450.0 50.0 50.0"
$ns at 0.3 "$n(15) setdest 450.0 150.0 50.0"
$ns at 0.3 "$n(18) setdest 450.0 250.0 50.0"
$ns at 0.3 "$n(19) setdest 450.0 5.0.0 50.0"
$ns at 0.3 "$n(23) setdest 450.0 450.0 50.0"
$ns at 0.3 "$n(27) setdest 450.0 250.0 50.0"
$ns at 0.3 "$n(28) setdest 275.0 5.0.0 50.0"
$ns at 0.3 "$n(29) setdest 325.0 450.0 50.0"
$ns at 0.3 "$n(30) setdest 450.0 50.0 50.0"
$ns at 0.3 "$n(31) setdest 275.0 150.0 50.0"
$ns at 0.3 "$n(32) setdest 325.0 250.0 50.0"
$ns at 0.3 "$n(33) setdest 375.0 5.0.0 50.0"
$ns at 0.3 "$n(34) setdest 425.0 450.0 50.0"
$ns at 0.3 "$n(35) setdest 475.1 0.1 50.0"
$ns at 0.3 "$n(36) setdest 450.0 10.0 50.0"
$ns at 0.3 "$n(37) setdest 349.0 270.0 50.0"
$ns at 0.3 "$n(38) setdest 449.0 374.0 50.0"
$ns at 0.3 "$n(39) setdest 424.0 5.0.0 50.0"

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
#==================================================================================
# CONFIGURE AND SET UP A FLOW
set sink(0) [new Agent/LossMonitor]
set sink(1) [new Agent/LossMonitor]
set sink(2) [new Agent/LossMonitor]
set sink(3) [new Agent/LossMonitor]
set sink(4) [new Agent/LossMonitor]
set sink(5) [new Agent/LossMonitor]
set sink(6) [new Agent/LossMonitor]
set sink(7) [new Agent/LossMonitor]
set sink(8) [new Agent/LossMonitor]
set sink(9) [new Agent/LossMonitor]
set sink(10) [new Agent/LossMonitor]
set sink(11) [new Agent/LossMonitor]
set sink(12) [new Agent/LossMonitor]
set sink(13) [new Agent/LossMonitor]
set sink(14) [new Agent/LossMonitor]
set sink(15) [new Agent/LossMonitor]
set sink(16) [new Agent/LossMonitor]
set sink(17) [new Agent/LossMonitor]
set sink(18) [new Agent/LossMonitor]
set sink(19) [new Agent/LossMonitor]
set sink(20) [new Agent/LossMonitor]
set sink(21) [new Agent/LossMonitor]
set sink(22) [new Agent/LossMonitor]
set sink(23) [new Agent/LossMonitor]
set sink(24) [new Agent/LossMonitor]
set sink(25) [new Agent/LossMonitor]
set sink(26) [new Agent/LossMonitor]      
set sink(27) [new Agent/LossMonitor]
set sink(28) [new Agent/LossMonitor]
set sink(29) [new Agent/LossMonitor]
set sink(30) [new Agent/LossMonitor]
set sink(31) [new Agent/LossMonitor]
set sink(32) [new Agent/LossMonitor]
set sink(33) [new Agent/LossMonitor]
set sink(34) [new Agent/LossMonitor]
set sink(35) [new Agent/LossMonitor]
set sink(36) [new Agent/LossMonitor]
set sink(37) [new Agent/LossMonitor]
set sink(38) [new Agent/LossMonitor]
set sink(39) [new Agent/LossMonitor]
                                                                                                                                      
#===================================================================================
$ns attach-agent $n(0) $sink(0)
$ns attach-agent $n(1) $sink(1)
$ns attach-agent $n(2) $sink(2)
$ns attach-agent $n(3) $sink(3)
$ns attach-agent $n(4) $sink(4)
$ns attach-agent $n(5) $sink(5)
$ns attach-agent $n(6) $sink(6)
$ns attach-agent $n(7) $sink(7)
$ns attach-agent $n(8) $sink(8)
$ns attach-agent $n(9) $sink(9)
$ns attach-agent $n(10) $sink(10)
$ns attach-agent $n(11) $sink(11)
$ns attach-agent $n(12) $sink(12)
$ns attach-agent $n(13) $sink(13)
$ns attach-agent $n(14) $sink(14)
$ns attach-agent $n(15) $sink(15)
$ns attach-agent $n(16) $sink(16)
$ns attach-agent $n(17) $sink(17)
$ns attach-agent $n(18) $sink(18)
$ns attach-agent $n(19) $sink(19)
$ns attach-agent $n(20) $sink(20)
$ns attach-agent $n(21) $sink(21)
$ns attach-agent $n(22) $sink(22)
$ns attach-agent $n(23) $sink(23)
$ns attach-agent $n(24) $sink(24)
$ns attach-agent $n(25) $sink(25)
$ns attach-agent $n(26) $sink(26)
$ns attach-agent $n(27) $sink(27)
$ns attach-agent $n(28) $sink(28)
$ns attach-agent $n(29) $sink(29)
$ns attach-agent $n(30) $sink(30)
$ns attach-agent $n(31) $sink(31)
$ns attach-agent $n(32) $sink(32)
$ns attach-agent $n(33) $sink(33)
$ns attach-agent $n(34) $sink(34)
$ns attach-agent $n(35) $sink(35)
$ns attach-agent $n(36) $sink(36)
$ns attach-agent $n(37) $sink(37)
$ns attach-agent $n(38) $sink(38)
$ns attach-agent $n(39) $sink(39)
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


set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $tcp0
$cbr1 set type_ CBR
$cbr1 set packet_size_ 1000
$cbr1 set rate_ 1mb
$cbr1 set random_ false
$ns connect $tcp0 $sink(1)
$ns at 0.1 "$cbr1 start"

set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $tcp2
$cbr2 set type_ CBR
$cbr2 set packet_size_ 1000
$cbr2 set rate_ 1mb
$cbr2 set random_ false
$ns connect $tcp2 $sink(3)
$ns at 0.2 "$cbr2 start"
#=====================================================================================
$ns at 5.0 "finish"
#=====================================================================================
#======================================================================================

$ns run 
#======================================================================================

