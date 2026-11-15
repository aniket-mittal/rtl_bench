module origen_099075 #(
    parameter ADDRESS_WIDTH = 32,
    parameter UID_WIDTH = 16
) (
    input wire clk,
    input wire rst_n,
    
    // Channel 0 inputs
    input wire request_ch0_i,
    input wire [ADDRESS_WIDTH-1:0] address_ch0_i,
    input wire [UID_WIDTH-1:0] UID_ch0_i,
    output reg grant_ch0_o,
    
    // Channel 1 inputs
    input wire request_ch1_i,
    input wire [ADDRESS_WIDTH-1:0] address_ch1_i,
    input wire [UID_WIDTH-1:0] UID_ch1_i,
    output reg grant_ch1_o,
    
    // Output interface
    output reg [ADDRESS_WIDTH-1:0] address_o,
    output reg request_o,
    output reg [UID_WIDTH-1:0] UID_o,
    input wire grant_i,
    
    // Priority control
    input wire Flag_i
);

    reg ch_selector;

    always @(*) begin
        // Output request logic
        request_o = request_ch0_i | request_ch1_i;
        
        // Channel selection logic
        if (!request_ch0_i) begin
            ch_selector = 1'b1; // Select ch1
        end else if (request_ch0_i && request_ch1_i && Flag_i) begin
            ch_selector = 1'b1; // Select ch1
        end else begin
            ch_selector = 1'b0; // Select ch0
        end
        
        // Grant generation logic
        grant_ch0_o = (request_ch0_i & ~request_ch1_i) | (request_ch0_i & request_ch1_i & ~Flag_i & grant_i);
        grant_ch1_o = (request_ch1_i & ~request_ch0_i) | (request_ch0_i & request_ch1_i & Flag_i & grant_i);
        
        // Output multiplexing
        if (ch_selector) begin
            address_o = address_ch1_i;
            UID_o = UID_ch1_i;
        end else begin
            address_o = address_ch0_i;
            UID_o = UID_ch0_i;
        end
    end

endmodule