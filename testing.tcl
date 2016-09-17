
# Define options
set val(chan)           Channel/WirelessChannel                  ;# channel type
set val(prop)           Propagation/TwoRayGround            ;# radio-propagation model
set val(netif)            Phy/WirelessPhy                               ;# network interface type
set val(mac)            Mac/802_11                                     ;# MAC type
set val(ifq)              Queue/DropTail/PriQueue                 ;# interface queue type
set val(ll)                 LL                                                     ;# link layer type
set val(ant)              Antenna/OmniAntenna                       ;# antenna model
set val(ifqlen)           50                                                     ;# max packet in ifq
set val(nn)                16                                                      ;# number of mobilenodes
set val(rp)               AODV                                               ;# routing protocol
set val(x)                500                                                     ;# X dimension of topography
set val(y)                400                                                     ;# Y dimension of topography 
set val(stop)           10                                                       ;# time of simulation end
set val(thr)            0                                                      ;#connectivity threshold     
#Creating simulation:
set ns              [new Simulator]

#Creating nam and trace file:
set tracefd       [open wireless3.tr w]
set namtrace      [open wireless3.nam w]   

$ns trace-all $tracefd
$ns namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

set god_ [create-god $val(nn)]
# configure the nodes
        $ns node-config -adhocRouting $val(rp) \
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
                   -macTrace OFF \
                   -movementTrace ON
## Creating node objects.. 
        

for {set i 0} {$i < 16 } { incr i } {
            set node_($i) [$ns node]     
      }
      		 set xx 50
                  set yy 100
                  $node_(0) set X_ $xx
                  $node_(0) set Y_ $yy
		  #$ns at 1.0 $node_(0) setdest 100 100 0.05
		 # $ns at 2.00 "$node_(0) setdest 350 20.00 20.00"
	
                  set xx 50
                  set yy 200
                  $node_(1) set X_ $xx
                  $node_(1) set Y_ $yy
                  set xx 50
                  set yy 20
                  $node_(2) set X_ $xx
                  $node_(2) set Y_ $yy
                  set xx 90
                  set yy 212
                  $node_(3) set X_ $xx
                  $node_(3) set Y_ $yy
                  set xx 6
                  set yy 59
                  $node_(4) set X_ $xx
                  $node_(4) set Y_ $yy
                  set xx 109
                  set yy 80
                  $node_(5) set X_ $xx
                  $node_(5) set Y_ $yy
                  set xx 70
                  set yy 20
                  $node_(6) set X_ $xx
                  $node_(6) set Y_ $yy
                  set xx 300
                  set yy 40
                  $node_(7) set X_ $xx
                  $node_(7) set Y_ $yy
                  set xx 140
                  set yy 280
                  $node_(8) set X_ $xx
                  $node_(8) set Y_ $yy
                  set xx 24
                  set yy 310
                  $node_(9) set X_ $xx
                  $node_(9) set Y_ $yy
                  set xx 57
                  set yy 340
                  $node_(10) set X_ $xx
                  $node_(10) set Y_ $yy
                  set xx 98
                  set yy 400
                  $node_(11) set X_ $xx
                  $node_(11) set Y_ $yy
                  set xx 60
                  set yy 70
                  $node_(12) set X_ $xx
                  $node_(12) set Y_ $yy
                  set xx 20
                  set yy 200
                  $node_(13) set X_ $xx
                  $node_(13) set Y_ $yy
                  set xx 0
                  set yy 95
                  $node_(14) set X_ $xx
                  $node_(14) set Y_ $yy
                  set xx 50
                  set yy 80
                  $node_(15) set X_ $xx
                  $node_(15) set Y_ $yy
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns initial_node_pos $node_($i) 30
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "$node_($i) reset";
}
$ns at 0.0 "destination"
proc destination {} {
      global ns val node_
      set time 1.0

      set now [$ns now]
      for {set i 0} {$i< 16} {incr i} {
            set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(0) setdest $xx $yy 10.0"
	    
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(1) setdest $xx $yy 10.0 "
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(2) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(3) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(4) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(5) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(6) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(7) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(8) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(9) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(10) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(11) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(12) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(13) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(14) setdest $xx $yy 10.0"
	    set xx [expr rand()*500]
            set yy [expr rand()*400]
            $ns at $now "$node_(15) setdest $xx $yy 10.0"
	    
	 
      }
 $ns at [expr $now+$time] "destination"
}

