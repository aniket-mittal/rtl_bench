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

    always @(posedge PCLK or negedge RESETn) begin
        if (!RESETn) begin
            state <= IDLE;
            ready <= 1'b0;
            data_r <= 8'b0;
            write_r <= 1'b0;
            done_r <= 1'b0;
            dout <= 8'b0;
            valid <= 1'b0;
            frame_done <= 1'b0;
        end else begin
            state <= next_state;
            ready <= init_done & ~VSYNC;
            data_r <= D;
            write_r <= (state == READING) & HREF & ~block;
            done_r <= (state == READING) & ~HREF & ~VSYNC;
            dout <= data_r;
            valid <= write_r & ~wr_delay;
            frame_done <= done_r;
        end
    end

    always @(*) begin
        case (state)
            IDLE: next_state = (ready & HREF) ? READING : IDLE;
            READING: next_state = (~HREF & ~VSYNC) ? IDLE : READING;
            default: next_state = IDLE;
        endcase
    end

endmodule