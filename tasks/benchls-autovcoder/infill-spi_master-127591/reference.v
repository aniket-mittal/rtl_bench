module autovcoder_127591 (
    input wire clk,
    input wire reset,
    input wire send,
    input wire receive,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg busy,
    output reg sclk,
    output reg mosi,
    input wire miso
);
    reg [2:0] bit_count;
    reg [7:0] shift_register;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            busy <= 0;
            bit_count <= 0;
            shift_register <= 0;
            sclk <= 0;
            mosi <= 0;
            data_out <= 0;
        end else if (send && !busy) begin
            busy <= 1;
            shift_register <= data_in;
            bit_count <= 0;
            sclk <= 0;
        end else if (busy) begin
            sclk <= ~sclk; // Toggle sclk
            if (sclk) begin
                mosi <= shift_register[7]; // Send MSB first
                shift_register <= {shift_register[6:0], 1'b0}; // Shift left
                bit_count <= bit_count + 1;
            end else begin
                if (bit_count < 8) begin
                    data_out <= {data_out[6:0], miso}; // Receive data
                end
                if (bit_count == 7) begin
                    busy <= 0; // Done sending and receiving
                end
            end
        end
    end
endmodule