#group function
proc grop {m} {
puts "$m Round"
global group
global secgroup
global groupcount
global secgroupcount
global streng
for {set i 0} {$i<16} {incr i} {
set k 0
set l 0
for {set j 0} {$j<16} {incr j} {
if { $streng($i,$j) > 1.0 } {
set group($i,$k) $j
#set i16 $group($i,$k)
#puts "$i16"
incr k 
}
if { $streng($i,$j) > 0.6 } {
set secgroup($i,$l) $j
#set i16 $group($i,$k)
#puts "$i16"
incr l 
}
}
set groupcount($i) $k
set secgroupcount($i) $l
}
}





#set streng
#Strength Initialization
for {set i 0} {$i<$val(nn)} {incr i} {
for {set j 0} {$j<$val(nn)} {incr j} {
set streng($i,$j) 0.25
}
}
#puts "strength:$streng(0,0)"

#Strength calculation function
proc strength {i j k} {
global streng
set ag 0.98
set up 0.45
set i1 [expr {$streng($i,$j)*$ag}]
set i2 [expr {1-$streng($i,$j)}]
set i30 [expr {pow($ag,$k)}]
set i3 [expr {$i2*$i30}]
set i4 [expr {$i3*$up}]
set i5 [expr {$i4+$i1}]
set streng($i,$j) $i5  

puts "$i5"
}


#node0-node1
set udp0 [new Agent/UDP]
$ns attach-agent $node_(0) $udp0
set udp1 [new Agent/UDP]
$ns attach-agent $node_(1) $udp1
$ns connect $udp0 $udp1
#node0-node2
set udp2 [new Agent/UDP]
$ns attach-agent $node_(0) $udp2
set udp3 [new Agent/UDP]
$ns attach-agent $node_(2) $udp3
$ns connect $udp2 $udp3
#node0-node2
set udp4 [new Agent/UDP]
$ns attach-agent $node_(0) $udp4
set udp5 [new Agent/UDP]
$ns attach-agent $node_(2) $udp5
$ns connect $udp4 $udp5
#node0-node2
set udp6 [new Agent/UDP]
$ns attach-agent $node_(0) $udp6
set udp7 [new Agent/UDP]
$ns attach-agent $node_(2) $udp7
$ns connect $udp6 $udp7
#node0-node1
set udp8 [new Agent/UDP]
$ns attach-agent $node_(0) $udp8
set udp9 [new Agent/UDP]
$ns attach-agent $node_(1) $udp9
$ns connect $udp8 $udp9
#node2-node3
set udp10 [new Agent/UDP]
$ns attach-agent $node_(2) $udp10
set udp11 [new Agent/UDP]
$ns attach-agent $node_(3) $udp11
$ns connect $udp10 $udp11

#node2-node6
set udp12 [new Agent/UDP]
$ns attach-agent $node_(2) $udp12
set udp13 [new Agent/UDP]
$ns attach-agent $node_(6) $udp13
$ns connect $udp12 $udp13
#node2-node9
set udp14 [new Agent/UDP]
$ns attach-agent $node_(2) $udp14
set udp15 [new Agent/UDP]
$ns attach-agent $node_(9) $udp15
$ns connect $udp14 $udp15

