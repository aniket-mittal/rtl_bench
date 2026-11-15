module origen_145425 (
    input wire clk,
    input wire rst_n,
    input wire [4:0] BIN,
    output reg [3:0] BCD0,
    output reg [3:0] BCD1
);

    reg [4:0] bin_reg1, bin_reg2;
    reg [7:0] bcd_reg1, bcd_reg2;

    // Stage 1: Input registration and initial shift
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bin_reg1 <= 5'b0;
            bcd_reg1 <= 8'b0;
        end else begin
            bin_reg1 <= BIN;
            bcd_reg1 <= {3'b0, BIN};
        end
    end

    // Stage 2: Double dabble algorithm
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            bin_reg2 <= 5'b0;
            bcd_reg2 <= 8'b0;
        end else begin
            bin_reg2 <= bin_reg1;
            
            // Check if ones digit is 5 or greater
            if (bcd_reg1[3:0] >= 5)
                bcd_reg2[3:0] <= bcd_reg1[3:0] + 3;
            else
                bcd_reg2[3:0] <= bcd_reg1[3:0];
            
            // Check if tens digit is 5 or greater
            if (bcd_reg1[7:4] >= 5)
                bcd_reg2[7:4] <= bcd_reg1[7:4] + 3;
            else
                bcd_reg2[7:4] <= bcd_reg1[7:4];
        end
    end

    // Stage 3: Final shift and output
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            BCD0 <= 4'b0;
            BCD1 <= 4'b0;
        end else begin
            BCD0 <= bcd_reg2[3:0];
            BCD1 <= bcd_reg2[7:4];
        end
    end

endmodule