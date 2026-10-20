#!/usr/bin/env python3
"""Writes the IP-XACT (IEEE 1685-2014) library used by the SoC: bus def/abs def (AXI4-Lite subset), components
(picorv32_axi, axil_interconnect, axil_ram, sim_ctrl, axi_ascon) and the design soc_ascon (+ stub variant).
Hand-authored substitute for Kactus2 GUI work: Kactus2 3.13 in the container has no headless generator (see notes/11)."""
import os, sys
V, L = "cryptoaccel_team_chipathon26", "soc_lib"
NS = ('xmlns:ipxact="http://www.accellera.org/XMLSchema/IPXACT/1685-2014" '
      'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
      'xsi:schemaLocation="http://www.accellera.org/XMLSchema/IPXACT/1685-2014 http://www.accellera.org/XMLSchema/IPXACT/1685-2014/index.xsd"')
out = sys.argv[1]
def w(name, ver, kind, body):
    d = f"{out}/Library/{V}/{L}/{name}/{ver}"; os.makedirs(d, exist_ok=True)
    fn = {"comp": f"{name}.{ver}.xml", "bus": f"{name}.{ver}.xml", "abs": f"{name}.{ver}.xml", "design": f"{name}.{ver}.xml"}[kind]
    root = {"comp": "component", "bus": "busDefinition", "abs": "abstractionDefinition", "design": "design"}[kind]
    open(f"{d}/{fn}", "w").write(f'<?xml version="1.0" encoding="UTF-8"?>\n<ipxact:{root} {NS}>\n'
        f'\t<ipxact:vendor>{V}</ipxact:vendor>\n\t<ipxact:library>{L}</ipxact:library>\n\t<ipxact:name>{name}</ipxact:name>\n\t<ipxact:version>{ver}</ipxact:version>\n'
        f'{body}</ipxact:{root}>\n')
def ref(n, v="1.0"): return f'vendor="{V}" library="{L}" name="{n}" version="{v}"'

# ---- AXI4-Lite bus definition + abstraction definition ----
w("axi4lite", "1.0", "bus", "\t<ipxact:directConnection>true</ipxact:directConnection>\n\t<ipxact:isAddressable>true</ipxact:isAddressable>\n\t<ipxact:description>AXI4-Lite (subset used by this SoC)</ipxact:description>\n")
SIG = [("AWADDR", "m", 0), ("AWPROT", "m", 3), ("AWVALID", "m", 1), ("AWREADY", "s", 1), ("WDATA", "m", 32), ("WSTRB", "m", 4), ("WVALID", "m", 1),
       ("WREADY", "s", 1), ("BRESP", "s", 2), ("BVALID", "s", 1), ("BREADY", "m", 1), ("ARADDR", "m", 0), ("ARPROT", "m", 3), ("ARVALID", "m", 1),
       ("ARREADY", "s", 1), ("RDATA", "s", 32), ("RRESP", "s", 2), ("RVALID", "s", 1), ("RREADY", "m", 1)]
ab = f'\t<ipxact:busType {ref("axi4lite")}/>\n\t<ipxact:ports>\n'
for n, d, wd in SIG:
    ab += (f'\t\t<ipxact:port><ipxact:logicalName>{n}</ipxact:logicalName><ipxact:wire><ipxact:qualifier><ipxact:isData>{"true" if "DATA" in n else "false"}</ipxact:isData></ipxact:qualifier>'
           + "".join(f'<ipxact:onMaster><ipxact:presence>required</ipxact:presence><ipxact:direction>{"out" if d == "m" else "in"}</ipxact:direction></ipxact:onMaster>'
                     f'<ipxact:onSlave><ipxact:presence>required</ipxact:presence><ipxact:direction>{"in" if d == "m" else "out"}</ipxact:direction></ipxact:onSlave>' for _ in [0])
           + '</ipxact:wire></ipxact:port>\n')
w("axi4lite_rtl", "1.0", "abs", ab + "\t</ipxact:ports>\n")

def port(n, d, hi=None):
    v = f"<ipxact:vectors><ipxact:vector><ipxact:left>{hi}</ipxact:left><ipxact:right>0</ipxact:right></ipxact:vector></ipxact:vectors>" if hi else ""
    return f'\t\t\t<ipxact:port><ipxact:name>{n}</ipxact:name><ipxact:wire><ipxact:direction>{d}</ipxact:direction>{v}</ipxact:wire></ipxact:port>\n'
def axil_ports(pfx, ptab, role, aw):
    """ptab: logical -> physical name; role m/s. returns (ports xml, businterface xml)"""
    px = bx = ""
    for n, d, wd in SIG:
        pn = ptab(n); wid = aw if n.endswith("ADDR") else wd
        dr = ("out" if d == "m" else "in") if role == "m" else ("in" if d == "m" else "out")
        px += port(pn, dr, wid - 1 if wid > 1 else None)
    return px
