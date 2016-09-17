set chan [open "KDD.txt"]
set lineNumber 0
while {[gets $chan line] >= 0} {
    set fit($lineNumber) $line
    set lineNumber [expr $lineNumber + 1]
}
close $chan
set nn 50
for {set i 0} {$i < $nn } { incr i } {
	set j [expr $i + 1] 
	set HMM($i) $fit($j) 
}
	

set val(chan)		Channel/WirelessChannel		;# channel type
set val(prop)		Propagation/TwoRayGround	;# radio-propagation model
set val(netif)		Phy/WirelessPhy			;# network interface type
set val(mac)		Mac/802_11			;# MAC type
set val(ifq)		Queue/DropTail/PriQueue		;# interface queue type
set val(ll)		LL                         	;# link layer type
set val(ant)	    	Antenna/OmniAntenna        	;# antenna model
set val(ifqlen)	        200                       	;# max packet in ifq
set val(itr)            2
set val(rp)	        AODV                      	;# routing protocol
set val(x)		500   			        ;# X dimension of topography
set val(y)		500                 		;# Y dimension of topography  
set stop                20
set val(txPower)           0.660;			        ;# Initial transmit power
set val(rxPower)        0.395;			        ;# Initial receive power
set val(idlePower)      0.035;			        ;# Initial idle power
set rate		250Kb
set psize		512;
set base_station 	4
set transrange          100                     	;# Transmission Range        

# Define options
set ns [new Simulator]

set tracefd [open leach.tr w]
set namtrace [open leach.nam w]    

set w 0.5 
set c1 1.0
set c2 2.0 
set vmax 10
set vmin -10
set c 0

  
$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

set topo [new Topography]
$topo load_flatgrid $val(x) $val(y)

# Create a topology object that keeps track of movements of nodes within the topological boundary
create-god $nn
set god_ [create-god $nn]
# God object is used to store global information about the state of the environment, network or nodes
$ns node-config	-adhocRouting $val(rp) \
			-llType $val(ll) \
			-macType $val(mac) \
			-ifqType $val(ifq) \
			-ifqLen $val(ifqlen) \
			-antType $val(ant) \
			-propType $val(prop) \
			-phyType $val(netif) \
                        -channelType $val(chan) \
			-topoInstance $topo \
			-agentTrace ON \
			-routerTrace ON \
			-macTrace ON \
			-movementTrace ON\
			-velctyRange VelctyRange \
 			-initialVelcty 10 \
			-energyModel "EnergyModel"\
		 	-initialEnergy 90\
		 	-txPower 1.175\
	         	-rxPower 0.175\
		 	-idlePower 1.0\
		 	-sensePower 1.00000175\
		 	-sleepPower 1.001

			
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




for {set i 0} {$i < $nn } { incr i } {
            set n($i) [$ns node] 
#           $n($i) random-motion 0	;# disable random motion    
    }

proc record {} {
  global node-id1 sink(0) sink(1) sink(2) sink(3) sink(4) sink(5) sink(6) sink(7) sink(8) sink(9) sink(BS0) sink(BS1) sink(BS2) sink(BS3) f0

 
#Get An Instance Of The Simulator
   set ns [Simulator instance]
    
#Set The Time After Which The Procedure Should Be Called Again
   set time 0.05
 
#Get The Current Time
   set now [$ns now]
    

#Re-Schedule The Procedure
   $ns at [expr $now+$time] "record"
  }