#node2-node14
set udp16 [new Agent/UDP]
$ns attach-agent $node_(2) $udp16
set udp17 [new Agent/UDP]
$ns attach-agent $node_(14) $udp17
$ns connect $udp16 $udp17
#node3-node8
set udp18 [new Agent/UDP]
$ns attach-agent $node_(3) $udp18
set udp19 [new Agent/UDP]
$ns attach-agent $node_(8) $udp19
$ns connect $udp18 $udp19
#node3-node10
set udp20 [new Agent/UDP]
$ns attach-agent $node_(3) $udp20
set udp21 [new Agent/UDP]
$ns attach-agent $node_(10) $udp21
$ns connect $udp20 $udp21
#node3-node5
set udp22 [new Agent/UDP]
$ns attach-agent $node_(3) $udp22
set udp23 [new Agent/UDP]
$ns attach-agent $node_(5) $udp23
$ns connect $udp22 $udp23
#node3-node9
set udp24 [new Agent/UDP]
$ns attach-agent $node_(3) $udp24
set udp25 [new Agent/UDP]
$ns attach-agent $node_(9) $udp25
$ns connect $udp24 $udp25
#node4-node12
set udp26 [new Agent/UDP]
$ns attach-agent $node_(4) $udp26
set udp27 [new Agent/UDP]
$ns attach-agent $node_(12) $udp27
$ns connect $udp26 $udp27
#node4-node5
set udp28 [new Agent/UDP]
$ns attach-agent $node_(4) $udp28
set udp29 [new Agent/UDP]
$ns attach-agent $node_(5) $udp29
$ns connect $udp28 $udp29
#node4-node15
set udp30 [new Agent/UDP]
$ns attach-agent $node_(4) $udp30
set udp31 [new Agent/UDP]
$ns attach-agent $node_(15) $udp31
$ns connect $udp30 $udp31
#node4-node10
set udp32 [new Agent/UDP]
$ns attach-agent $node_(4) $udp32
set udp33 [new Agent/UDP]
$ns attach-agent $node_(10) $udp33
$ns connect $udp32 $udp33
#node5-node12
set udp34 [new Agent/UDP]
$ns attach-agent $node_(5) $udp34
set udp35 [new Agent/UDP]
$ns attach-agent $node_(12) $udp35
$ns connect $udp34 $udp35
#node5-node6
set udp36 [new Agent/UDP]
$ns attach-agent $node_(5) $udp36
set udp37 [new Agent/UDP]
$ns attach-agent $node_(6) $udp37
$ns connect $udp36 $udp37
#node5-node3
set udp38 [new Agent/UDP]
$ns attach-agent $node_(5) $udp38
set udp39 [new Agent/UDP]
$ns attach-agent $node_(3) $udp39
$ns connect $udp38 $udp39


