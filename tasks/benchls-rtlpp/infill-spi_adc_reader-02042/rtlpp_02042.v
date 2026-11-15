module rtlpp_02042(
    input CLK,
    input rst,
    input CNV_START,
    input SDO,
    output BUSY,
    output CNV,
    output reg SCK,
    output SDI,
    output [15:0] RESULT,
    output VALID
);

    reg busy_w;
    reg cnv_w;
    reg [15:0] result_w;
    reg valid_w;
    reg clk_en;
    reg [15:0] counter;

    parameter [4:0]  
        IDLE                = 5'b00001,
        CONVERT             = 5'b00010,
        END_CONVERSION      = 5'b00100,
        READ_OUT            = 5'b01000,
        VALID_F             = 5'b10000,
        WAIT                = 5'b10001;  
    
    reg [4:0] state;
    
    [MASKED]
    
    assign BUSY = busy_w;
    assign CNV = cnv_w;
    assign SDI = 1'b1; 
    assign RESULT = result_w;
    assign VALID = valid_w;

    always @(posedge CLK) begin
        SCK <= (!SCK) & clk_en;
    end
     
endmodule