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
 set val(nn)           20                       ;# number of mobilenodes
 set val(rp)           AODV                     ;# routing protocol
 set val(x)            500
 set val(y)            500
 set ns [new Simulator]
#==========================================================================
#
set pam(ak_n) 2;#2 attackers
set pam(ak_ng) 1;#attackers divide into 1 group
set pam(ak_tg) 0;#attackers' groups start time differeces
set pam(ak_rs) 0;#in a ak_ap 0: attackers will not random start, 1: attackers will random start
set pam(ak_pr) 0.5;#Attacker flows' packages rate 0.5Mbps
set pam(ak_ps) 200;#Attacker flows' packages size 200B
set pam(ak_st) 60;#Attacker flows start at 60s
set pam(ak_sp) 100;#Attacker flows stop at 100s
set pam(ak_bp) 40000;
set pam(ak_ap) 40000;
set pam(ak_tp) 1;#1:represents period attack, 2:represents follow tcp cwnd attack
set pam(ak_mw) 5;#for ak_tp 2 ak_nw is the max cwnd that correspond to ak_pr
set pam(ak_cp) 10;#Attacker flows' tcp cwnd check period is 10ms
set pam(ak_spf_mn) 1;#Attacker min spoof address is 1
set pam(ak_spf_mx) 100;#Attacker max spoof address is 100
set pam(ak_spf_lv) 0;#Attacker address spoof level 0:no spoof 1:spoof
set pam(tm_fi) 120;#Simulation finishes at 120s
set pam(ns_db) 1;#0: do not output debug info, 1: output debug info
set pam(ns_of) 3;#ns output file ns_of >=3 o leodos.nam >=2 o leodos.tr leodos_tcp.tr leodos_queue_monitor.tr >=1 o leodos_queue.tr
set pam(li) 0;#the loop index
#      
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
  global node-id1 sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink(12) sink(13) sink(14) sink(15) sink(16) sink(17) sink(18) sink(19) f0
    
 
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
if {$pam(ak_n) > 0 && $pam(ak_ng) > 0 && $pam(ak_pr) > 0 && $pam(ak_ps) > 0 && $pam(ak_bp) > 0 && $pam(ak_ap) > 0} {
	set ak_ngm [expr $pam(ak_n)/$pam(ak_ng)];#number of member per group
	#set ak_dtg [expr $pam(ak_ap)/$pam(ak_ng)/1000.0];
	set ak_dtg [expr $pam(ak_tg)/1000.0];
set n(20) [$ns node]
$ns at 0.0 "$n(20) color red"
$n(20) color red
$n(20) shape square
$ns initial_node_pos $n(20) 20+19*10

set n(21) [$ns node]
$ns at 0.0 "$n(21) color red"
$n(21) color red
$n(21) shape square
$ns initial_node_pos $n(21) 20+30*10
}                                                                                                                



 
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
$ns at 0.0 "$n(20) setdest 121.0.0 50.0 10000.0"
$ns at 0.0 "$n(21) setdest 313.0.0 50.0 10000.0"

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
$ns at 3.1 "$n(20) setdest 211.0.0 50.0 10000.0"
$ns at 3.1 "$n(21) setdest 250.0 250.0 50.0"
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
#====================================================================================

#======================================================================================
proc setAtkSendState {apAtkSendID agUsrSendID} {
	puts "atksendstate1"
	global ns pam n apAtkSend lastAtkSendState
	set usrSendCwnd [$n($agUsrSendID) set cwnd_]
	set nsnow [$ns now]
	set atkSendRate 0
	if {$lastAtkSendState($apAtkSendID) == 0 && $usrSendCwnd>=$pam(ak_mw)} {
		$apAtkSend($apAtkSendID) start	
		set lastAtkSendState($apAtkSendID) 1
		puts "nsnow:$nsnow 0->1"
	}
	if {$lastAtkSendState($apAtkSendID) == 1 && $usrSendCwnd<$pam(ak_mw)} {
		$apAtkSend($apAtkSendID) stop		
		set lastAtkSendState($apAtkSendID) 0
		puts "nsnow:$nsnow 1->0"
	}
}

