

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

for {set i 0} {$i<$nn} {incr i} {
set fid [open txt/$i.txt w]
set ans [rsa]
#puts "message:$ans"
set count 0
set ec {}
foreach s_el $ans {
set count [expr {$count+1}]
if {$count==1} {
#puts $s_el
puts $fid $s_el
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
close $fid
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
puts "num:$num"
set fid [open "txt/base.txt" r]
set file_data [read $fid]
set fid1 [open "txt/$num.txt" r]
set file_data1 [read $fid1]
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
if {$pl==$file_data1} {
return 1
} else {
return 0
}
close $fid
close $fid1
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
set stop                15
set val(txPower)        0.660;			        ;# Initial transmit power
set val(rxPower)        0.395;			        ;# Initial receive power
set val(idlePower)      0.035;			        ;# Initial idle power
set rate		250Kb
set psize		512;
set base_station 	4
set transrange          100                     	;# Transmission Range
#
set pam(ak_n) 2;#2 attackers
set pam(ak_ng) 1;#attackers divide into 1 group
set pam(ak_tg) 0;#attackers' groups start time differeces
set pam(ak_rs) 0;#in a ak_ap 0: attackers will not random start, 1: attackers will random start
set pam(ak_pr) 0.5;#Attacker flows' packages rate 0.5Mbps
set pam(ak_ps) 200;#Attacker flows' packages size 200B
set pam(ak_bp) 500;#Attacker flows' burst period is 500ms
set pam(ak_ap) 1000;#Attacker flows' attack period is 1000ms
set pam(ak_st) 60;#Attacker flows start at 60s
set pam(ak_sp) 100;#Attacker flows stop at 100s
set pam(ak_tp) 2;#1:represents period attack, 2:represents follow tcp cwnd attack
set pam(ak_mw) 5;#for ak_tp 2 ak_nw is the max cwnd that correspond to ak_pr
set pam(ak_cp) 10;#Attacker flows' tcp cwnd check period is 10ms
set pam(ak_spf_mn) 1;#Attacker min spoof address is 1
set pam(ak_spf_mx) 100;#Attacker max spoof address is 100
set pam(ak_spf_lv) 0;#Attacker address spoof level 0:no spoof 1:spoof
set pam(ns_db) 1;#0: do not output debug info, 1: output debug info
set pam(ns_of) 3;#ns output file ns_of >=3 o leodos.nam >=2 o leodos.tr leodos_tcp.tr leodos_queue_monitor.tr >=1 o leodos_queue.tr
set pam(li) 0;#the loop index
#      
#      


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
			-movementTrace OFF\
			-velctyRange VelctyRange \
 			-initialVelcty 10 \
			txPower 1.175\
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

if {$pam(ak_n) > 0 && $pam(ak_ng) > 0 && $pam(ak_pr) > 0 && $pam(ak_ps) > 0 && $pam(ak_bp) > 0 && $pam(ak_ap) > 0} {
	set ak_ngm [expr $pam(ak_n)/$pam(ak_ng)];#number of member per group
	#set ak_dtg [expr $pam(ak_ap)/$pam(ak_ng)/1000.0];
	set ak_dtg [expr $pam(ak_tg)/1000.0];
set a(0) [$ns node]
$ns at 0.0 "$a(0) color red"
$a(0) color red
$a(0) shape square
$ns initial_node_pos $a(0) 20+19*10

set a(1) [$ns node]
$ns at 0.0 "$a(1) color red"
$a(1) color red
$a(1) shape square
$ns initial_node_pos $a(1) 20+30*10
} 

proc record {} {
  global node-id1 sink(0) sink(1) sink(2) sink(3) sink(4) sink(5) sink(6) sink(7) sink(8) sink(9) sink(10) sink(11) sink(12) sink(13) sink(14) sink(15) sink(16) sink(17) sink(18) sink(19) sink(20) sink(21) sink(22) sink(23) sink(24) sink(25) sink(26) sink(27) sink(28) sink(29) sink(30) sink(31) sink(32) sink(33)sink(34) sink(35) sink(36) sink(37) sink(38) sink(39) sink(40) sink(41) sink(42) sink(43) sink(44) sink(45) sink(46) sink(47) sink(48) sink(49) sink(51) sink(52) sink(53) sink(BS0) sink(BS1) sink(BS2) sink(BS3) f0

 
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
set val3 [sleach $i]
if {$val3==1} {
puts "trusted node"
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
}
  
  
} elseif ( ($n($i($energy)) <= $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) < $min) || ($n($i($energy)) == $maxenergy && $data($transmit) == $min) || ($n($i($energy)) == $maxenergy && $data($transmit) > $min && $data($transmit) < $min) || ($n($i($energy)) > $maxenergy && $data($transmit) > $max))
{
set val3 [sleach $i]
if {$val3==1} {
puts "trusted node"
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
}

} elseif ( ($n($i($energy)) == $minenergy && $data($transmit) < $min) || ($n($i($energy)) == $minenergy && $data($transmit) == $min) || ($n($i($energy)) < $maxenergy && ($n($i($energy))) > $minenergy && $data($transmit) == $min) || ($n($i($energy)) < $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) < $max && $data($transmit) > $min ) ||  ($n($i($energy)) == $maxenergy && $data($transmit) == $max ) || ($n($i($energy)) == $maxenergy && $data($transmit) > $max ))
{
set val3 [sleach $i]
if {$val3==1} {
puts "trusted node"
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
}  
} elseif ( ($n($i($energy)) < $minenergy && $data($transmit) < $min) || ($n($i($energy)) == $minenergy && $data($transmit) > $min && $data($transmit) < $max) || ($n($i($energy)) == $minenergy && $data($transmit) == $max) || ($n($i($energy)) < $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) == $max ) ||  ($n($i($energy)) < $maxenergy && $n($i($energy)) > $minenergy && $data($transmit) > $max ) )
{
set val3 [sleach $i]
if {$val3==1} {
puts "trusted node"
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
} 
} elseif ( ($n($i($energy)) < $minenergy && $data($transmit) == $min) || ($n($i($energy)) < $minenergy && $data($transmit) > $min && $data($transmit) < $max) || ($n($i($energy)) < $maxenergy && $data($transmit) == $max) || ($n($i($energy)) < $minenergy && $data($transmit) > $max ) ||  ( $n($i($energy)) == $minenergy && $data($transmit) > $max ) )
{
set val3 [sleach $i]
if {$val3==1} {
puts "trusted node"
set cluster_node $n($i)
set NC(m) $energy($cluster_node)
set MH(m) $clusternode($range($destination))
set F(m) [expr  $NC(m) + (1/$MH(m))]
set cluster_head $max($F(m))
$ns $cluster_head $transmit $data
$ns $cluster_head $receive $data
}  
} else {
$ns $transmit $stop
}
  
}
}

