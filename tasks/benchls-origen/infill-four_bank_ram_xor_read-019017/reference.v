module origen_019017 #(
    parameter MSB = 31,
    parameter ADDR_NBITS = 8
) (
    input wire CLK,
    input wire [MSB:0] din,
    input wire wr_en,
    input wire [9:0] addr_wr,
    input wire rd_en,
    input wire rst_rd,
    input wire [MSB:0] addr_rd,
    output reg [MSB:0] out
);

    reg [MSB:0] S0 [0:255];
    reg [MSB:0] S1 [0:255];
    reg [MSB:0] S2 [0:255];
    reg [MSB:0] S3 [0:255];
    
    reg [MSB:0] S0_out, S1_out, S2_out, S3_out;

    wire [1:0] bank_sel = addr_wr[9:8];
    wire [7:0] addr = addr_wr[7:0];

    always @(posedge CLK) begin
        if (wr_en) begin
            case (bank_sel)
                2'b00: S0[addr] <= din;
                2'b01: S1[addr] <= din;
                2'b10: S2[addr] <= din;
                2'b11: S3[addr] <= din;
            endcase
        end
    end

    always @(posedge CLK) begin
        if (rst_rd) begin
            S0_out <= 0;
            S1_out <= 0;
            S2_out <= 0;
            S3_out <= 0;
        end else if (rd_en) begin
            S0_out <= S0[addr_rd[4*ADDR_NBITS-1:3*ADDR_NBITS]];
            S1_out <= S1[addr_rd[3*ADDR_NBITS-1:2*ADDR_NBITS]];
            S2_out <= S2[addr_rd[2*ADDR_NBITS-1:ADDR_NBITS]];
            S3_out <= S3[addr_rd[ADDR_NBITS-1:0]];
        end
    end

    always @(posedge CLK) begin
        out <= S3_out + (S2_out ^ (S1_out + S0_out));
    end

endmodule