set cluster_app new_app
proc cluster_app {$node_app nodes energy transmit min max minenergy maxenergy} {
for {set i 2} {$i < $val(stop)} { incr i } {
if(($n($i($energy)) == $maxenergy && $data($transmit) < $min) || ($n($i($energy)) > $maxenergy && $data($transmit) < $min) || ($n($i($energy)) > $maxenergy && $data($transmit) == $min) || ($n($i($energy)) > $maxenergy && ($data($transmit) > $min && $data($transmit) < $max)))
{
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
  
  
} elseif ( ($n($i($energy)) <= $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) < $min) || ($n($i($energy)) == $maxenergy && $data($transmit) == $min) || ($n($i($energy)) == $maxenergy && $data($transmit) > $min && $data($transmit) < $min) || ($n($i($energy)) > $maxenergy && $data($transmit) > $max))
{
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
  
} elseif ( ($n($i($energy)) == $minenergy && $data($transmit) < $min) || ($n($i($energy)) == $minenergy && $data($transmit) == $min) || ($n($i($energy)) < $maxenergy && ($n($i($energy))) > $minenergy && $data($transmit) == $min) || ($n($i($energy)) < $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) < $max && $data($transmit) > $min ) ||  ($n($i($energy)) == $maxenergy && $data($transmit) == $max ) || ($n($i($energy)) == $maxenergy && $data($transmit) > $max ))
{
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
  
} elseif ( ($n($i($energy)) < $minenergy && $data($transmit) < $min) || ($n($i($energy)) == $minenergy && $data($transmit) > $min && $data($transmit) < $max) || ($n($i($energy)) == $minenergy && $data($transmit) == $max) || ($n($i($energy)) < $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) == $max ) ||  ($n($i($energy)) < $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) > $max ) )
{
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
  
} elseif ( ($n($i($energy)) < $minenergy && $data($transmit) == $min) || ($n($i($energy)) < $minenergy && $data($transmit) > $min && $data($transmit) < $max) || ($n($i($energy)) < $maxenergy && $data($transmit) == $max) || ($n($i($energy)) < $minenergy && $data($transmit) > $max ) ||  ( $n($i($energy)) == $minenergy && $data($transmit) > $max ) )
{
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
  
} else {
$ns $transmit $stop
}
  
}
}

$ns at 0.0 "$Police_(0) setdest 250.0 200.0 10000.0"
$ns at 0.0 "$Police_(1) setdest 250.0 300.0 10000.0"
$ns at 0.0 "$Police_(2) setdest 200.0 250.0 10000.0"
$ns at 0.0 "$Police_(3) setdest 300.0 250.0 10000.0"

$ns at 0.0 "$n(4) setdest 90.0 426.0 10000.0"
$ns at 0.0 "$n(9) setdest 141.0 417.0 10000.0"
$ns at 0.0 "$n(7) setdest 156.0 260.0 10000.0"
$ns at 0.0 "$n(2) setdest 62.0 245.0 10000.0"
$ns at 0.0 "$n(1) setdest 71.0 380.0 10000.0"


 
$ns at 0.0 "$n(6) setdest 45.0 150.0 10000.0"

$ns at 0.0 "$n(8) setdest 130.0 11.0 10000.0"
$ns at 0.0 "$n(5) setdest 78.0 15.0 10000.0"
$ns at 0.0 "$n(0) setdest 39.0 36.0 10000.0"
$ns at 0.0 "$n(3) setdest  318.0 27.0 10000.0"
 

 
 
#================================================================================================
$ns at 0.3 "$n(1) setdest 50.0 50.0 50.0"
$ns at 0.3 "$n(2) setdest 50.0 150.0 50.0"
$ns at 0.3 "$n(3) setdest 50.0 250.0 50.0"
$ns at 0.3 "$n(4) setdest 50.0 5.0.0 50.0"
$ns at 0.3 "$n(5) setdest 50.0 450.0 50.0"
$ns at 0.3 "$n(6) setdest 150.0 499.0 50.0"
$ns at 0.3 "$n(7) setdest 150.0 50.0 50.0"
$ns at 0.3 "$n(8) setdest 150.0 150.0 50.0"
$ns at 0.3 "$n(9) setdest 150.0 5.0.0 50.0"


#=============================================================================================
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


#================================================================================================
$ns at 5.0 "$n(0) setdest 225.0 50.0 50.0"
$ns at 5.0 "$n(1) setdest 215.0 150.0 50.0"
$ns at 5.0 "$n(2) setdest 120.0 250.0 50.0"
$ns at 5.0 "$n(3) setdest 150.0 50.0 50.0"
$ns at 5.0 "$n(4) setdest 354.0.0 150.0 50.0"
$ns at 5.0 "$n(5) setdest 273.0.0 230.0 50.0"
$ns at 5.0 "$n(6) setdest 253.0 270.0 50.0"
$ns at 5.0 "$n(7) setdest 153.0 250.0 50.0"
$ns at 5.0 "$n(8) setdest 153.0 5.0.0 50.0"
$ns at 5.0 "$n(9) setdest 135.0.0 450.0 50.0"



