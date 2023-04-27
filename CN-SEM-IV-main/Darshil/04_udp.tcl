//constant bit rate

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

$ns connect $tcp %sink


set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns at 1.0 "$ftp start"
$ns at 2.0 "$ftp stop"


set udp[new Agent/UDP]
$ns attach-agent $n0 udp

set null[new Agent/Null]
$ns attach-agent #n3 $null

set cbr[new Application/Traffic/CBR]
$cbr attach-agent $udp

$ns at 1.0 $"cbr start"
stop//similarly


$nf at 5.0 "finish"

$ns run