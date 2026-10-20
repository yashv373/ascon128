# Adapted minimally from YosysHQ/picorv32 Makefile (firmware rules + iverilog flow). Run inside hpretl/iic-osic-tools:chipathon26.
TC   = riscv64-unknown-elf-
PV   = third_party/picorv32
AXI  = third_party/verilog-axi/rtl
ROOT = ..
IP   = $(ROOT)/pd_closure/base/rtl
FW   = firmware/start.o firmware/irq.o firmware/print.o firmware/ascon_test.o
RTL  = rtl/soc_top.v rtl/soc_core.v rtl/sim_ctrl.v rtl/axil_stub.v tb/tb_soc.v $(PV)/picorv32.v \
       $(AXI)/axil_interconnect.v $(AXI)/axil_ram.v $(AXI)/arbiter.v $(AXI)/priority_encoder.v \
       $(IP)/axi_ascon.v $(IP)/ascon_core_adpt_encdec.v $(IP)/ascon_round_s1.v $(IP)/ascon_round_s2.v

all: logs/soc_ascon.log logs/soc_stub.log
logs/soc_ascon.log: soc_ascon.vvp firmware/firmware.hex
	mkdir -p logs; cp firmware/firmware.hex fw.hex; stdbuf -oL vvp -N $< $(VVPFLAGS) | tee $@
logs/soc_stub.log: soc_stub.vvp firmware/firmware.hex
	mkdir -p logs; cp firmware/firmware.hex fw.hex; stdbuf -oL vvp -N $< $(VVPFLAGS) | tee $@
soc_ascon.vvp: $(RTL)
	iverilog -g2012 -o $@ -s tb_soc -Ptb_soc.ASCON_PRESENT=1 $^
soc_stub.vvp: $(RTL)
	iverilog -g2012 -o $@ -s tb_soc -Ptb_soc.ASCON_PRESENT=0 $^
firmware/vectors.h: firmware/gen_vectors.py
	python3 $< $(ROOT) > $@
firmware/firmware.hex: firmware/firmware.bin firmware/makehex.py
	python3 firmware/makehex.py $< 32768 > $@
firmware/firmware.bin: firmware/firmware.elf
	$(TC)objcopy -O binary $< $@
firmware/firmware.elf: $(FW) firmware/sections.lds
	$(TC)gcc -Os -mabi=ilp32 -march=rv32im -ffreestanding -nostdlib -o $@ \
		-Wl,--build-id=none,-Bstatic,-T,firmware/sections.lds,-Map,firmware/firmware.map,--strip-debug $(FW) -lgcc
firmware/start.o: firmware/start.S
	$(TC)gcc -c -DENABLE_ASCON -mabi=ilp32 -march=rv32im -o $@ $<
firmware/ascon_test.o: firmware/ascon_test.c firmware/vectors.h
	$(TC)gcc -c -mabi=ilp32 -march=rv32i_zicsr -Os --std=c99 -ffreestanding -nostdlib -fno-tree-loop-distribute-patterns -o $@ $<
firmware/%.o: firmware/%.c
	$(TC)gcc -c -mabi=ilp32 -march=rv32i -Os --std=c99 -ffreestanding -nostdlib -o $@ $<
clean:
	rm -f firmware/*.o firmware/firmware.* *.vvp fw.hex
