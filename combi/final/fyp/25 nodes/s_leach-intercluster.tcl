

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
 set val(nn)           25                       ;# number of mobilenodes
 set val(rp)           AODV                     ;# routing protocol
 set val(x)            500
 set val(y)            500
set base_station 	4
 set ns [new Simulator]
#==========================================================================

proc gcd {a b} {
if {$b==0} {
return $a
} else {
set x [expr {($a)%($b)}]
return [gcd $b $x]
}
}

proc isprime {a} {
set con [expr {($a)/(2)}]
set flag 0
for {set i 2} {$i<$con} {incr i} {
if {$a%$i==0} { 
set flag 1
}
}
if { $flag==0 } { 
return 1
}
}


proc rsa {} {
set primep 0
while {$primep!=1 } {
set p [expr int([expr rand() * 1000])]
if {$p!=0&&$p!=1} {
set primep [isprime $p]
} 
}
#puts "p:$p"
set primeq 0
while {$primeq!=1 } {
set q [expr int([expr rand() * 1000])]
if {$q!=0&&$q!=1} {
set primeq [isprime $q]
}
}
#puts "q:$q"

set n [expr {$p*$q}]
set phi [expr {($p-1)*($q-1)}]
#puts "phi:$phi"

set ans 0
set primee 0
while {$ans!=1} {
while {$primee!=1 } {
set e [expr int([expr rand() * $phi])]
set primee [isprime $e] 
}

set ans [gcd $e $phi]
}
#puts "ans:$ans"
#puts "e:$e"
set d 1
set s 0
while {$s!=1} {
set de [expr {$d*$e}]
set s [expr {($de)%($phi)}]
set d [expr {$d+1}]
}
set d [expr {$d-1}]
#puts "d:$d"
#puts "e:$e"
set m [expr int([expr rand() * $n])]
#puts "m:$m"
set c 1
for {set i 0} {$i<$e} {incr i} {
set c [expr {([expr {($c)*($m)}])%($n)}]

}
set c [expr {$c%$n}]
#puts "c:$c"

set p 1
for {set i 0} {$i<$d} {incr i} {
set p [expr {([expr {($p)*($c)}])%($n)}]

}
set p [expr {$p%$n}]

#puts "p:$p"
set ans {}
lappend ans $m $e $c $n $phi
return $ans
}

set fid2 [open txt/base.txt w]

for {set i 0} {$i<$val(nn)} {incr i} {
set rsanode($i) 0
set ans [rsa]
#puts "message:$ans"
set count 0
set ec {}
foreach s_el $ans {
set count [expr {$count+1}]
if {$count==1} {
#puts $s_el
set rsanode($i) $s_el
} elseif {$count==2} {
#puts "2:$s_el"
lappend ec $s_el
} elseif {$count==3} {
#puts "3:$s_el"
lappend ec $s_el
} elseif {$count==4} {
#puts "4:$s_el"
lappend ec $s_el
} elseif {$count==5} {
#puts "4:$s_el"
lappend ec $s_el
puts $fid2 $ec
}
}
#
#puts -nonewline "$e"
}
close $fid2


proc decrypt {e phi c n} {
set d 1
set s 0
while {$s!=1} {
set de [expr {$d*$e}]
set s [expr {($de)%($phi)}]
set d [expr {$d+1}]
}
set d [expr {$d-1}]
set p 1
for {set i 0} {$i<$d} {incr i} {
set p [expr {([expr {($p)*($c)}])%($n)}]
}

set p [expr {$p%$n}]
return $p
}


proc sleach {num} {
global rsanode
puts "num:$num"
set fid [open "txt/base.txt" r]
set file_data [read $fid]
set data [split $file_data "\n"]
set count 0
set e 0
set c 0
set n 0
set phi 0
foreach line $data {
	if {$count==$num} {
		#puts $line
		set linec 0
		foreach s_el $line {
				set linec [expr {$linec+1}]
				if {$linec==1} {
				set e $s_el
				} elseif {$linec==2} {
				set c $s_el
				} elseif {$linec==3} {
				set n $s_el
				} elseif {$linec==4} {
				set phi $s_el
				}
			}
		}
set count [expr {$count+1}]
}
puts "e:$e"
puts "c:$c"
puts "n:$n"
puts "phi:$phi"
set pl [decrypt $e $phi $c $n]
puts "Plain text:$pl"
if {$pl==$rsanode($num)} {
return 1
} else {
return 0
}
close $fid
}


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
  global node-id1 sink0 sink1 sink2 sink3 sink4 sink5 sink6 sink7 sink8 sink9 sink10 sink11 sink12 sink13 sink14 sink15 sink16 sink17 sink18 sink19 sink20 sink21 sink22 sink23 sink24  sink(BS0) sink(BS1) sink(BS2) sink(BS3) f0
    
 
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