def bif(name, role, ptab, desc=""):
    pm = "".join(f'<ipxact:portMap><ipxact:logicalPort><ipxact:name>{n}</ipxact:name></ipxact:logicalPort><ipxact:physicalPort><ipxact:name>{ptab(n)}</ipxact:name></ipxact:physicalPort></ipxact:portMap>' for n, _, _ in SIG)
    r = "<ipxact:master/>" if role == "m" else "<ipxact:slave/>"
    return (f'\t\t<ipxact:busInterface><ipxact:name>{name}</ipxact:name><ipxact:busType {ref("axi4lite")}/><ipxact:abstractionTypes><ipxact:abstractionType>'
            f'<ipxact:abstractionRef {ref("axi4lite_rtl")}/><ipxact:portMaps>{pm}</ipxact:portMaps></ipxact:abstractionType></ipxact:abstractionTypes>{r}</ipxact:busInterface>\n')
def comp(name, desc, files, busifs, ports, extra="", params=""):
    fs = "".join(f'\t\t\t<ipxact:file><ipxact:name>{f}</ipxact:name><ipxact:fileType>verilogSource</ipxact:fileType></ipxact:file>\n' for f in files)
    body = (f'\t<ipxact:busInterfaces>\n{busifs}\t</ipxact:busInterfaces>\n{extra}'
            f'\t<ipxact:model>\n\t\t<ipxact:views><ipxact:view><ipxact:name>rtl</ipxact:name><ipxact:componentInstantiationRef>i_rtl</ipxact:componentInstantiationRef></ipxact:view></ipxact:views>\n'
            f'\t\t<ipxact:instantiations><ipxact:componentInstantiation><ipxact:name>i_rtl</ipxact:name><ipxact:moduleName>{name}</ipxact:moduleName><ipxact:fileSetRef><ipxact:localName>rtl_files</ipxact:localName></ipxact:fileSetRef></ipxact:componentInstantiation></ipxact:instantiations>\n'
            f'\t\t<ipxact:ports>\n{ports}\t\t</ipxact:ports>\n\t</ipxact:model>\n'
            f'\t<ipxact:fileSets><ipxact:fileSet><ipxact:name>rtl_files</ipxact:name>\n{fs}\t\t</ipxact:fileSet></ipxact:fileSets>\n\t<ipxact:description>{desc}</ipxact:description>\n{params}')
    w(name, "1.0", "comp", body)

clkrst = port("clk", "in") + port("resetn", "in")
low = lambda p: (lambda n: p + n.lower())            # picorv32_axi: mem_axi_awaddr ...
up = lambda p: (lambda n: p + n)                     # axi_ascon: S_AXI_AWADDR ...
# CPU (PicoRV32 AXI master)
comp("picorv32_axi", "YosysHQ PicoRV32 RV32IM core with AXI4-Lite master (commit ef203c2)", ["third_party/picorv32/picorv32.v"],
     bif("mem_axi", "m", low("mem_axi_")), clkrst + port("trap", "out") + port("irq", "in", 31) + axil_ports("", low("mem_axi_"), "m", 32))
# interconnect: 1 slave in, 3 masters out -> expose as 1 s + 3 m bus interfaces
ic_ports = clkrst; ic_if = bif("s_axil", "s", low("s_axil_"))
ic_ports += axil_ports("", low("s_axil_"), "s", 32)
for i, nm in enumerate(["ram", "acc", "ctrl"]):
    t = (lambda nm: (lambda n: f"m_axil_{n.lower()}_{nm}"))(nm)
    ic_if += bif(f"m_{nm}", "m", t); ic_ports += axil_ports("", t, "m", 32)
comp("axil_interconnect", "alexforencich/verilog-axi axil_interconnect, S_COUNT=1 M_COUNT=3 (516bd5d); buses split per port in this view; map RAM 0x0/128K, ACC 0x4000_0000/128B, CTRL 0x5000_0000/64B",
     ["third_party/verilog-axi/rtl/axil_interconnect.v", "third_party/verilog-axi/rtl/arbiter.v", "third_party/verilog-axi/rtl/priority_encoder.v"], ic_if, ic_ports)
comp("axil_ram", "verilog-axi axil_ram 128 KiB", ["third_party/verilog-axi/rtl/axil_ram.v"], bif("s_axil", "s", low("s_axil_")), clkrst.replace("resetn", "rst") + axil_ports("", low("s_axil_"), "s", 17))
comp("sim_ctrl", "sim-only console/exit/accelerator-reset register block", ["rtl/sim_ctrl.v"], bif("s_axil", "s", lambda n: n.lower()),
     clkrst + port("acc_resetn", "out") + axil_ports("", lambda n: n.lower(), "s", 6))
