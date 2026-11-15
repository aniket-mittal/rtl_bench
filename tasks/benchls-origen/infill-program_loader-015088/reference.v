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

    always @(posedge clkMem) begin
        if (progEn) begin
            enOut <= 1'b1;
            
            if (progValid) begin
                data_internal <= {progData, data_internal[31:8]};
                byteCnt <= byteCnt + 1;
                
                if (byteCnt == 2'b11) begin
                    we_internal <= 1'b1;
                    addr_internal <= addr_internal + 1;
                end else begin
                    we_internal <= 1'b0;
                end
            end else begin
                we_internal <= 1'b0;
            end
            
            addrOut <= addr_internal;
            dataOut <= data_internal;
            weOut <= {4{we_internal}};
        end else begin
            addrOut <= addrIn;
            dataOut <= dataIn;
            weOut <= weIn;
            enOut <= enIn;
            
            addr_internal <= {ADDR_WIDTH{1'b1}}; // Set to -1
            data_internal <= 32'b0;
            we_internal <= 1'b0;
            byteCnt <= 2'b00;
        end
    end

endmodule