proc setAtkSendState {apAtkSendID agUsrSendID} {
   puts "atksendstate2"
	global ns pam n apAtkSend lastAtkSendState
	set usrSendCwnd [$n($agUsrSendID) set cwnd_]
	set nsnow [$ns now]
	set atkSendRate 0
	if {$lastAtkSendState($apAtkSendID) == 0 && $usrSendCwnd>=$pam(ak_mw)} {
		$apAtkSend($apAtkSendID) start	
		set lastAtkSendState($apAtkSendID) 1
		puts "nsnow:$nsnow 0->1"
	}
	if {$lastAtkSendState($apAtkSendID) == 1 && $usrSendCwnd<$pam(ak_mw)} {
		$apAtkSend($apAtkSendID) stop		
		set lastAtkSendState($apAtkSendID) 0
		puts "nsnow:$nsnow 1->0"
	}
}

set agAtkSend(0) [new Agent/TCP]
$ns attach-agent $n(20) $agAtkSend(0) 
set apAtkSend(0) [new Application/Traffic/CBR]
$apAtkSend(0) attach-agent $agAtkSend(0) 

set agAtkSend(1) [new Agent/TCP]
$ns attach-agent $n(21) $agAtkSend(1) 
set apAtkSend(1) [new Application/Traffic/CBR]
$apAtkSend(1) attach-agent $agAtkSend(1) 
	
set agAtkRecv(0) [new Agent/Null] 
$ns attach-agent $n(1) $agAtkRecv(0)
$ns connect $agAtkSend(0) $agAtkRecv(0)
$agAtkSend(0) set class_ 2

set agAtkRecv(0) [new Agent/Null] 
$ns attach-agent $n(15) $agAtkRecv(0)
$ns connect $agAtkSend(1) $agAtkRecv(0)
$agAtkSend(0) set class_ 2

proc bottomDivide {n1 n2} {	
	set n1dn2 [expr $n1/$n2]
	return $n1dn2;
}
if {$pam(ak_tp) == 1} {
			puts "test"
			$apAtkSend(0) set rate_ $pam(ak_pr)Mb
			#Loop for period attack
			set ak_ig [bottomDivide $i $ak_ngm];
			for {set it [expr $pam(ak_st)+$ak_ig*$ak_dtg]} {$it < $pam(ak_sp)} {set it [expr $it+$pam(ak_ap)/1000.0]} { 
				set dit 0;
				if {$pam(ak_rs) == 1} {
					set rndint [integer [expr $pam(ak_ap)-$pam(ak_bp)]];
					set dit [expr $rndint/1000.0];
				}
				$ns at [expr $it+$dit] "$apAtkSend(0) start";
				$ns at [expr $it+$dit+$pam(ak_bp)/1000.0] "$apAtkSend(0) stop";
				if {$pam(ns_db)==1} {
					set nsnow [$ns now];
					puts "test3"
					puts "nsnow:$nsnow it:$it dit:$dit i:$i start";
					puts "nsnow:$nsnow it:$it dit:$dit +$pam(ak_bp)/1000.0 i:$i stop";
				}
				
			}
                      
		}
set pam(ak_tp) 2
puts "$pam(ak_tp)"
if {$pam(ak_tp) == 2} {
			puts "test 4"
			$apAtkSend(1) set rate_ $pam(ak_pr)Mb
			#$ns at $pam(ak_st) "$apAtkSend($i) start"
			set lastAtkSendState($i) 0
			#Loop for follow tcp cwnd attack
			for {set it $pam(ak_st)} {$it < $pam(ak_sp)} {set it [expr $it+$pam(ak_cp)/1000.0]} { 
				#setAtkSendState $i 0
				$ns at $it "setAtkSendState 1 15"
                                puts "test"
			}
				for {set it $pam(ak_st)} {$it < $pam(ak_sp)} {set it [expr $it+$pam(ak_cp)/1000.0]} { 
				#setAtkSendState $i 0
				$ns at $it "setAtkSendState 1 15"
                                puts "test"
			}
			$ns at $pam(ak_sp) "$apAtkSend(0) stop"
}
		

#======================================================================================

set cbr2112 [attach-CBR-traffic $n(0) $sink11 800 .03]
set cbr2113 [attach-CBR-traffic $n(4) $sink2 800 .03]

#==========================================================================================

#==========================================================================================
$ns at 0.1 "$cbr2112 start"
$ns at 0.2 "$cbr2113 start"

#=====================================================================================
$ns at 8.0 "finish"
#=====================================================================================

puts "Start of simulation.."
$ns run
#======================================================================================