set Est 0
set countnodes 0
set Police3 0.0
set Police4 0.0
for {set i 0} {$i < $nn} {incr i} {

                set f [expr rand()*499]
                set X1($i) $f
                set f [expr rand()*499]
                set X2($i) $f
                $n($i) set X_ $X1($i)
                $n($i) set Y_ $X2($i)
                set initposX1($i) $X1($i)
                set initposX2($i) $X2($i)
           
                set mindist 5000                                 
                set whichnode 0
                for {set k 0} {$k < $base_station} {incr k} {
					set disx  [expr $Police_X1($k) - $X1($i)]
                    set disy  [expr $Police_X2($k) - $X2($i)]
                    set disxsq [expr $disx * $disx]
                    set disysq [expr $disy * $disy]
                    set distsq [expr $disxsq + $disysq]
                    set dist [expr sqrt($distsq)]
                    if { $dist <= $transrange } {
						set disx  [expr $initposX1($i) - $X1($i)]
                        set disy  [expr $initposX2($i) - $X2($i)]
						set disxsq [expr $disx * $disx]
						set disysq [expr $disy * $disy]
						set distsq [expr $disxsq + $disysq]
						set dist [expr sqrt($distsq)]
						set Est [expr $Est + $dist ]
						set trustednodes($countnodes) $i
						puts "no of trusted nodes: $trustednodes($countnodes)"
						set countnodes [expr $countnodes + 1]
	
					}
                    if { $dist < $mindist } {
					set mindist $dist
					set whichnode $k
					
				}
			}
					
                
                set Police1($i) $Police_X1($whichnode)
				set Police2($i) $Police_X2($whichnode)
				set V1($i) [expr rand()*10]
				set V2($i) [expr rand()*10]
				set f $HMM($i)
				if { $f < $Police3  &&  $f < $Police4  } {
				set Police3 $Police_X1($whichnode)
				set Police4 $Police_X2($whichnode) 
			}
				

}

set time 1.0

set Vel1 0
set Vel2 0
set count 0

for {set i 0} {$i < $val(itr)} {incr i} {

	for {set j 0} {$j < $nn} {incr j} {
		set flag 0
		for {set l 0} {$l < $countnodes} {incr l} {
			if {$j == $trustednodes($l)} {
				set flag 0
			}
		}
    
	if {$flag != 1} {	
	set r1 [expr rand()]	
	set r2 [expr rand()]
	set Vel1 [expr $w * $V1($j)]
	set temp1 [expr $c1 * $r1 *[expr $Police1($j) - $X1($j) ]]	
	set temp2 [expr $c2 * $r2 *[expr $Police3 - $X1($j) ]]
	set Velocity1($j) [expr $Vel1 + $temp1 + $temp2 ]	
	set Vel2 [expr $w * $V2($j)]
	set temp3 [expr $c1 * $r1 *[expr $Police2($j) - $X2($j) ]]	
	set temp4 [expr $c2 * $r2 *[expr $Police4 - $X2($j) ]]
	set Velocity2($j) [expr $Vel2 + $temp3 + $temp4 ]	
	
	set xid1($j) [expr $X1($j) + $Velocity1($j)]
	set xid2($j) [expr $X2($j) + $Velocity2($j)]	
	if { $xid1($j) < 0 || $xid2($j) < 0 } {
		set xid1($j) 1
		set xid2($j) 1
		
	}
	if { $xid1($j) > 1000 || $xid2($j) > 1000 } {
		set xid1($j) 999
		set xid2($j) 999
		
	}
	if { $xid1($j) == $X1($j) && $xid2($j) == $X2($j) } {
		set count [expr $count + 1]
			}
	set X1($j) $xid1($j)
	set X2($j) $xid2($j)
	set V1($j) $Velocity1($j)
	set V2($j) $Velocity2($j)
	set mindist 5000
    set whichnode 0
    for {set k 0} {$k < $base_station} {incr k} {
			set disx  [expr $Police_X1($k) - $X1($j)]
            set disy  [expr $Police_X2($k) - $X2($j)]
            set disxsq [expr $disx * $disx]
            set disysq [expr $disy * $disy]
            set distsq [expr $disxsq + $disysq]
            set dist [expr sqrt($distsq)]
            if { $dist <= $transrange } {
				set disx  [expr $initposX1($i) - $X1($i)]
                        set disy  [expr $initposX2($i) - $X2($i)]
						set disxsq [expr $disx * $disx]
						set disysq [expr $disy * $disy]
						set distsq [expr $disxsq + $disysq]
						set dist [expr sqrt($distsq)]
						set Est [expr $Est + $dist ]
						set trustednodes($countnodes) $j
						puts "no of trusted nodes: $trustednodes($countnodes)"
						set countnodes [expr $countnodes + 1]
						
					}
            if { $dist < $mindist } {
			set mindist $dist
			set whichnode $k
			
					
				}
			}
	set f $HMM($j)
	if { $f < $Police1($j)  &&  $f < $Police2($j)  } {
	set Police1($j) $Police_X1($whichnode)
	set Police2($j) $Police_X2($whichnode)
    }
    if { $f < $Police3  &&  $f < $Police4  } {
	set Police3 $Police_X1($whichnode)
	set Police4 $Police_X2($whichnode)
    }			
}  
}
 if { $count == $nn } {
		set $i [expr $val(itr) + 1]

	}
    
	set time [expr $time + 1]
    set count 0
    

}
#puts "Total Estimated distance: $Est"
#puts "count nodes: $countnodes"

