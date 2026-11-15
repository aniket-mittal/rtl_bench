module origen_079666 (
    input wire CLK,
    input wire RESETn,
    input wire PB_SW,
    output reg [1:0] LED
);

reg pb_reg1, pb_reg2;
reg [18:0] counter;
reg [1:0] sh_lft;
wire sh_clk;

// Two-stage synchronizer for PB_SW
always @(posedge CLK or negedge RESETn) begin
    if (!RESETn) begin
        pb_reg1 <= 1'b1;
        pb_reg2 <= 1'b1;
    end else begin
        pb_reg1 <= PB_SW;
        pb_reg2 <= pb_reg1;
    end
end

// Counter for slower clock
always @(posedge CLK or negedge RESETn) begin
    if (!RESETn) begin
        counter <= 19'b0;
    end else begin
        counter <= counter + 1'b1;
    end
end

assign sh_clk = counter[17];

// Shift register for LED pattern
always @(posedge sh_clk or negedge RESETn) begin
    if (!RESETn) begin
        sh_lft <= 2'b10;
    end else begin
        sh_lft <= {sh_lft[0], sh_lft[1]};
    end
end

// LED control logic
always @(posedge CLK or negedge RESETn) begin
    if (!RESETn) begin
        LED <= 2'b00;
    end else begin
        case (pb_reg2)
            1'b0: LED <= {2{counter[18]}};
            1'b1: LED <= sh_lft;
            default: LED <= 2'b00;
        endcase
    end
end

endmodule