for {set i 0} {$i<$val(nn)} {incr i} {
set clusterhead($i) 0
}

set r 0
set ch1 0
set ch2 0
set ch3 0
set ch4 0
set first 0
set second 0
set third 0
set fourth 0
set fifth 0
set sixth 0
set seventh 0
set eighth 0
proc leach {} {
global val
global ch1
global ch2
global ch3
global ch4
global r
global first
global second
global third
global fourth
global fifth
global sixth
global seventh
global eighth
global clusterhead
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
set leachval [sleach $ch1]
#puts "val3:$val3"
puts "ch1:$ch1"
set ch1r [myRand1]
puts "ch1r:$ch1r"
if {$clusterhead($ch1)!=1 && $leachval==1 && $ch1r<$t} {
set clusterhead($ch1) 1
break;
}
}
while {1} {
set leachval [sleach $ch2]
set ch2 [myRand $third $fourth]
puts "ch2:$ch2"
set ch2r [myRand1]
puts "ch2r:$ch2r"
if {$clusterhead($ch2)!=1 && $leachval==1 && $ch2r<$t} {
set clusterhead($ch2) 1
break;
}
}
while {1} {
set leachval [sleach $ch3]
set ch3 [myRand $fifth $sixth]
puts "ch3:$ch3"
set ch3r [myRand1]
puts "ch3r:$ch3r"
if {$clusterhead($ch3)!=1 && $leachval==1 && $ch3r<$t} {
set clusterhead($ch3) 1
break;
}
}

while {1} {
set leachval [sleach $ch4]
set ch4 [myRand $seventh $eighth]
puts "ch4:$ch4"
set ch4r [myRand1]
puts "ch4r:$ch4r"
if {$clusterhead($ch4)!=1 && $leachval==1 && $ch4r<$t} {
set clusterhead($ch4) 1
break;
}
}

}
proc test {} {
global ch1
global ch2
global ch3
global ch4
puts "testch1:$ch1"
puts "testch2:$ch2"
puts "testch3:$ch3"
puts "testch4:$ch4"
}
#======================================================================================


#======================================================================================
array set dbans {
    "how are you" "fine"
    "Are you there" "yes"
    "hi" "Thanks"        
    "" "Not Found"
}
Agent/UDP instproc process_data {size data} {
    global ns
    global udp
    global dbans
global n
    $self instvar node_
global udpch2
puts "data:$data"
set fields [split $data ":"]
puts "fields:$fields"
set sender [lindex $fields 0]
set receiver [lindex $fields 1]
set data [lindex $fields 2]
puts "sender:$sender"
    $self instvar node_
set tes [$node_ node-addr]
set tes [expr {($tes)-4}]

    
    # note in the trace file that the packet was received
    $ns trace-annotate "[$node_ node-addr] received {$data}"
    set flag1 "0"
    set flag "0"
    foreach db [array names dbans] {
    set str3 [string equal $db $data]
    
    if {$str3 == "1"} {
    set flag "1"
    
    set str4 [$node_ node-addr]
    $ns trace-annotate "Replying correct question for recieved data:{$data}"
    $ns trace-annotate "question: $db answer: $dbans($db)"
    set ans "$dbans($db)"     
    switch $str4 {

        0 {$ns at 80 "$udp0 send 828 replied:$ans"}

        1 {$ns at 80 "$udp1 send 828 replied:$ans"}

        2 {$ns at 80 "$udp2 send 828 replied:$ans"}

        default {puts "I don't know what the number is"}

    }
    }
}
    set str5 [string equal $flag $flag1]
    
    if {$str5 == "1"} {
    
    $ns trace-annotate "Answer not found in database"

}
if {$receiver!=$tes} {
$ns attach-agent $n($tes) $udpch2
$ns connect $udp($receiver) $udpch2

set fulldata {hi}
$ns at 8.4 "$udpch2 send 500 $tes:$receiver:$fulldata"
#puts "datatest:$encryptedData"

}

}

