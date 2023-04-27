set ns [new Simulation]  // S capital

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

//$ns duplex-link $n0 $n2 bandwisth latency and queue
$ns duplex-link $n0 $n2 10Mb 10ms DropTail
$ns duplex-link $n1 $n2 10Mb 10ms DropTail
$ns duplex-link $n2 $n3 10Mb 10ms DropTail

//options
$ns duplex-link-op $n0 $n2 orient right-down 
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right

$ns run

///////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//for nam

set ns [new Simulator]  // S capital

set nf [open 02_starTop.nam w] // new
$ns namtrace-all $nf  //trace everything in ns and store in nf

proc finish{}{
    global ns nf
    $ns flush-trace
    close $nf
    exec nam 02_starTop.nam &
    exit 0
}


set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

//$ns duplex-link $n0 $n2 bandwisth latency and queue
$ns duplex-link $n0 $n2 10Mb 10ms DropTail
$ns duplex-link $n1 $n2 10Mb 10ms DropTail
$ns duplex-link $n2 $n3 10Mb 10ms DropTail

//options
$ns duplex-link-op $n0 $n2 orient right-down 
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right

$ns at 1.0 "finish" //call procedure

$ns run



































set ns [new Simulator]
set nf[ open filename.nam w]
$ns namtrace-all $nf      //trace everything in ns and store in nf

proc finish{}{
    global $ns $nf
    $ns flush-trace 
    close $nf
    exec nam filename.nam &
    exit 0
}

set n1[ $ns node]

$ns duplex-link $n1 $ n0 10Mb 10ms DropTail
op-orient

$ns at 1 "finish"
$ns run


