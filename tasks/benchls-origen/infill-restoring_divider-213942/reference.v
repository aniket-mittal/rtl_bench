module origen_213942 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [31:0] A,
    input wire [31:0] B,
    output wire [31:0] D,
    output wire [31:0] R,
    output wire ok,
    output wire err
);

reg active;
reg [4:0] cycle;
reg [31:0] result;
reg [31:0] denom;
reg [31:0] work;

wire [32:0] sub;
assign sub = work - denom;

assign D = result;
assign R = work;
assign ok = ~active;
assign err = (B == 32'b0);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        active <= 1'b0;
        cycle <= 5'b0;
        result <= 32'b0;
        denom <= 32'b0;
        work <= 32'b0;
    end else if (start) begin
        active <= 1'b1;
        cycle <= 5'd31;
        result <= 32'b0;
        denom <= B;
        work <= A;
    end else if (active) begin
        cycle <= cycle - 1'b1;
        if (sub[32] == 1'b0) begin
            work <= sub[31:0];
            result <= {result[30:0], 1'b1};
        end else begin
            work <= {work[30:0], result[0]};
            result <= {result[30:0], 1'b0};
        end
        if (cycle == 5'b0) begin
            active <= 1'b0;
        end
    end
end

endmodule