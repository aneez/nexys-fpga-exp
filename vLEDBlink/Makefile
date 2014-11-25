SRC = LEDBlink.v
CON = LEDBlink.ucf 
all: LEDBlink.bit
clean:
	rm -rf Ledblink_tb_beh.prj Ledblink_tb_isim_beh.exe isim fuse.log isim.log isim.cmd Ledblink_tb_isim_beh.wdb LedBlink.stx \
		LedBlink_summary.html LedBlink.xst LedBlink.lso LedBlink.syr LedBlink_xst.xrpt LedBlink.prj webtalk_pn.xml LedBlink.ngc \
		LedBlink.ngr xst LedBlink.cmd_log xst.xmsgs LedBlink.ngd LedBlink.bld LedBlink_ngdbuild.xrpt _ngo xlnx_auto_0_xdb \
		ngdbuild.xmsgs LedBlink_map.map LedBlink_map.mrp LedBlink_map.xrpt LedBlink_map.ncd LedBlink.pcf LedBlink_map.ngm \
		LedBlink_usage.xml LedBlink_summary.xml map.xmsgs LedBlink.ncd LedBlink.pad LedBlink.par LedBlink.unroutes LedBlink.xpi \
		LedBlink_par.xrpt LedBlink_pad.txt LedBlink_pad.csv LedBlink.ptwx par.xmsgs LedBlink.twr LedBlink.twx trce.xmsgs xilinxsim.ini



LEDBlink.prj: $(SRC)
	rm -f LEDBlink.prj
	@for i in `echo $^`; do \
	echo "verilog work $$i" >> LEDBlink.prj; \
	done

LEDBlink.ngc: LEDBlink.prj
	xst -ifn LEDBlink.xst

LEDBlink.ngd: LEDBlink.ngc $(CON)
	ngdbuild -uc $(CON) LEDBlink.ngc

LEDBlink.ncd:LEDBlink.ngd
	map LEDBlink.ngd

LEDBlink-routed.ncd: LEDBlink.ncd
	par -ol high -w LEDBlink.ncd LEDBlink-routed.ncd

LEDBlink.bit: LEDBlink-routed.ncd
	bitgen -w LEDBlink-routed.ncd LEDBlink.bit

upload:
	djtgcfg prog -d Nexys2 -i 1 -f LEDBlink.bit

