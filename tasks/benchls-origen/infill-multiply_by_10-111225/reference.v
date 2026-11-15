module origen_111225 (
    input wire ap_clk,
    input wire ap_rst,
    input wire ap_start,
    input wire [15:0] n,
    output reg ap_ready,
    output reg ap_done,
    output reg [31:0] ap_return
);

    reg [19:0] mul8;
    reg [16:0] mul2;
    reg [1:0] mul_state;

    localparam IDLE = 2'b00;
    localparam COMPUTE = 2'b01;
    localparam DONE = 2'b10;

    always @(posedge ap_clk or posedge ap_rst) begin
        if (ap_rst) begin
            ap_ready <= 1'b0;
            ap_done <= 1'b0;
            ap_return <= 32'b0;
            mul8 <= 20'b0;
            mul2 <= 17'b0;
            mul_state <= IDLE;
        end else begin
            case (mul_state)
                IDLE: begin
                    ap_ready <= 1'b1;
                    ap_done <= 1'b0;
                    if (ap_start) begin
                        mul8 <= {n, 3'b0};
                        mul2 <= {n, 1'b0};
                        mul_state <= COMPUTE;
                        ap_ready <= 1'b0;
                    end
                end

                COMPUTE: begin
                    ap_return <= mul8 + mul2;
                    mul_state <= DONE;
                end

                DONE: begin
                    ap_done <= 1'b1;
                    if (!ap_start) begin
                        mul_state <= IDLE;
                    end
                end

                default: mul_state <= IDLE;
            endcase
        end
    end

endmodule