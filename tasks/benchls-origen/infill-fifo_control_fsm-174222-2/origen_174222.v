module origen_174222 (
    input op_clear,
    input wr_en,
    input rd_en,
    input [2:0] state,
    input [3:0] data_count,
    output reg [2:0] next_state
);

localparam INIT     = 3'b000;
localparam NO_OP    = 3'b001;
localparam WRITE    = 3'b010;
localparam WR_ERROR = 3'b011;
localparam READ     = 3'b100;
localparam RD_ERROR = 3'b101;

[MASKED]

endmodule