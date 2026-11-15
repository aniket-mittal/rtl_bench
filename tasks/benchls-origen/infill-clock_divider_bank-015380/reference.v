module origen_015380(
    input CLKFast,
    output HZ1, HZ2, HZ128, HZ25M, HZ5, HZ40
);

    ONEHZCLK onehz (.clk100Mhz(CLKFast), .clk_out(HZ1));
    TWOHZCLK twohz (.clk100Mhz(CLKFast), .clk_out(HZ2));
    HUNDREDHZCLK hundredhz (.clk100Mhz(CLKFast), .clk_out(HZ128));
    TWENTYFIVEMEGCLK twentyfivemeg (.clk100Mhz(CLKFast), .clk_out(HZ25M));
    FIVEHZCLK fivehz (.clk100Mhz(CLKFast), .clk_out(HZ5));
    FORTYHZCLK fortyhz (.clk100Mhz(CLKFast), .clk_out(HZ40));

endmodule

module ONEHZCLK(
    input clk100Mhz,
    output reg clk_out
);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd50000000;
    
    always @(posedge clk100Mhz)
    begin
        counter <= counter + 28'd1;
        if(counter >= (DIVISOR-1))
            counter <= 28'd0;
        clk_out <= (counter < DIVISOR/2) ? 1'b1 : 1'b0;
    end
endmodule

module TWOHZCLK(
    input clk100Mhz,
    output reg clk_out
);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd25000000;
    
    always @(posedge clk100Mhz)
    begin
        counter <= counter + 28'd1;
        if(counter >= (DIVISOR-1))
            counter <= 28'd0;
        clk_out <= (counter < DIVISOR/2) ? 1'b1 : 1'b0;
    end
endmodule

module HUNDREDHZCLK(
    input clk100Mhz,
    output reg clk_out
);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd195312;
    
    always @(posedge clk100Mhz)
    begin
        counter <= counter + 28'd1;
        if(counter >= (DIVISOR-1))
            counter <= 28'd0;
        clk_out <= (counter < DIVISOR/2) ? 1'b1 : 1'b0;
    end
endmodule

module TWENTYFIVEMEGCLK(
    input clk100Mhz,
    output reg clk_out
);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd2;
    
    always @(posedge clk100Mhz)
    begin
        counter <= counter + 28'd1;
        if(counter >= (DIVISOR-1))
            counter <= 28'd0;
        clk_out <= (counter < DIVISOR/2) ? 1'b1 : 1'b0;
    end
endmodule

module FIVEHZCLK(
    input clk100Mhz,
    output reg clk_out
);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd10000000;
    
    always @(posedge clk100Mhz)
    begin
        counter <= counter + 28'd1;
        if(counter >= (DIVISOR-1))
            counter <= 28'd0;
        clk_out <= (counter < DIVISOR/2) ? 1'b1 : 1'b0;
    end
endmodule

module FORTYHZCLK(
    input clk100Mhz,
    output reg clk_out
);
    reg [27:0] counter = 28'd0;
    parameter DIVISOR = 28'd1250000;
    
    always @(posedge clk100Mhz)
    begin
        counter <= counter + 28'd1;
        if(counter >= (DIVISOR-1))
            counter <= 28'd0;
        clk_out <= (counter < DIVISOR/2) ? 1'b1 : 1'b0;
    end
endmodule