#node6-node11
set udp40 [new Agent/UDP]
$ns attach-agent $node_(6) $udp40
set udp41 [new Agent/UDP]
$ns attach-agent $node_(11) $udp41
$ns connect $udp40 $udp41
#node7-node9
set udp42 [new Agent/UDP]
$ns attach-agent $node_(7) $udp42
set udp43 [new Agent/UDP]
$ns attach-agent $node_(9) $udp43
$ns connect $udp42 $udp43
#node8-node2
set udp44 [new Agent/UDP]
$ns attach-agent $node_(8) $udp44
set udp45 [new Agent/UDP]
$ns attach-agent $node_(2) $udp45
$ns connect $udp44 $udp45
#node8-node13
set udp46 [new Agent/UDP]
$ns attach-agent $node_(8) $udp46
set udp47 [new Agent/UDP]
$ns attach-agent $node_(13) $udp47
$ns connect $udp46 $udp47
#node9-node4
set udp48 [new Agent/UDP]
$ns attach-agent $node_(9) $udp48
set udp49 [new Agent/UDP]
$ns attach-agent $node_(4) $udp49
$ns connect $udp48 $udp49
#node9-node15
set udp50 [new Agent/UDP]
$ns attach-agent $node_(9) $udp50
set udp51 [new Agent/UDP]
$ns attach-agent $node_(15) $udp51
$ns connect $udp50 $udp51
#node10-node6
set udp52 [new Agent/UDP]
$ns attach-agent $node_(10) $udp52
set udp53 [new Agent/UDP]
$ns attach-agent $node_(6) $udp53
$ns connect $udp52 $udp53
#node10-node11
set udp54 [new Agent/UDP]
$ns attach-agent $node_(10) $udp54
set udp55 [new Agent/UDP]
$ns attach-agent $node_(11) $udp55
$ns connect $udp54 $udp55
#node11-node2
set udp56 [new Agent/UDP]
$ns attach-agent $node_(11) $udp56
set udp57 [new Agent/UDP]
$ns attach-agent $node_(2) $udp57
$ns connect $udp56 $udp57
#node12-node6
set udp58 [new Agent/UDP]
$ns attach-agent $node_(12) $udp58
set udp59 [new Agent/UDP]
$ns attach-agent $node_(6) $udp59
$ns connect $udp58 $udp59
#node13-node7
set udp60 [new Agent/UDP]
$ns attach-agent $node_(13) $udp60
set udp61 [new Agent/UDP]
$ns attach-agent $node_(7) $udp61
$ns connect $udp60 $udp61
#node14-node8
set udp62 [new Agent/UDP]
$ns attach-agent $node_(14) $udp62
set udp63 [new Agent/UDP]
$ns attach-agent $node_(8) $udp63
$ns connect $udp62 $udp63
#node15-node2
set udp64 [new Agent/UDP]
$ns attach-agent $node_(15) $udp64
set udp65 [new Agent/UDP]
$ns attach-agent $node_(2) $udp65
$ns connect $udp64 $udp65



set m 0
set n 1


proc datasend {x y z} {
global m
global n
global ns val node_
set time1 1.0
#global ns

set udp($m) [new Agent/UDP]
$ns attach-agent $node_($x) $udp($m)
set udp($n) [new Agent/UDP]
$ns attach-agent $node_($y) $udp($n)
$ns connect $udp($m) $udp($n)
set curr_time [$ns now]
puts "$curr_time"
$ns at [expr $curr_time+$time1] "$udp($m) send 500 {Hi:$z}"
#$ns at [expr $curr_time+$time1+0.1] "strength($x,$y)"
#$ns at [expr $curr_time+$time1+0.2] "strength($y,$x)"
incr m
incr m
incr n
incr n
}




set g 0
set h 1



