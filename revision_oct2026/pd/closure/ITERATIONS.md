# Iterations
| # | MHz | change | setup WS ss/tt/ff | hold WS ss/tt/ff | slew/cap/fanout viol | DRC/LVS | verdict |
|---|---|---|---|---|---|---|---|
| 1 | 16 | clock_groups async + SCLK 1250ns | - | - | - | - | FAIL: DRT-0073 no access point for 5 ANTENNA diodes on clkbuf_6_* inputs (detail route crash, before STA) |
| 2 | 16 | iter_1 + DIODE_PADDING 4 | - | - | - | - | FAIL: DPL-0036 detailed placement failed in post-GRT resizer (step 41) |

NOTE (template fix): cfg.tmpl differed from signed-off resolved.json in: PDN_CORE_RING (signoff True, mine False), PDN_V/HPITCH (50 vs 90), PDN_VERTICAL/HORIZONTAL_LAYER (Metal4/Metal5 vs Metal2/Metal3), IO_PIN_V/H_LAYER (Metal2/Metal3 vs Metal4/Metal4), RUN_LINTER (True vs False); the config yaml file in the repo had been edited after sign-off. iter_1/2 used the wrong template and are void. iter_3 = CONTROL: fixed template + ORIGINAL SDC at 16 MHz, must reproduce signoff.
| 3 (control) | 16 | fixed template (matches resolved.json) + ORIGINAL SDC | ss 13.45 / tt 37.77 / ff 47.99 | ss -0.083 / tt -0.014 / ff +0.007 | slew 240 (ss) / cap 0 / fanout 0 | DRC 0 / LVS 0 / antenna 0 | Reproduces signoff except 2 HOLD violations (ss, tt) - the sclk->clk CDC hold. Baseline for ramp. |
| 4 | 20 | corrected template + async clock groups, SCLK 1250ns fixed | ss 0.747 / tt 25.32 / ff 35.53 | ss +0.0036 / tt +0.051 / ff +0.044 | slew 234 (ss, warnings) / cap 0 / fanout 0 | DRC 0 / LVS 0 / antenna 0 | CLEAN (flow exit 0); CDC holds cleared. best/ = this |
| 5 | 25 | iter_4 + MAX_TRANSITION 3.0, MAX_FANOUT 8, REPAIR_SLEW_PCT 20 | ss -6.86 / tt +16.6 / ff +26.3 | ss -0.589 / tt -0.250 / ff -0.128 (mosi->sclk flop hold) | slew 6937 ss, 64 tt / cap 0 / fanout 0 | DRC 0 / LVS 0 | FAIL: setup 125 viol on same st-fanout buf chain; tight slew limit made things worse, input hold broke |
| 6 | 25 | iter_4 + exclude buf_1/clkbuf_1 + REPAIR_WIRE_LENGTH 400 | - | - | - | - | FAIL: DRT-0073 no access point (antenna diodes on clkbuf_6_*, clkbuf_0_sclk) in detailed route; flow-fragility, no STA |
| 7 | 25 | iter_6 + HEURISTIC_ANTENNA_THRESHOLD 400 | - | - | - | - | FAIL: DRT-0073 again (101 msgs, diodes on clkbuf outputs); ramp abandoned, last run used for adversarial SDC variant |
| 8a | 20 | iter_4 + SDC: set_max_delay -datapath_only (instead of clock_groups) | - | - | - | - | FAIL at step 12: OpenSTA rejects -datapath_only; rerun with plain set_max_delay |
| 8b | 20 | iter_4 but CDC: set_max_delay 1 clk period each way + hold false paths (no blanket clock_groups) | ss 0.747 / tt 25.32 / ff 35.53 | ss +0.0036 / tt +0.051 / ff +0.044 | slew 234 (ss) / cap 0 / fanout 0 | DRC 0 / LVS 0 / antenna 0 | CLEAN (exit 0). CDC paths now timed: worst clk->sclk arrival 7.55 ns vs 50 ns max_delay. Slacks identical to iter_4 (critical paths are clk->clk; deterministic flow). best/ = this; iter_4 kept in best/iter4_clockgroups |

Slew check (iter_4/8): worst SS slew 9.32 ns (nor4_1 out) > SDC 6.0 ns target, < liberty max_transition 15.6 ns = largest input_transition index -> no transition-axis extrapolation (load axis not checked).
Hold: SDC set_clock_uncertainty 0.5 (no -setup/-hold qualifier -> applies to both); reported hold WS is after 0.5 ns.
| 8 | 20 | iter_4 config + SDC: set_max_delay (one clk period, both ways) + hold false paths instead of clock_groups | ss 0.747 / tt 25.32 / ff 35.53 | ss +0.0036 / tt +0.051 / ff +0.044 | slew 234 (ss) / cap 0 / fanout 0 | DRC 0 / LVS 0 / antenna 0 | CLEAN, exit 0; best/ |
| 9 | 16 | exactly iter_8 config+SDC, CLOCK_PERIOD 62.5 | ss 13.25 / tt 37.82 / ff 48.03 | ss +0.0036 / tt +0.051 / ff +0.044 | slew 234 (ss) / cap 0 / fanout 0 | DRC 0 / LVS 0 / antenna 0 | CLEAN, exit 0 |
Same-config sweep: 16 clean, 20 clean, 25 fail (iter_5/6/7 used different levers).
Slew check (iter_4/8, SS): worst 9.32 ns (nor4_1 out) vs SDC 6.0; liberty max_transition and max input-transition table index both 15.6 ns -> no extrapolation on that axis (load axis unchecked). Hold WS is after 0.5 ns uncertainty (SDC set_clock_uncertainty 0.5 both clocks).
| 10 | 22 | best/ + SYNTH_STRATEGY DELAY 2 + density 42 | ss -36.58 (TNS -8536, 803 viol) / tt +5.14 / ff +22.50 | ss +0.544 / tt +0.305 / ff +0.189 | slew 346 (ss, warnings) / cap 0 / fanout 0 | DRC 0 / LVS 0 / antenna 0 | FAIL: flow exit 0, but SS setup WS -36.6 ns; tt/ff met. Not clean; best/ untouched |
