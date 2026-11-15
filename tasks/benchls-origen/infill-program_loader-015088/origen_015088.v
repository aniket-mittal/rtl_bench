module origen_015088 #(
    parameter ADDR_WIDTH = 10
)(
    input wire clkMem,
    input wire [7:0] progData,
    input wire progValid,
    input wire progEn,
    input wire [ADDR_WIDTH-1:0] addrIn,
    input wire [31:0] dataIn,
    input wire [3:0] weIn,
    input wire enIn,
    
    output reg [ADDR_WIDTH-1:0] addrOut,
    output reg [31:0] dataOut,
    output reg [3:0] weOut,
    output reg enOut
);

    reg [ADDR_WIDTH-1:0] addr_internal;
    reg [31:0] data_internal;
    reg we_internal;
    reg [1:0] byteCnt;

    [MASKED]

endmodule