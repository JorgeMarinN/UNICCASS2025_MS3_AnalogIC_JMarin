v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 690 -370 720 -370 {lab=V_in}
N 880 -370 930 -370 {lab=#net1}
N 800 -450 800 -410 {lab=GND}
N 800 -330 800 -300 {lab=vdd}
N 740 -430 740 -410 {lab=vdd}
N 740 -330 740 -310 {lab=GND}
N 1010 -370 1010 -350 {
lab=V_out1}
N 1010 -290 1010 -260 {
lab=GND}
N 990 -370 1010 -370 {lab=V_out1}
N 1010 -400 1010 -370 {
lab=V_out1}
N 510 -590 510 -580 {
lab=GND}
N 510 -670 510 -650 {
lab=V_in}
N 600 -590 600 -580 {
lab=GND}
N 600 -670 600 -650 {
lab=vdd}
C {devices/code_shown.sym} 210 -650 0 0 {name=NGSPICE
only_toplevel=true
value="
.param temp=27
.param Iload=1m
*.param m1_w=10u
*.param m2_w=10u
.control
save all 
*dc I0 -10m 10m 11u
dc Vin 0 1.2 0.05
let Ron=(V(V_in)-V(V_out1))/I(Vp2)
*write dc_RON.raw
plot ron

.endc
" }
C {devices/iopin.sym} 690 -370 0 1 {name=p2 lab=V_in}
C {devices/code_shown.sym} 210 -340 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {transmission_gate.sym} 800 -370 0 0 {name=x1}
C {lab_pin.sym} 740 -430 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 740 -310 0 0 {name=p5 sig_type=std_logic lab=GND}
C {lab_pin.sym} 800 -450 0 0 {name=p3 sig_type=std_logic lab=GND}
C {lab_pin.sym} 800 -300 0 0 {name=p12 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 1010 -400 1 0 {name=p6 sig_type=std_logic lab=V_out1}
C {devices/isource.sym} 1010 -320 0 0 {name=I0 value=\{Iload\}}
C {devices/gnd.sym} 1010 -260 0 0 {name=l6 lab=GND}
C {devices/ammeter.sym} 960 -370 3 0 {name=Vp2}
C {devices/vsource.sym} 510 -620 0 0 {name=Vin value=0.1}
C {devices/gnd.sym} 510 -580 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 510 -670 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/vsource.sym} 600 -620 0 0 {name=Vdd value=1.2}
C {devices/gnd.sym} 600 -580 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 600 -670 1 0 {name=p7 sig_type=std_logic lab=vdd}