Agent/UDP instproc process_data {size data} {
   	global ns
	global g
	global h
	global udp
        global group	
        global strength 
  	global secgroup
        global groupcount
        global secgroupcount
        global udp0
   	global udp1
    	global udp2
    	global udp3	   	
    	global udp4
    	global udp5
    	global udp6
   	global udp7	 		   	
    	global udp8
    	global udp9	 		   	
    	global udp10
    	global udp11
    	global udp12	 		   	
    	global udp13
    	global udp14
	global udp15
	global udp16
	global udp17
	global udp18
	global udp19
	global udp20
	global udp21
	global udp22
	global udp23	
	global udp24
	global udp25
	global udp26
	global udp27
	global udp28
	global udp29
	global udp30
	global udp31
	global udp32
	global udp33
	global udp34
	global udp35
	global udp36
	global udp37
	global udp38
	global udp39
	global udp40
	global udp41
	global udp42
	global udp43
	global udp44
	global udp45
	global udp46
	global udp47
	global udp48
	global udp49
	global udp50
	global udp51
	global udp52
	global udp53
	global udp54
	global udp55
	global udp56
	global udp57
	global udp58
	global udp59
	global udp60
	global udp61
	global udp62
	global udp63
	global udp64
	global udp65
	global dbans
	$self instvar node_
	    

    
    # note in the trace file that the packet was received
    $ns trace-annotate "[$node_ node-addr] received {$data}"
    set flag1 "0"
    set flag "0"
    set str4 [$node_ node-addr]
    #Splitting fields
    puts "data:$data"
    set fields [split $data ":"]
    puts "fields:$fields"
    set message [lindex $fields 0]
    set recv [lindex $fields 1]
    puts "Receiver:$recv"
    set str4 [$node_ node-addr]
    puts "node:$str4"
puts "$groupcount($str4)"    
    if {$recv == $str4} {
       set sendflag 1}
    
    for {set j 0} {$j<$groupcount($str4)} {incr j} {
	if {$recv == $group($str4,$j)} {
          set sendflag 2}
	else{
        set sendflag 3}
 	}
	#else
        #set sendflag 3

set time2 1
set curr_time1 [$ns now]

 
    switch $sendflag {

        
        1 {puts"Message transfered to the destination"}
        
	2 {$ns at [expr $curr_time2+$time1] "datasend $str4 $recv $recv"


global ns val node_
set time1 1.0
#global ns

set udp($g) [new Agent/UDP]
$ns attach-agent $node_($str4) $udp($g)
set udp($h) [new Agent/UDP]
$ns attach-agent $node_($recv) $udp($h)
$ns connect $udp($g) $udp($h)
set curr_time [$ns now]
puts "$curr_time"
$ns at [expr $curr_time+$time1] "$udp($g) send 500 {Hi:$recv}"
#$ns at [expr $curr_time+$time1+0.1] "strength($x,$y)"
#$ns at [expr $curr_time+$time1+0.2] "strength($y,$x)"
incr g
incr g
incr h
incr h

}
 
        3 {for {set j 0} {$j<$secgroupcount($str4)} {incr j} {
	 	$ns at [expr $curr_time1+$time2] "datasend $str4 $secgroup($str4,$j) $recv"
	   	}  
	   }

    }







    
}

