v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {used to run ngspice sweep in parallel} 1440 -1000 0 0 0.3 0.3 {layer=11}
T {each printed value will be saved in csv file} 1800 -540 0 0 0.3 0.3 {layer=11}
T {set num_threads to 1 for small circuits} 1710 -760 0 0 0.3 0.3 {layer=11}
N 30 -350 30 -330 {
lab=GND}
N 260 -210 260 -200 {
lab=GND}
N 30 -450 30 -410 {
lab=vdd}
N 260 -290 260 -270 {
lab=V_in}
N 720 -630 720 -610 {
lab=V_out1}
N 700 -630 720 -630 {lab=V_out1}
N 720 -660 720 -630 {
lab=V_out1}
N 350 -630 380 -630 {lab=V_in}
N 540 -630 640 -630 {lab=#net1}
N 460 -710 460 -670 {lab=GND}
N 460 -590 460 -560 {lab=vdd}
N 400 -690 400 -670 {lab=vdd}
N 400 -590 400 -570 {lab=GND}
C {devices/title.sym} 245 -55 0 0 {name=l5 author="Jorge Marin (based on testbench by K. Herman/IHP)"}
C {simulator_commands_shown.sym} 1435 -915 0 0 {name=SWEEP_SIM
simulator=ngspice
only_toplevel=false 
value="
.param temp=27
.param mn_w=36.0u
.param mp_w=90.0u

.param temp=27
.param Iload=500u
.control
save all 

set num_threads 1
dc I0 -5m 5m 1.1u

let Ron=(V(V_in)-V(V_out1))/I(Vp2)
meas dc Ronmax max Ron 
echo results_sweep_begin
print Ronmax
echo results_sweep_end
set color0=white
set color1=black
set color2=red
set color3=blue
set color4=green
plot Ron title 'RON resistance' xlabel 'current' ylabel 'Ron'
.endc
"
}
C {devices/vsource.sym} 30 -380 0 0 {name=Vpow value=1.2}
C {devices/gnd.sym} 30 -330 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} 260 -240 0 0 {name=Vin value=0.1}
C {devices/gnd.sym} 260 -200 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 260 -290 1 0 {name=p6 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 720 -660 1 0 {name=p8 sig_type=std_logic lab=V_out1}
C {devices/lab_pin.sym} 30 -450 1 0 {name=p9 sig_type=std_logic lab=vdd}
C {devices/isource.sym} 720 -580 0 0 {name=I0 value=\{Iload\}}
C {devices/ammeter.sym} 670 -630 3 0 {name=Vp2}
C {devices/vsource.sym} 720 -520 0 0 {name=Vin1 value=0.1}
C {devices/gnd.sym} 720 -490 0 0 {name=l1 lab=GND}
C {devices/iopin.sym} 350 -630 0 1 {name=p2 lab=V_in}
C {transmission_gate.sym} 460 -630 0 0 {name=x1}
C {lab_pin.sym} 400 -690 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 400 -570 0 0 {name=p5 sig_type=std_logic lab=GND}
C {lab_pin.sym} 460 -710 0 0 {name=p3 sig_type=std_logic lab=GND}
C {lab_pin.sym} 460 -560 0 0 {name=p11 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} 590 -340 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
