Mac/802_11 set basicRate_ 2Mb              ;#Rate for Control Frames
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 20                         ;# max packet in ifq
set val(nn)     50                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      1000                      ;# X dimension of topography
set val(y)      300                      ;# Y dimension of topography
set val(stop)   500.0                         ;# time of simulation end

#===================================
#        Initialization       
#===================================
#Create a ns simulator
set ns [new Simulator]

# define color index
$ns color 0 red
$ns color 1 blue
$ns color 2 chocolate
$ns color 3 red
$ns color 4 brown
$ns color 5 tan
$ns color 6 gold
$ns color 7 black


#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open dos.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open dos.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON

#===================================
#        Nodes Definition       
#===================================
#Create 50 nodes
set n0 [$ns node]
$n0 set X_ 815
$n0 set Y_ 300
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20
set n1 [$ns node]
$n1 set X_ 904
$n1 set Y_ 234
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
set n2 [$ns node]
$n2 set X_ 122
$n2 set Y_ 397
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
set n3 [$ns node]
$n3 set X_ 110
$n3 set Y_ 266
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
set n4 [$ns node]
$n4 set X_ 225
$n4 set Y_ 50
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
set n5 [$ns node]
$n5 set X_ 670
$n5 set Y_ 102
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
set n6 [$ns node]
$n6 set X_ 713
$n6 set Y_ 245
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20
set n7 [$ns node]
$n7 set X_ 727
$n7 set Y_ 71
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20
set n8 [$ns node]
$n8 set X_ 963
$n8 set Y_ 8
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20
set n9 [$ns node]
$n9 set X_ 510
$n9 set Y_ 295
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20
set n10 [$ns node]
$n10 set X_ 770
$n10 set Y_ 211
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20
set n11 [$ns node]
$n11 set X_ 692
$n11 set Y_ 230
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20
set n12 [$ns node]
$n12 set X_ 987
$n12 set Y_ 264
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20
set n13 [$ns node]
$n13 set X_ 483
$n13 set Y_ 16
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20
set n14 [$ns node]
$n14 set X_ 526
$n14 set Y_ 38
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20
set n15 [$ns node]
$n15 set X_ 433
$n15 set Y_ 121
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20
set n16 [$ns node]
$n16 set X_ 141
$n16 set Y_ 30
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20
set n17 [$ns node]
$n17 set X_ 124
$n17 set Y_ 86
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20
set n18 [$ns node]
$n18 set X_ 182
$n18 set Y_ 261
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20
set n19 [$ns node]
$n19 set X_ 149
$n19 set Y_ 282
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20
set n20 [$ns node]
$n20 set X_ 319
$n20 set Y_ 46
$n20 set Z_ 0.0
$ns initial_node_pos $n20 20
set n21 [$ns node]
$n21 set X_ 394
$n21 set Y_ 279
$n21 set Z_ 0.0
$ns initial_node_pos $n21 20
set n22 [$ns node]
$n22 set X_ 440
$n22 set Y_ 372
$n22 set Z_ 0.0
$ns initial_node_pos $n22 20
set n23 [$ns node]
$n23 set X_ 124
$n23 set Y_ 238
$n23 set Z_ 0.0
$ns initial_node_pos $n23 20
set n24 [$ns node]
$n24 set X_ 902
$n24 set Y_ 287
$n24 set Z_ 0.0
$ns initial_node_pos $n24 20
set n25 [$ns node]
$n25 set X_ 970
$n25 set Y_ 76
$n25 set Z_ 0.0
$ns initial_node_pos $n25 20
set n26 [$ns node]
$n26 set X_ 71
$n26 set Y_ 51
$n26 set Z_ 0.0
$ns initial_node_pos $n26 20
set n27 [$ns node]
$n27 set X_ 507
$n27 set Y_ 30
$n27 set Z_ 0.0
$ns initial_node_pos $n27 20
set n28 [$ns node]
$n28 set X_ 866
$n28 set Y_ 34
$n28 set Z_ 0.0
$ns initial_node_pos $n28 20
set n29 [$ns node]
$n29 set X_ 173
$n29 set Y_ 44
$n29 set Z_ 0.0
$ns initial_node_pos $n29 20
set n30 [$ns node]
$n30 set X_ 334
$n30 set Y_ 02
$n30 set Z_ 0.0
$ns initial_node_pos $n30 20
set n31 [$ns node]
$n31 set X_ 645
$n31 set Y_ 270
$n31 set Z_ 0.0
$ns initial_node_pos $n31 20
set n32 [$ns node]
$n32 set X_ 824
$n32 set Y_ 300
$n32 set Z_ 0.0
$ns initial_node_pos $n32 20
set n33 [$ns node]
$n33 set X_ 963
$n33 set Y_ 46
$n33 set Z_ 0.0
$ns initial_node_pos $n33 20
set n34 [$ns node]
$n34 set X_ 389
$n34 set Y_ 3
$n34 set Z_ 0.0
$ns initial_node_pos $n34 20
set n35 [$ns node]
$n35 set X_ 145
$n35 set Y_ 48
$n35 set Z_ 0.0
$ns initial_node_pos $n35 20
set n36 [$ns node]
$n36 set X_ 110
$n36 set Y_ 53
$n36 set Z_ 0.0
$ns initial_node_pos $n36 20
set n37 [$ns node]
$n37 set X_ 121
$n37 set Y_ 51
$n37 set Z_ 0.0
$ns initial_node_pos $n37 20
set n38 [$ns node]
$n38 set X_ 788
$n38 set Y_ 44
$n38 set Z_ 0.0
$ns initial_node_pos $n38 20
set n39 [$ns node]
$n39 set X_ 797
$n39 set Y_ 02
$n39 set Z_ 0.0
$ns initial_node_pos $n39 20
set n40 [$ns node]
$n40 set X_ 1472
$n40 set Y_  15
$n40 set Z_ 0.0
$ns initial_node_pos $n40 20
set n41 [$ns node]
$n41 set X_ 526
$n41 set Y_  90
$n41 set Z_ 0.0
$ns initial_node_pos $n41 20
set n42 [$ns node]
$n42 set X_ 103
$n42 set Y_ 77
$n42 set Z_ 0.0
$ns initial_node_pos $n42 20
set n43 [$ns node]
$n43 set X_ 123
$n43 set Y_ 86
$n43 set Z_ 0.0
$ns initial_node_pos $n43 20
set n44 [$ns node]
$n44 set X_ 123
$n44 set Y_ -34
$n44 set Z_ 0.0
$ns initial_node_pos $n44 20
set n45 [$ns node]
$n45 set X_ 343
$n45 set Y_ -166
$n45 set Z_ 0.0
$ns initial_node_pos $n45 20
set n46 [$ns node]
$n46 set X_ 905
$n46 set Y_ -214
$n46 set Z_ 0.0
$ns initial_node_pos $n46 20
set n47 [$ns node]
$n47 set X_ 880
$n47 set Y_ -47
$n47 set Z_ 0.0
$ns initial_node_pos $n47 20
set n48 [$ns node]
$n48 set X_ 423
$n48 set Y_ -44
$n48 set Z_ 0.0
$ns initial_node_pos $n48 20
set n49 [$ns node]
$n49 set X_ 154
$n49 set Y_ -114
$n49 set Z_ 0.0
$ns initial_node_pos $n49 20

