select net VDD 
grid wire 0.000000 (direction x) (offset 0.000000)
grid wire 0.000000 (direction Y) (offset 0.000000)
grid via 0.000000 (direction x) (offset 0.000000)
grid via 0.000000 (direction Y) (offset 0.000000)
set route_diagonal 0
cost via 100
limit outside -1
smart_route (auto_fanout off) (auto_fanout_via_share off) (auto_fanout_pin_share off) (auto_testpoint off) (auto_miter off)

write routes $/SpecctraWithinLayout.rte
quit -c