module origen_051341 (
    input wire clk,
    input wire sig1,
    input wire sig2,
    output wire [31:0] result
);
    wire new_sig;
    assign new_sig = sig1 & ~sig2;

    Positive_Time pt (
        .sig(new_sig),
        .clk(clk),
        .p_time(result)
    );
endmodule

module Positive_Time (
    input wire sig,
    input wire clk,
    output reg [31:0] p_time
);
    reg [31:0] tmp;
    
    always @(posedge clk or negedge sig) begin
        if (~sig) begin
            p_time <= tmp;
            tmp <= 32'd0;
        end else if (sig) begin
            tmp <= tmp + 1;
        end
    end
endmodule

module getPeriod (
    input wire sig,
    input wire clk,
    output reg [31:0] period
);
    reg count_en;
    reg [31:0] tmp;
    
    always @(posedge sig) begin
        count_en <= ~count_en;
    end
    
    always @(posedge clk or negedge count_en) begin
        if (~count_en) begin
            period <= tmp;
            tmp <= 32'd0;
        end else if (count_en) begin
            tmp <= tmp + 1;
        end
    end
endmodule