$ns at 0.5 "$udp0 send 500 {how are you:1}"
$ns at 0.6 "strength 0 1 1"
$ns at 0.6 "strength 1 0 1"
$ns at 0.5 "$udp2 send 500 {how are you:2}"
$ns at 0.6 "strength 0 2 1"
$ns at 0.6 "strength 2 0 1"
$ns at 0.7 "$udp4 send 500 {how are you:2}"
$ns at 0.8 "strength 0 2 2"
$ns at 0.8 "strength 2 0 2"
$ns at 0.9 "$udp6 send 500 {how are you:2}"
$ns at 1.0 "strength 0 2 3"
$ns at 1.0 "strength 2 0 3"
$ns at 1.1 "$udp8 send 500 {how are you:1}"
$ns at 1.2 "strength 0 1 7"
$ns at 1.2 "strength 1 0 7"
$ns at 1.3 "$udp10 send 500 {how are you:3}"
$ns at 1.4 "strength 2 3 1"
$ns at 1.4 "strength 3 2 1"
$ns at 1.4 "$udp12 send 500 {how are you:6}"
$ns at 1.5 "strength 2 6 1"
$ns at 1.5 "strength 6 2 1"
$ns at 1.5 "$udp14 send 500 {how are you:9}"
$ns at 1.6 "strength 2 9 1"
$ns at 1.6 "strength 9 2 1"
$ns at 1.6 "$udp16 send 500 {how are you:14}"
$ns at 1.8 "strength 2 14 2"
$ns at 1.8 "strength 14 2 2"
$ns at 1.6 "$udp18 send 500 {how are you:8}"
$ns at 1.9 "strength 3 8 3"
$ns at 1.9 "strength 8 3 3"
$ns at 1.7 "$udp20 send 500 {how are you:10}"
$ns at 2.4 "strength 3 10 7"
$ns at 2.4 "strength 10 3 7"
$ns at 1.7 "$udp22 send 500 {how are you:5}"
$ns at 1.8 "strength 3 5 1"
$ns at 1.8 "strength 5 3 1"
$ns at 1.8 "$udp24 send 500 {how are you:9}"
$ns at 1.9 "strength 3 9 1"
$ns at 1.9 "strength 9 3 1"
$ns at 1.8 "$udp26 send 500 {how are you:12}"
$ns at 1.9 "strength 4 12 1"
$ns at 1.9 "strength 12 4 1"
$ns at 1.9 "$udp28 send 500 {how are you:5}"
$ns at 2.1 "strength 4 5 2"
$ns at 2.1 "strength 5 4 2"
$ns at 2.0 "$udp30 send 500 {how are you:15}"
$ns at 2.3 "strength 4 15 3"
$ns at 2.3 "strength 15 4 3"
$ns at 2.0 "$udp32 send 500 {how are you:10}"
$ns at 2.7 "strength 4 10 7"
$ns at 2.7 "strength 10 4 7"
$ns at 2.1 "$udp34 send 500 {how are you:12}"
$ns at 2.2 "strength 5 12 1"
$ns at 2.2 "strength 12 5 1"
$ns at 2.1 "$udp36 send 500 {how are you:6}"
$ns at 2.2 "strength 5 6 1"
$ns at 2.2 "strength 6 5 1"
$ns at 2.2 "$udp38 send 500 {how are you:3}"
$ns at 2.3 "strength 5 3 1"
$ns at 2.3 "strength 3 5 1"
$ns at 2.3 "$udp40 send 500 {how are you:11}"
$ns at 2.5 "strength 6 11 2"
$ns at 2.5 "strength 11 6 2"
$ns at 2.3 "$udp42 send 500 {how are you:9}"
$ns at 2.6 "strength 7 9 3"
$ns at 2.6 "strength 9 7 3"
$ns at 2.4 "$udp44 send 500 {how are you:2}"
$ns at 3.1 "strength 8 2 7"
$ns at 3.1 "strength 2 8 7"
$ns at 3.4 "$udp46 send 500 {how are you:13}"
$ns at 3.5 "strength 8 13 1"
$ns at 3.5 "strength 13 8 1"
$ns at 3.4 "$udp48 send 500 {how are you:4}"
$ns at 3.6 "strength 9 4 2"
$ns at 3.6 "strength 4 9 2"
$ns at 3.5 "$udp50 send 500 {how are you:15}"
$ns at 3.6 "strength 9 15 1"
$ns at 3.6 "strength 15 9 1"
$ns at 3.6 "$udp52 send 500 {how are you:6}"
$ns at 3.8 "strength 10 6 2"
$ns at 3.8 "strength 6 10 2"
$ns at 3.6 "$udp54 send 500 {how are you:11}"
$ns at 3.9 "strength 10 11 3"
$ns at 3.9 "strength 11 10 3"
$ns at 3.7 "$udp56 send 500 {how are you:2}"
$ns at 4.4 "strength 11 2 7"
$ns at 4.4 "strength 2 11 7"
$ns at 3.7 "$udp58 send 500 {how are you:6}"
$ns at 3.6 "strength 12 6 1"
$ns at 3.6 "strength 6 12 1"
$ns at 3.8 "$udp60 send 500 {how are you:7}"
$ns at 3.9 "strength 13 7 1"
$ns at 3.9 "strength 7 13 1"
$ns at 3.9 "$udp62 send 500 {how are you:8}"
$ns at 4.1 "strength 14 8 2"
$ns at 4.1 "strength 8 14 2"
$ns at 4.0 "$udp64 send 500 {how are you:2}"
$ns at 4.3 "strength 15 2 3"
$ns at 4.3 "strength 2 15 3"
$ns at 4.3 "datasend 1 0 3"

$ns at 4.5 "grop 1"



#stop procedure..
$ns at $val(stop) "stop"
proc stop {} {
    global ns tracefd namtrace
    $ns flush-trace
    close $tracefd
    close $namtrace
exec nam wireless3.nam &
}

$ns run
