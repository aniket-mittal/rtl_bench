module origen_216125 (
    input clk,
    input rst_n,
    input A,
    output reg K1,
    output reg K2
);

    localparam IDEL   = 2'b00;
    localparam START  = 2'b01;
    localparam STOP   = 2'b10;
    localparam CLEAR  = 2'b11;

    reg [1:0] state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDEL;
            K1 <= 1'b0;
            K2 <= 1'b0;
        end else begin
            case (state)
                IDEL: begin
                    if (A) begin
                        state <= START;
                    end
                    K1 <= 1'b0;
                    K2 <= 1'b0;
                end
                START: begin
                    if (!A) begin
                        state <= STOP;
                    end
                    K1 <= 1'b0;
                    K2 <= 1'b0;
                end
                STOP: begin
                    if (A) begin
                        state <= CLEAR;
                    end
                    K1 <= 1'b0;
                    K2 <= 1'b1;
                end
                CLEAR: begin
                    state <= IDEL;
                    K1 <= 1'b1;
                    K2 <= 1'b0;
                end
            endcase
        end
    end

endmodule