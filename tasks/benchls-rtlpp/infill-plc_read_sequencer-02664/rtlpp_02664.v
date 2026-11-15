module rtlpp_02664 (
    input   wire                    clk,
    input   wire                    rst,        
    input   wire                    start,      
    input   wire                    last,       
    input   wire [2*ADDR_WIDTH-1:0] addr_tuple, 
    input   wire [2*WAY_WIDTH-1:0]  way_tuple,  

    output  reg                     next,       
    output  reg                     plc_error,  

    input   wire [DATA_SIZE-1:0]    ddata,      

    output  reg                     read_en,    
    output  reg [ADDR_WIDTH-1:0]    addr_out,   
    output  reg [WAY_WIDTH-1:0]     way_out    
);

    parameter ADDR_WIDTH = 8;
    parameter WAY_WIDTH = 4;
    parameter DATA_SIZE = 64;

    parameter FA = 4'd0;
    parameter SA = 4'd1;
    parameter DO = 4'd2;
    parameter DE = 4'd3;
    parameter LO = 4'd4;
    parameter LE = 4'd5;

    reg [DATA_SIZE-1:0] data_o;                 
    reg [3:0] state;
    integer k;

    [MASKED]

endmodule