# ASCON AXI4-Lite IP with memory map + registers
regs = [("KEY0", 0x00, "W", "key[31:0]"), ("KEY1", 0x04, "W", ""), ("KEY2", 0x08, "W", ""), ("KEY3", 0x0C, "W", ""),
        ("NONCE0", 0x10, "W", ""), ("NONCE1", 0x14, "W", ""), ("NONCE2", 0x18, "W", ""), ("NONCE3", 0x1C, "W", ""),
        ("CTRL", 0x20, "W", "bit0 start, bit1 dec_mode, bit2 ad_empty"), ("STATUS", 0x24, "R", "bit0 busy,1 done,2 auth_ok,3 in_ready,4 dout_ready"),
        ("BLK", 0x28, "W", "bit0 stream(0=AD,1=data), bit1 last, bits[6:2] bytes"),
        ("DIN0", 0x30, "W", ""), ("DIN1", 0x34, "W", ""), ("DIN2", 0x38, "W", ""), ("DIN3", 0x3C, "W", "write pushes block"),
        ("DOUT0", 0x40, "R", ""), ("DOUT1", 0x44, "R", ""), ("DOUT2", 0x48, "R", ""), ("DOUT3", 0x4C, "R", "read drains block"),
        ("TAG0", 0x50, "RW", "write: expected tag (dec); read: computed tag"), ("TAG1", 0x54, "RW", ""), ("TAG2", 0x58, "RW", ""), ("TAG3", 0x5C, "RW", "")]
acc = {"W": "write-only", "R": "read-only", "RW": "read-write"}
rx = "".join(f'<ipxact:register><ipxact:name>{n}</ipxact:name><ipxact:description>{d}</ipxact:description><ipxact:addressOffset>0x{o:X}</ipxact:addressOffset><ipxact:size>32</ipxact:size><ipxact:access>{acc[a]}</ipxact:access>'
             f'<ipxact:field><ipxact:name>value</ipxact:name><ipxact:bitOffset>0</ipxact:bitOffset><ipxact:bitWidth>32</ipxact:bitWidth></ipxact:field></ipxact:register>\n' for n, o, a, d in regs)
mm = (f'\t<ipxact:memoryMaps><ipxact:memoryMap><ipxact:name>ascon_regs</ipxact:name><ipxact:addressBlock><ipxact:name>regs</ipxact:name><ipxact:baseAddress>0x0</ipxact:baseAddress>'
      f'<ipxact:range>0x80</ipxact:range><ipxact:width>32</ipxact:width>\n{rx}</ipxact:addressBlock></ipxact:memoryMap></ipxact:memoryMaps>\n')
sb = bif("S_AXI", "s", up("S_AXI_")).replace("<ipxact:slave/>", "<ipxact:slave><ipxact:memoryMapRef memoryMapRef=\"ascon_regs\"/></ipxact:slave>")
comp("axi_ascon", "ASCON-AEAD128 AXI4-Lite slave (pd_closure/base/rtl/axi_ascon.v, unmodified)", ["pd_closure/base/rtl/axi_ascon.v", "pd_closure/base/rtl/ascon_core_adpt_encdec.v",
     "pd_closure/base/rtl/ascon_round_s1.v", "pd_closure/base/rtl/ascon_round_s2.v"], sb,
     port("S_AXI_ACLK", "in") + port("S_AXI_ARESETN", "in") + axil_ports("", up("S_AXI_"), "s", 7), mm.replace("\t<ipxact:memoryMaps>", "\t<ipxact:memoryMaps>"))
# stub
comp("axil_stub", "Placeholder slot: DECERR/zeros", ["rtl/axil_stub.v"], bif("s_axil", "s", lambda n: n.lower()), clkrst + axil_ports("", lambda n: n.lower(), "s", 7))

def design(name, acc_comp, acc_bus):
    inst = [("u_cpu", "picorv32_axi"), ("u_ic", "axil_interconnect"), ("u_ram", "axil_ram"), ("u_ctrl", "sim_ctrl"), ("u_acc", acc_comp)]
    ci = "".join(f'\t\t<ipxact:componentInstance><ipxact:instanceName>{i}</ipxact:instanceName><ipxact:componentRef {ref(c)}/></ipxact:componentInstance>\n' for i, c in inst)
    def con(n, a, ab, b, bb): return (f'\t\t<ipxact:interconnection><ipxact:name>{n}</ipxact:name><ipxact:activeInterface componentRef="{a}" busRef="{ab}"/>'
                                   f'<ipxact:activeInterface componentRef="{b}" busRef="{bb}"/></ipxact:interconnection>\n')
    ic = (con("cpu_to_ic", "u_cpu", "mem_axi", "u_ic", "s_axil") + con("ic_to_ram", "u_ic", "m_ram", "u_ram", "s_axil") +
          con("ic_to_acc", "u_ic", "m_acc", "u_acc", acc_bus) + con("ic_to_ctrl", "u_ic", "m_ctrl", "u_ctrl", "s_axil"))
    w(name, "1.0", "design", f'\t<ipxact:componentInstances>\n{ci}\t</ipxact:componentInstances>\n\t<ipxact:interconnections>\n{ic}\t</ipxact:interconnections>\n'
      '\t<ipxact:description>CPU(0x0 RAM, 0x4000_0000 accelerator slot, 0x5000_0000 sim console). Only u_acc differs between soc_ascon and soc_stub.</ipxact:description>\n')
design("soc_ascon", "axi_ascon", "S_AXI")
design("soc_stub", "axil_stub", "s_axil")
