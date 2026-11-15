module origen_042408 #(parameter n = 3) (
    input wire clk,
    input wire rst,
    input wire [n-1:0] pcount,
    output reg Empty_F,
    output reg Full_F
);

reg rst_flag;

always @(posedge clk) begin
    rst_flag <= rst;
end

[MASKED]

endmodule

module flag_tb;
    reg clk;
    reg rst;
    reg [2:0] pcount;
    wire Empty_F;
    wire Full_F;

    flag_setter #(.n(3)) uut (
        .clk(clk),
        .rst(rst),
        .pcount(pcount),
        .Empty_F(Empty_F),
        .Full_F(Full_F)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        pcount = 0;
        #15 rst = 0;
        
        #10 pcount = 0;
        #10 pcount = 3;
        #10 pcount = 7;
        #10 pcount = 0;
        
        #10 ;
    end

    initial begin
        $monitor("Time=%0t rst=%b pcount=%d Empty_F=%b Full_F=%b",
                 $time, rst, pcount, Empty_F, Full_F);
    end
endmodule