module origen_124174 (
    input wire clock,
    input wire reset,
    input wire internal_output_is_valid,
    input wire ena,
    input wire ready_out,
    output reg stall,
    output reg valid_out,
    output reg [7:0] data_out,
    output reg eop_out,
    output reg sop_out
);

    reg [7:0] data_reg;
    reg eop_reg;
    reg sop_reg;
    reg valid_reg;

    [MASKED]

endmodule