#===================================
#        Generate movement         
#===================================


$ns at 1 " $n0 setdest 350 10 5 "
$ns at 1 " $n45 setdest 450 200 5 "
$ns at 4 " $n1 setdest 10 30 10 "
$ns at 20 " $n2 setdest 150 50 7 "
$ns at 10 " $n3 setdest 867 33 7 "
$ns at 10 " $n7 setdest 45 40 15 "
$ns at 87 " $n8 setdest 816 30 4 "

$ns at 107 " $n48 setdest 100 30 4 "

$ns at 87 " $n8 setdest 901 200 6 "
$ns at 300 " $n35 setdest 826 30 9 "   
$ns at 40 " $n39 setdest 150 150 7 "
$ns at 200 " $n25 setdest 450 175 7 "
$ns at 260 " $n32 setdest 950 60 7 "
$ns at 120 " $n29 setdest 150 250 7 "
$ns at 20 " $n12 setdest 999 250 7 "
$ns at 20 " $n42 setdest 150  245 7 "
$ns at 87 " $n21 setdest 924 112 6 "
$ns at 87 " $n10 setdest 659 12 6 "
$ns at 87 " $n18 setdest 109 020 6 "
$ns at 300 " $n35 setdest 268 30 9 "   
$ns at 40 " $n9 setdest 150 150 7 "
$ns at 200 " $n34 setdest 450 75 7 "
$ns at 260 " $n36 setdest 950 65 7 "

$ns at 120 " $n11 setdest 120 250 7 "
$ns at 20 " $n15 setdest 100 100 7 "
$ns at 20 " $n15 setdest 150  135 7 "



    
#===================================
#        Agents Definition       
#===================================




set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n15 $tcp
$ns attach-agent $n34 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 3.0 "$ftp start"


set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n1 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 5.0 "$ftp start"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $tcp
$ns attach-agent $n10 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 50.0 "$ftp start"

set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n40 $tcp
$ns attach-agent $n12 $sink
$ns connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns at 55.0 "$ftp start"

# In ns TCP connection will be green
$tcp set fid_ 1

# To establish FTP application  tcp connection above
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

# Establish a UDP connection
set udp [new Agent/UDP]
$ns attach-agent $n1 $udp
set null [new Agent/Null]
$ns attach-agent $n4 $null
$ns connect $udp $null

# Udp nam in connection red
$udp set fid_ 2

#===================================
#        Applications Definition       
#===================================
# CBR application created on top of UDP connections
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 1mb
$cbr set random_ false


#===================================
#        Termination       
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam dos.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run