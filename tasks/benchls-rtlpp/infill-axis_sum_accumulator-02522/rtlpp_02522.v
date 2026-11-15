module rtlpp_02522 
    (
        ACLK,
        ARESETN,
        S_AXIS_TREADY,
        S_AXIS_TDATA,
        S_AXIS_TLAST,
        S_AXIS_TVALID,
        M_AXIS_TVALID,
        M_AXIS_TDATA,
        M_AXIS_TLAST,
        M_AXIS_TREADY,
        M_AXIS_TKEEP
    );

input                          ACLK;    
input                          ARESETN; 

output                         S_AXIS_TREADY;  
input      [31 : 0]            S_AXIS_TDATA;   
input                          S_AXIS_TLAST;   
input                          S_AXIS_TVALID;  

output                         M_AXIS_TVALID;  
output     [31 : 0]            M_AXIS_TDATA;   
output                         M_AXIS_TLAST;   
input                          M_AXIS_TREADY;  
output     [3:0]               M_AXIS_TKEEP;   

localparam NUMBER_OF_INPUT_WORDS  = 8;
localparam NUMBER_OF_OUTPUT_WORDS = 8;

localparam Idle  = 3'b100;
localparam Read_Inputs = 3'b010;
localparam Write_Outputs  = 3'b001;

reg [2:0] state;

reg [31:0] sum;

reg [2:0] nr_of_reads;
reg [2:0] nr_of_writes;

assign S_AXIS_TREADY = (state == Read_Inputs);
assign M_AXIS_TVALID = (state == Write_Outputs);

assign M_AXIS_TDATA = sum;
assign M_AXIS_TLAST = 1'b0;
assign M_AXIS_TKEEP = 4'b1111;

[MASKED]

endmodule