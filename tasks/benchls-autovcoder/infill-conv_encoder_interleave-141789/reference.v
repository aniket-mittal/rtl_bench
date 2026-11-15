module autovcoder_141789 (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [3:0] data_in,
    input wire [1:0] interleave_depth,
    output reg [7:0] encoded_out, // 8 bits output for the encoded data
    output reg valid
);
    reg [3:0] enc1_out, enc2_out;
    reg [3:0] interleaved_data;

    // Simple convolutional encoder
    function [3:0] conv_encoder;
        input [3:0] data;
        begin
            conv_encoder[0] = data[0] ^ data[1];
            conv_encoder[1] = data[1] ^ data[2];
            conv_encoder[2] = data[2] ^ data[3];
            conv_encoder[3] = data[3] ^ data[0];
        end
    endfunction

    // Interleaver function
    function [3:0] interleave;
        input [3:0] data;
        input [1:0] depth;
        begin
            case (depth)
                2'b00: interleave = data; // No interleaving
                2'b01: interleave = {data[2:0], data[3]}; // Simple 1-bit left shift
                2'b10: interleave = {data[1:0], data[3:2]}; // Simple 2-bit left shift
                default: interleave = data; // Default case
            endcase
        end
    endfunction

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            encoded_out <= 8'b0;
            valid <= 1'b0;
        end else if (enable) begin
            enc1_out <= conv_encoder(data_in);
            interleaved_data <= interleave(data_in, interleave_depth);
            enc2_out <= conv_encoder(interleaved_data);
            encoded_out <= {enc1_out, enc2_out};
            valid <= 1'b1;
        end else begin
            valid <= 1'b0;
        end
    end
endmodule