module origen_069214 (
    input wire RESETn,
    input wire PCLK,
    input wire VSYNC,
    input wire HREF,
    input wire [7:0] D,
    input wire block,
    input wire wr_delay,
    input wire init_done,
    output reg [7:0] dout,
    output reg valid,
    output reg frame_done
);

    localparam IDLE = 1'b0;
    localparam READING = 1'b1;

    reg state, next_state;
    reg ready;
    reg [7:0] data_r;
    reg write_r, done_r;

    [MASKED]

    always @(*) begin
        case (state)
            IDLE: next_state = (ready & HREF) ? READING : IDLE;
            READING: next_state = (~HREF & ~VSYNC) ? IDLE : READING;
            default: next_state = IDLE;
        endcase
    end

endmodule