$ns at 0.0 "$Police_(0) setdest 250.0 200.0 10000.0"
$ns at 0.0 "$Police_(1) setdest 250.0 300.0 10000.0"
$ns at 0.0 "$Police_(2) setdest 200.0 250.0 10000.0"
$ns at 0.0 "$Police_(3) setdest 300.0 250.0 10000.0"

$ns at 0.0 "$n(19) setdest 44.0 420.0 10000.0"
$ns at 0.0 "$n(4) setdest 90.0 426.0 10000.0"
$ns at 0.0 "$n(9) setdest 141.0 417.0 10000.0"
$ns at 0.0 "$n(12) setdest 178.0 386.0 10000.0"
$ns at 0.0 "$n(48) setdest 179.0 324.0 10000.0"
$ns at 0.0 "$n(7) setdest 156.0 260.0 10000.0"
$ns at 0.0 "$n(25) setdest 104.0 255.0 10000.0"
$ns at 0.0 "$n(2) setdest 62.0 245.0 10000.0"
$ns at 0.0 "$n(17) setdest 32.0 270.0 10000.0"
$ns at 0.0 "$n(42) setdest 11.0 324.0 10000.0"
$ns at 0.0 "$n(1) setdest 71.0 380.0 10000.0"
 
$ns at 0.0 "$n(44) setdest 311.0 433.0 10000.0"
$ns at 0.0 "$n(49) setdest 370.0 446.0 10000.0"
$ns at 0.0 "$n(24) setdest 438.0 438.0 10000.0"
$ns at 0.0 "$n(43) setdest 445.0 371.0 10000.0"
$ns at 0.0 "$n(22) setdest 452.0 326.0 10000.0"
$ns at 0.0 "$n(47) setdest 419.0 272.0 10000.0"
$ns at 0.0 "$n(32) setdest 366.0 244.0 10000.0"
$ns at 0.0 "$n(37) setdest 306.0 268.0 10000.0"
$ns at 0.0 "$n(14) setdest 276.0 322.0 10000.0"
$ns at 0.0 "$n(34) setdest 287.0 376.0 10000.0"

 
$ns at 0.0 "$n(6) setdest 45.0 150.0 10000.0"
$ns at 0.0 "$n(33) setdest 97.0 250.0 10000.0"
$ns at 0.0 "$n(13) setdest 152.0 5.0.0 10000.0"
$ns at 0.0 "$n(35) setdest 188.0 450.0 10000.0"
$ns at 0.0 "$n(38) setdest 203.0 157.0 10000.0"
$ns at 0.0 "$n(45) setdest 202.0 118.0 10000.0"
$ns at 0.0 "$n(40) setdest 195.0 62.0 10000.0"
$ns at 0.0 "$n(36) setdest 173.0 20.0 10000.0"
$ns at 0.0 "$n(8) setdest 130.0 11.0 10000.0"
$ns at 0.0 "$n(5) setdest 78.0 15.0 10000.0"
$ns at 0.0 "$n(0) setdest 39.0 36.0 10000.0"
$ns at 0.0 "$n(15) setdest 25.0 89.0 10000.0"
$ns at 0.0 "$n(16) setdest 22.0 140.0 10000.0"
 
