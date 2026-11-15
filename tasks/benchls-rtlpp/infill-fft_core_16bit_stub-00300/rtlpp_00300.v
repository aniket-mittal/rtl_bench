module rtlpp_00300 (
    clk,
    reset_n,
    inverse,
    sink_valid,
    sink_sop,
    sink_eop,
    sink_real,
    sink_imag,
    sink_error,
    source_ready,
    sink_ready,
    source_error,
    source_sop,
    source_eop,
    source_valid,
    source_exp,
    source_real,
    source_imag);

    input      clk;
    input      reset_n;
    input      inverse;
    input      sink_valid;
    input      sink_sop;
    input      sink_eop;
    input [15:0] sink_real;
    input [15:0] sink_imag;
    input [1:0] sink_error;
    input      source_ready;
    output     sink_ready;
    output [1:0] source_error;
    output     source_sop;
    output     source_eop;
    output     source_valid;
    output [5:0] source_exp;
    output [15:0] source_real;
    output [15:0] source_imag;

    // Add any internal signal declarations or additional logic here.
    reg sink_ready;
    reg [1:0] source_error;
    reg source_sop;
    reg source_eop;
    reg source_valid;
    reg [5:0] source_exp;
    reg [15:0] source_real;
    reg [15:0] source_imag;

    // Internal signals
    // Define your internal signals here based on the external module's internal logic.
    // Replace the signals and logic below with the actual signal definitions and logic from asj_fft_si_de_so_b_fft_130

    [MASKED]

endmodule