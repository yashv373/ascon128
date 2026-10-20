# Clock-gated PD: not clean

Synthesis with `clockgate` (34 ICGs, 2442/2585 flops gated) works and passes zero-delay GLS vs RTL, but none of the 7 PD runs
reached signoff: see ITERATIONS.md (DRT-0073 antenna/re-route crashes, SS setup violations on clock-gating-check paths, LVS ~330 errors).
Published as a record of attempts only; the clean results are in ../push (23 MHz) and ../closure (20 MHz).