set Esterror 0
set Esterror [expr $Est / $countnodes ]
#puts "Estimation error: $Esterror"


for {set i 0} {$i < $nn} { incr i } {
	$ns initial_node_pos $n($i) 10

}

for {set i 0} {$i < $base_station} { incr i } {
    $ns initial_node_pos $Police_($i) 30+i*10
     $ns at 0.0 "$Police_($i) label BASE_STATION"
     $ns at 0.0 "$Police_($i) color blue"
}
	
for {set i 0} {$i < $nn } { incr i } {
	$ns at $stop "$n($i) reset";

}


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



set sink(BS0) [new Agent/LossMonitor]
set sink(BS1) [new Agent/LossMonitor]
set sink(BS2) [new Agent/LossMonitor]
set sink(BS3) [new Agent/LossMonitor]


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



$ns attach-agent $Police_(0) $sink(BS0)
$ns attach-agent $Police_(1) $sink(BS1)
$ns attach-agent $Police_(2) $sink(BS2)
$ns attach-agent $Police_(3) $sink(BS3)



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




#====================================================================================


proc attach-CBR-traffic { node sink size interval } {
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

set source1 9
set source2 9
set source3 9
set source4 9
set source5 9
set source6 9
set source7 9
set source8 9
set source9 9
set source10 9
set source11 9
set source12 9
set source13 9
set source14 9
set source15 9
set source16 49


set destination1 BS0
set destination2 BS1
set destination3 BS2
set destination4 1

set 1cbr [attach-CBR-traffic $n($source1) $sink($destination1) 500 .9]
$ns at 0.0 "$1cbr start"
set 2cbr [attach-CBR-traffic $n($source2) $sink($destination2) 500 .9]
$ns at 0.0 "$2cbr start"
set 3cbr [attach-CBR-traffic $n($source3) $sink($destination3) 500 .9]
$ns at 0.0 "$3cbr start"
set 4cbr [attach-CBR-traffic $n($source4) $sink($destination4) 500 .9]
$ns at 0.0 "$4cbr start"
set 5cbr [attach-CBR-traffic $n($source5) $sink($destination1) 500 .9]
$ns at 0.0 "$5cbr start"
set 6cbr [attach-CBR-traffic $n($source6) $sink($destination2) 500 .9]
$ns at 0.0 "$6cbr start"
set 7cbr [attach-CBR-traffic $n($source7) $sink($destination3) 500 .9]
$ns at 0.0 "$7cbr start"
set 8cbr [attach-CBR-traffic $n($source8) $sink($destination4) 500 .9]
$ns at 0.0 "$8cbr start"
set 9cbr [attach-CBR-traffic $n($source9) $sink($destination1) 500 .9]
$ns at 0.0 "$9cbr start"
set 10cbr [attach-CBR-traffic $n($source10) $sink($destination2) 500 .9]
$ns at 0.0 "$10cbr start"
set 11cbr [attach-CBR-traffic $n($source11) $sink($destination3) 500 .9]
$ns at  0.0 "$11cbr start"
set 12cbr [attach-CBR-traffic $n($source12) $sink($destination4) 500 .9]
$ns at 0.0 "$12cbr start"
set 13cbr [attach-CBR-traffic $n($source13) $sink($destination1) 500 .9]
$ns at 0.0 "$13cbr start"
set 14cbr [attach-CBR-traffic $n($source14) $sink($destination2) 500 .9]
$ns at 0.0 "$14cbr start"
set 15cbr [attach-CBR-traffic $n($source15) $sink($destination3) 500 .9]
$ns at 0.0 "$15cbr start"
set 16cbr [attach-CBR-traffic $n($source16) $sink($destination4) 500 .9]
$ns at 0.0 "$16cbr start"



$ns at $stop "$ns nam-end-wireless $stop"
$ns at $stop "stop"



proc stop {} {
	global ns tracefd namtrace
    	$ns flush-trace
    	close $tracefd
    	close $namtrace
    	exec nam leach.nam &
    	exit 0
}

$ns run
#source ".run"
