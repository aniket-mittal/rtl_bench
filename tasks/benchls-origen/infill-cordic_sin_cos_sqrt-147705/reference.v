module origen_147705 #(
    parameter MODE = 1,
    parameter PIPELINE_STAGES = 13
) (
    input wire clk,
    input wire rst_n,
    input wire [31:0] angle,
    input wire [63:0] sqrt_in,
    output reg [15:0] sin_out,
    output reg [15:0] cos_out,
    output reg [15:0] sinh_out,
    output reg [31:0] sqrt_out
);

// Constants
localparam ITERATIONS = 13;
localparam [31:0] K = 32'h26DD3B6A; // K = 0.607252935 in fixed-point

// Internal registers
reg signed [31:0] x [0:PIPELINE_STAGES-1];
reg signed [31:0] y [0:PIPELINE_STAGES-1];
reg signed [31:0] z [0:PIPELINE_STAGES-1];
reg [3:0] iteration [0:PIPELINE_STAGES-1];

// LUT for arctangent values
wire signed [31:0] atan_table [0:ITERATIONS-1];
assign atan_table[0] = 32'h3243F6A9; // atan(2^0)
assign atan_table[1] = 32'h1DAC6705; // atan(2^-1)
assign atan_table[2] = 32'h0FADBAFD; // atan(2^-2)
assign atan_table[3] = 32'h07F56EA7; // atan(2^-3)
assign atan_table[4] = 32'h03FEAB76; // atan(2^-4)
assign atan_table[5] = 32'h01FFD55C; // atan(2^-5)
assign atan_table[6] = 32'h00FFFAAB; // atan(2^-6)
assign atan_table[7] = 32'h007FFF55; // atan(2^-7)
assign atan_table[8] = 32'h003FFFEB; // atan(2^-8)
assign atan_table[9] = 32'h001FFFFD; // atan(2^-9)
assign atan_table[10] = 32'h000FFFFF; // atan(2^-10)
assign atan_table[11] = 32'h0007FFFF; // atan(2^-11)
assign atan_table[12] = 32'h0003FFFF; // atan(2^-12)

// CORDIC iteration
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (int i = 0; i < PIPELINE_STAGES; i = i + 1) begin
            x[i] <= 32'h0;
            y[i] <= 32'h0;
            z[i] <= 32'h0;
            iteration[i] <= 4'h0;
        end
    end else begin
        // First stage
        case (MODE)
            1, 2: begin // Circular and hyperbolic modes
                x[0] <= K;
                y[0] <= 32'h0;
                z[0] <= angle;
            end
            3: begin // Square root mode
                x[0] <= {sqrt_in[63:32], sqrt_in[63:46]};
                y[0] <= 32'h0;
                z[0] <= 32'h0;
            end
        endcase
        iteration[0] <= 4'h0;

        // Pipeline stages
        for (int i = 1; i < PIPELINE_STAGES; i = i + 1) begin
            iteration[i] <= iteration[i-1] + 1;

            case (MODE)
                1: begin // Circular mode
                    if (z[i-1][31]) begin
                        x[i] <= x[i-1] + (y[i-1] >>> iteration[i-1]);
                        y[i] <= y[i-1] - (x[i-1] >>> iteration[i-1]);
                        z[i] <= z[i-1] + atan_table[iteration[i-1]];
                    end else begin
                        x[i] <= x[i-1] - (y[i-1] >>> iteration[i-1]);
                        y[i] <= y[i-1] + (x[i-1] >>> iteration[i-1]);
                        z[i] <= z[i-1] - atan_table[iteration[i-1]];
                    end
                end
                2: begin // Hyperbolic mode
                    if (z[i-1][31]) begin
                        x[i] <= x[i-1] - (y[i-1] >>> iteration[i-1]);
                        y[i] <= y[i-1] - (x[i-1] >>> iteration[i-1]);
                        z[i] <= z[i-1] + atan_table[iteration[i-1]];
                    end else begin
                        x[i] <= x[i-1] + (y[i-1] >>> iteration[i-1]);
                        y[i] <= y[i-1] + (x[i-1] >>> iteration[i-1]);
                        z[i] <= z[i-1] - atan_table[iteration[i-1]];
                    end
                end
                3: begin // Square root mode
                    if (y[i-1] <= x[i-1]) begin
                        x[i] <= x[i-1] - y[i-1] - (1 << (30 - iteration[i-1]));
                        y[i] <= y[i-1] + (1 << (31 - iteration[i-1]));
                    end else begin
                        x[i] <= x[i-1];
                        y[i] <= y[i-1];
                    end
                    z[i] <= z[i-1];
                end
            endcase
        end
    end
end

// Output logic
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sin_out <= 16'h0;
        cos_out <= 16'h0;
        sinh_out <= 16'h0;
        sqrt_out <= 32'h0;
    end else begin
        case (MODE)
            1: begin // Circular mode
                sin_out <= y[PIPELINE_STAGES-1][29:14];
                cos_out <= x[PIPELINE_STAGES-1][29:14];
            end
            2: begin // Hyperbolic mode
                sinh_out <= y[PIPELINE_STAGES-1][29:14];
            end
            3: begin // Square root mode
                sqrt_out <= y[PIPELINE_STAGES-1];
            end
        endcase
    end
end

endmodule