set udp(0) [new Agent/UDP]
$ns attach-agent $n(0) $udp(0)
set udp(1) [new Agent/UDP]
$ns attach-agent $n(1) $udp(1)
$ns connect $udp(0) $udp(1)
set udp(3) [new Agent/UDP]
set udp(2) [new Agent/UDP]
$ns attach-agent $n(0) $udp(3)
$ns attach-agent $n(2) $udp(2)
$ns connect $udp(3) $udp(2)

set udp(5) [new Agent/UDP]
set udpch [new Agent/UDP]
$ns attach-agent $n(5) $udp(5)

set udp(15) [new Agent/UDP]
set udpch2 [new Agent/UDP]
$ns attach-agent $n(15) $udp(15)
proc test {n1 n2 udpval} {
global ch1
global ch2
global ch3
global ch4
global n
global udp
global udpch
global udpch2
global first
global second
global third
global fourth
global fifth
global sixth
global seventh
global eighth
set ns [Simulator instance]
puts "testch1:$ch1"
puts "testch2:$ch2"
puts "testch3:$ch3"
puts "testch4:$ch4"
#puts "key1:$key1"
if {($n1>=$first && $n1<=$second && $n2>=$first && $n2<=$second) || ($n1>=$third && $n1<=$fourth && $n2>=$third && $n2<=$fourth) || ($n1>=$fifth && $n1<=$sixth && $n2>=$fifth && $n2<=$sixth) || ($n1>=$seventh && $n1<=$eighth && $n2>=$seventh && $n2<=$eighth)  } {

set fulldata {hi}
puts "trys"
$ns at 4.3 "$udp($udpval) send 500 $n1:$n2:$fulldata"

} elseif {$n2>=$first && $n2<=$second} {
$ns attach-agent $n($ch1) $udpch
$ns connect $udp($n1) $udpch

set fulldata {hi}
set encryptedData $fulldata
$ns at 4.3 "$udp($udpval) send 500 $n1:$n2:$encryptedData"


} elseif {$n2>=$third && $n2<=$fourth} {
$ns attach-agent $n($ch2) $udpch
$ns connect $udp($n1) $udpch
puts "elsiftest"

set fulldata {hi}
set encryptedData $fulldata
$ns at 4.3 "$udp($udpval) send 500 $n1:$n2:$encryptedData"

} elseif {$n2>=$fifth && $n2<=$sixth} {
$ns attach-agent $n($ch3) $udpch
$ns connect $udp($n1) $udpch

set fulldata {hi}
set encryptedData  $fulldata
$ns at 4.3 "$udp($udpval) send 500 $n1:$n2:$encryptedData"

} elseif {$n2>=$seventh && $n2<=$eighth} {
$ns attach-agent $n($ch4) $udpch
$ns connect $udp($n1) $udpch
puts "elsiftest"
set fulldata {hi}
set encryptedData $fulldata
$ns at 4.3 "$udp($udpval) send 500 $n1:$n2:$encryptedData"

}

}
#======================================================================================
set r 0
#set cluster [leach $r]
set count 0
$ns at 2.0 "leach"
$ns at 3.0 "leach"
$ns at 3.1 "test 5 15 5"
$ns at 3.5 "test 0 1 0"
#foreach linec $cluster {
#set count [expr {$count+1}]
#	if {$count==1} {
#	set ch1 $linec
#	}
#	if {$count==2} {
#	set ch2 $linec
#	}
#	if {$count==3} {
#	set ch3 $linec
#	}
#	if {$count==4} {
#	set ch4 $linec
#	}
#}

#puts "ch1main:$ch1"

#==========================================================================================


set cbr2112 [attach-CBR-traffic $n($ch1) $sink(B0) 800 .03]
set cbr2113 [attach-CBR-traffic $n(4) $sink2 800 .03]
#==========================================================================================
$ns at 0.1 "$cbr2112 start"
$ns at 0.2 "$cbr2113 start"

#=====================================================================================
$ns at 4.0 "finish"
#=====================================================================================

puts "Start of simulation.."
$ns run
#======================================================================================
 

