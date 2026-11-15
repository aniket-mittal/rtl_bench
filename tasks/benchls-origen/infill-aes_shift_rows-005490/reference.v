module origen_005490 #(
    parameter DATA_WIDTH = 128
) (
    input wire shiftRow_valid_in,
    input wire [DATA_WIDTH-1:0] shiftRow_data_in,
    output reg [DATA_WIDTH-1:0] shiftRow_data_out,
    output reg shiftRow_valid_out
);

    always @(*) begin
        if (shiftRow_valid_in) begin
            // Row 0: No shift
            shiftRow_data_out[127:96] = shiftRow_data_in[127:96];
            
            // Row 1: Shift left by 1 byte
            shiftRow_data_out[95:64] = {shiftRow_data_in[87:64], shiftRow_data_in[95:88]};
            
            // Row 2: Shift left by 2 bytes
            shiftRow_data_out[63:32] = {shiftRow_data_in[47:32], shiftRow_data_in[63:48]};
            
            // Row 3: Shift left by 3 bytes
            shiftRow_data_out[31:0] = {shiftRow_data_in[7:0], shiftRow_data_in[31:8]};
        end else begin
            shiftRow_data_out = {DATA_WIDTH{1'b0}};
        end
    end

    always @(*) begin
        shiftRow_valid_out = shiftRow_valid_in;
    end

endmodule

// Testbench
