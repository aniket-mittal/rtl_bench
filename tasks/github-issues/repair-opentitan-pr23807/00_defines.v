// Added by the task converter: compile the synthesis view of the design in every tool.
// Yosys defines SYNTHESIS itself; this makes iverilog skip the same simulation-only code.
`ifndef SYNTHESIS
`define SYNTHESIS
`endif