$ns at 0.0 "$n(27) setdest 379.0 171.0 10000.0"
$ns at 0.0 "$n(21) setdest 425.1 176.1 10000.0"
$ns at 0.0 "$n(31) setdest 463.0 140.0 10000.0"
$ns at 0.0 "$n(29) setdest 484.0 97.0 10000.0"
$ns at 0.0 "$n(30) setdest 478.0 43.0 10000.0"
$ns at 0.0 "$n(23) setdest 450.0 11.0 10000.0"
$ns at 0.0 "$n(20) setdest 414.0 3.0 10000.0"
$ns at 0.0 "$n(26) setdest 368.0 6.0 10000.0"
$ns at 0.0 "$n(3) setdest  318.0 27.0 10000.0"
$ns at 0.0 "$n(46) setdest 297.0 62.0 10000.0"
$ns at 0.0 "$n(18) setdest 300.0 109.0 10000.0"
$ns at 0.0 "$n(39) setdest 330.1 142.1 10000.0"
 
$ns at 0.0 "$n(28) setdest 118.0 325.0 10000.0"
 
$ns at 0.0 "$n(11) setdest 119.0 112.0 10000.0"
 
$ns at 0.0 "$n(10) setdest 378.0 85.0 10000.0"
 
$ns at 0.0 "$n(41) setdest 360.0 338.0 10000.0"
 
 
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
$ns at 0.3 "$n(10) setdest 150.0 450.0 50.0"
$ns at 0.3 "$n(11) setdest 250.0 50.0 50.0"
$ns at 0.3 "$n(12) setdest 250.0 450.0 50.0"
$ns at 0.3 "$n(13) setdest 5.0.0 50.0 50.0"
$ns at 0.3 "$n(14) setdest 5.0.0 150.0 50.0"
$ns at 0.3 "$n(15) setdest 5.0.0 5.0.0 50.0"
$ns at 0.3 "$n(16) setdest 5.0.0 450.0 50.0"
$ns at 0.3 "$n(17) setdest 450.0 50.0 50.0"
$ns at 0.3 "$n(18) setdest 450.0 150.0 50.0"
$ns at 0.3 "$n(19) setdest 450.0 250.0 50.0"
$ns at 0.3 "$n(20) setdest 450.0 5.0.0 50.0"
$ns at 0.3 "$n(21) setdest 450.0 450.0 50.0"
$ns at 0.3 "$n(22) setdest 450.0 250.0 50.0"
$ns at 0.3 "$n(23) setdest 275.0 5.0.0 50.0"
$ns at 0.3 "$n(24) setdest 325.0 450.0 50.0"
$ns at 0.3 "$n(25) setdest 450.0 50.0 50.0"
$ns at 0.3 "$n(26) setdest 275.0 150.0 50.0"
$ns at 0.3 "$n(27) setdest 325.0 250.0 50.0"
$ns at 0.3 "$n(28) setdest 375.0 5.0.0 50.0"
$ns at 0.3 "$n(29) setdest 425.0 450.0 50.0"
$ns at 0.3 "$n(30) setdest 475.1 0.1 50.0"
$ns at 0.3 "$n(31) setdest 450.0 10.0 50.0"
$ns at 0.3 "$n(32) setdest 349.0 270.0 50.0"
$ns at 0.3 "$n(33) setdest 449.0 374.0 50.0"
$ns at 0.3 "$n(34) setdest 424.0 5.0.0 50.0"
$ns at 0.3 "$n(35) setdest 475.0 149.0 50.0"
$ns at 0.3 "$n(36) setdest 425.0 450.0 50.0"
$ns at 0.3 "$n(37) setdest 375.0 290.0 50.0"
$ns at 0.3 "$n(38) setdest 325.0 395.0 50.0"
$ns at 0.3 "$n(39) setdest 5.0.0 427.0 50.0"
$ns at 0.3 "$n(40) setdest 475.1 90.1 50.0"
$ns at 0.3 "$n(41) setdest 425.0 50.0 50.0"
$ns at 0.3 "$n(42) setdest 374.0 475.0 50.0"
$ns at 0.3 "$n(43) setdest 149.0 425.0 50.0"
$ns at 0.3 "$n(44) setdest 149.0 270.0 50.0"
$ns at 0.3 "$n(45) setdest 350.0 150.0.0 50.0"
$ns at 0.3 "$n(46) setdest 150.0 250.0 50.0"
$ns at 0.3 "$n(47) setdest 250.0 350.0 50.0"
$ns at 0.3 "$n(48) setdest 375.0 450.0.0 50.0"
$ns at 0.3 "$n(49) setdest 125.0 250.0 50.0"
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
$ns at 3.1 "$n(27) setdest 299.0 250.0 50.0"
$ns at 3.1 "$n(28) setdest 399.0 5.0.0 50.0"
$ns at 3.1 "$n(29) setdest 499.0 450.0 50.0"
$ns at 3.1 "$n(30) setdest 125.0 150.0 50.0"
$ns at 3.1 "$n(31) setdest 350.0 250.0 50.0"
$ns at 3.1 "$n(32) setdest 125.0 350.0 50.0"
$ns at 3.1 "$n(33) setdest 185.0 150.0 50.0"
$ns at 3.1 "$n(34) setdest 235.0 250.0 50.0"
$ns at 3.1 "$n(35) setdest 150.0 350.0 50.0"
$ns at 3.1 "$n(36) setdest 150.0 350.0 50.0"
$ns at 3.1 "$n(37) setdest 350.0 350.0 50.0"
$ns at 3.1 "$n(38) setdest 250.0 315.0 50.0"
$ns at 3.1 "$n(39) setdest 25.0 250.0 50.0"
$ns at 3.1 "$n(40) setdest 250.0 150.0 50.0"
$ns at 3.1 "$n(41) setdest 450.0 450.0.0 50.0"
$ns at 3.1 "$n(42) setdest 150.0 250.0 50.0"
$ns at 3.1 "$n(43) setdest 125.0  350.0 50.0"
$ns at 3.1 "$n(44) setdest 250.0 125.0 50.0"
$ns at 3.1 "$n(45) setdest 350.0 350.0 50.0"
$ns at 3.1 "$n(46) setdest 45.0  15.0.0 50.0"
$ns at 3.1 "$n(47) setdest 350.0 250.0 50.0"
$ns at 3.1 "$n(48) setdest 250.0 345.0.0 50.0"
$ns at 3.1 "$n(49) setdest 199.0 450.0 50.0"
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
$ns at 5.0 "$n(10) setdest 435.0 250.0 50.0"
$ns at 5.0 "$n(11) setdest 225.0 5.0.0 50.0"
$ns at 5.0 "$n(12) setdest 125.0 450.0 50.0"
$ns at 5.0 "$n(13) setdest 180.0 450.0 50.0"
$ns at 5.0 "$n(14) setdest 150.0 5.0.0 50.0"
$ns at 5.0 "$n(15) setdest 145.0 450.0 50.0"
$ns at 5.0 "$n(16) setdest 115.0.0 5.0.0 50.0"
$ns at 5.0 "$n(17) setdest 150.0 450.0 50.0"
$ns at 5.0 "$n(18) setdest 250.0 5.0.0 50.0"
$ns at 5.0 "$n(19) setdest 399.0 250.0 50.0"
$ns at 5.0 "$n(20) setdest 499.0 5.0.0 50.0"
$ns at 5.0 "$n(21) setdest 299.0 450.0 50.0"
$ns at 5.0 "$n(22) setdest 152.0 250.0 50.0"
$ns at 5.0 "$n(23) setdest 154.0 5.0.0 50.0"
$ns at 5.0 "$n(24) setdest 125.0.0 450.0 50.0"
$ns at 5.0 "$n(25) setdest 290.0 250.0 50.0"
$ns at 5.0 "$n(26) setdest 150.0 5.0.0 50.0"
$ns at 5.0 "$n(27) setdest 350.0 450.0 50.0"
$ns at 5.0 "$n(28) setdest 450.0 450.0 50.0"
$ns at 5.0 "$n(29) setdest 250.0 5.0.0 50.0"
$ns at 5.0 "$n(30) setdest 275.0 50.0 50.0"
$ns at 5.0 "$n(31) setdest 225.0 150.0 50.0"
$ns at 5.0 "$n(32) setdest 475.0 250.0 50.0"
$ns at 5.0 "$n(33) setdest 275.0 5.0.0 50.0"
$ns at 5.0 "$n(34) setdest 375.0 450.0 50.0"
$ns at 5.0 "$n(35) setdest 125.1 0.1 50.0"
$ns at 5.0 "$n(36) setdest 140.0 10.0 50.0"
$ns at 5.0 "$n(37) setdest 314.0 250.0 50.0"
$ns at 5.0 "$n(38) setdest 124.0 5.0.0 50.0"
$ns at 5.0 "$n(39) setdest 149.0 150.0 50.0"
$ns at 5.0 "$n(40) setdest 150.0 50.0 50.0"
$ns at 5.0 "$n(41) setdest 230.0 200.0 50.0"
$ns at 5.0 "$n(42) setdest 115.0.0 275.0 50.0"
$ns at 5.0 "$n(43) setdest 420.0 375.0 50.0"
$ns at 5.0 "$n(44) setdest 327.0 475.0 50.0"
$ns at 5.0 "$n(45) setdest 50.1 50.1 50.0"
$ns at 5.0 "$n(46) setdest 275.0 50.0 50.0"
$ns at 5.0 "$n(47) setdest 424.0 275.0 50.0"
$ns at 5.0 "$n(48) setdest 324.0 375.0 50.0"
$ns at 5.0 "$n(49) setdest 374.0 450.0 50.0"

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
		    set val3 [sleach $i]
		if {$val3==1} {
						puts "trusted node"
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
set sink(40) [new Agent/LossMonitor]
set sink(41) [new Agent/LossMonitor]
set sink(42) [new Agent/LossMonitor]
set sink(43) [new Agent/LossMonitor]
set sink(44) [new Agent/LossMonitor]
set sink(45) [new Agent/LossMonitor]
set sink(46) [new Agent/LossMonitor]
set sink(47) [new Agent/LossMonitor]
set sink(48) [new Agent/LossMonitor]
set sink(49) [new Agent/LossMonitor]
set sink(50) [new Agent/LossMonitor]
set sink(51) [new Agent/LossMonitor]
set sink(52) [new Agent/LossMonitor]
set sink(53) [new Agent/LossMonitor]

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
$ns attach-agent $n(10) $sink(10)
$ns attach-agent $n(1) $sink(11)
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
$ns attach-agent $n(40) $sink(40)
$ns attach-agent $n(41) $sink(41)
$ns attach-agent $n(42) $sink(42)
$ns attach-agent $n(43) $sink(43)
$ns attach-agent $n(44) $sink(44)
$ns attach-agent $n(45) $sink(45)
$ns attach-agent $n(46) $sink(46)
$ns attach-agent $n(47) $sink(47)
$ns attach-agent $n(48) $sink(48)
$ns attach-agent $n(49) $sink(49)

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
set tcp40 [new Agent/TCP]
$ns attach-agent $n(40) $tcp40
set tcp41 [new Agent/TCP]
$ns attach-agent $n(41) $tcp41
set tcp42 [new Agent/TCP]
$ns attach-agent $n(42) $tcp42
set tcp43 [new Agent/TCP]
$ns attach-agent $n(43) $tcp43
set tcp44 [new Agent/TCP]
$ns attach-agent $n(44) $tcp44
set tcp45 [new Agent/TCP]
$ns attach-agent $n(45) $tcp45
set tcp46 [new Agent/TCP]
$ns attach-agent $n(46) $tcp46
set tcp47 [new Agent/TCP]
$ns attach-agent $n(47) $tcp47
set tcp48 [new Agent/TCP]
$ns attach-agent $n(48) $tcp48
set tcp49 [new Agent/TCP]
$ns attach-agent $n(49) $tcp49
set tcp50 [new Agent/TCP]


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


set destination1 BS0
set destination2 BS1
set destination3 BS2
set destination4 BS3

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
