module origen_149448(
    input  wire        clk,
    input  wire        rst,
    input  wire [7:0]  d0_i,
    input  wire [7:0]  d1_i,
    input  wire [7:0]  d2_i,
    input  wire [7:0]  d3_i,
    input  wire [7:0]  d4_i,
    input  wire [7:0]  d5_i,
    input  wire [7:0]  d6_i,
    input  wire [7:0]  d7_i,
    input  wire [7:0]  d8_i,
    input  wire        done_i,
    output reg [7:0]   grayscale_o,
    output wire        done_o
);

    // Gradient calculation in x-direction
    wire signed [9:0] gx_p = {1'b0, d0_i} + {1'b0, 2'd2, d3_i} + {1'b0, d6_i} - {1'b0, d2_i} - {1'b0, 2'd2, d5_i} - {1'b0, d8_i};
    wire signed [9:0] gx_n = -gx_p;
    wire [9:0] gx_d = (gx_p > gx_n) ? gx_p : gx_n;

    // Gradient calculation in y-direction
    wire signed [9:0] gy_p = {1'b0, d0_i} + {1'b0, 2'd2, d1_i} + {1'b0, d2_i} - {1'b0, d6_i} - {1'b0, 2'd2, d7_i} - {1'b0, d8_i};
    wire signed [9:0] gy_n = -gy_p;
    wire [9:0] gy_d = (gy_p > gy_n) ? gy_p : gy_n;

    // Gradient magnitude calculation
    wire [11:0] g_sum = $signed(gx_d) + $signed(gy_d);

    // Grayscale output calculation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            grayscale_o <= 8'h00;
        end else begin
            if (g_sum >= 60) begin
                grayscale_o <= (g_sum[11:8] > 0) ? 8'hFF : g_sum[7:0];
            end else begin
                grayscale_o <= 8'h00;
            end
        end
    end

    // Delay the done_i signal by 4 clock cycles
    reg [3:0] done_shift;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done_shift <= 4'b0000;
        end else begin
            done_shift <= {done_shift[2:0], done_i};
        end
    end
    assign done_o = done_shift[3];

endmodule