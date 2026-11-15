module rtlpp_03268 (
    input wire clk,
    input wire init,
    input wire [7:0] data,
    input wire data_en,
    output reg [7:0] crcOut
);

always @(posedge clk) begin
    if (init)
        crcOut <= 8'b0;
    else if (data_en) begin
        crcOut[0] <= (crcOut[0] ^ crcOut[2] ^ crcOut[4] ^ crcOut[5] ^ data[0] ^ data[2] ^ data[4] ^ data[5]);
        crcOut[1] <= (crcOut[1] ^ crcOut[3] ^ crcOut[5] ^ crcOut[6] ^ data[1] ^ data[3] ^ data[5] ^ data[6]);
        crcOut[2] <= (crcOut[0] ^ crcOut[5] ^ crcOut[6] ^ crcOut[7] ^ data[0] ^ data[5] ^ data[6] ^ data[7]);
        crcOut[3] <= (crcOut[0] ^ crcOut[1] ^ crcOut[2] ^ crcOut[4] ^ crcOut[5] ^ crcOut[6] ^ crcOut[7] ^ data[0] ^ data[1] ^ data[2] ^ data[4] ^ data[5] ^ data[6] ^ data[7]);
        crcOut[4] <= (crcOut[1] ^ crcOut[2] ^ crcOut[3] ^ crcOut[5] ^ crcOut[6] ^ crcOut[7] ^ data[1] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[7]);
        crcOut[5] <= (crcOut[2] ^ crcOut[3] ^ crcOut[4] ^ crcOut[6] ^ crcOut[7] ^ data[2] ^ data[3] ^ data[4] ^ data[6] ^ data[7]);
        crcOut[6] <= (crcOut[0] ^ crcOut[2] ^ crcOut[3] ^ crcOut[7] ^ data[0] ^ data[2] ^ data[3] ^ data[7]);
        crcOut[7] <= (crcOut[1] ^ crcOut[3] ^ crcOut[4] ^ data[1] ^ data[3] ^ data[4]);
    end
end

endmodule