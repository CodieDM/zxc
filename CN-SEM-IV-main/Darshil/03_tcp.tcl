set ns [new Simulator]
set nf [open filename.nam w]
$ns namtrace-all $nf

proc finish{}{
    global ns nf
    $ns flush-trace
    close $nf
    exec nam filename &
    exit 0
}

set n1[$ns node]

$ns  duplex-link $n1 $n2 10Mb 10ms DropTail
options

set tcp [new Agent/TCP]
$tcp set class_2
$ns attach-agent $n1 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink


set ftp [new Application/TCP]
$ftp attach-agent $tcp

$ns at 1.0 "$ftp start"
$ns at 2.0 "$ftp stop"


$nf at 5.0 "finish"

$ns run










































set ns[new Simulator]

set nf [open filename w]
$ns namtrace-all $nf

proc finish{}{
    global ns nf
    $ns flushtrace
    close $nf
    exec nam filename &
    exit 0
}

set n1[$ns node]

suplec-link $n1 $n2 10Mb 10ms DropTail

set tcp[new Agent/TCP]
$ns connect-agent $n0 $tcp

set sink[new Agent.TCPSink]
$ns connect-agent $n3 $sink

set ftp[new Application/TCP]

connect

$ns at 3.0 "finish"

$ns run