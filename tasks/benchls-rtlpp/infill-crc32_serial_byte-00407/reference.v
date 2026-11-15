module rtlpp_00407
(
    input             clk,
    input             rst_n,
    input [7:0]       data,
    input             crc_en,
    output reg [31:0] crc32
);
  wire [31:0] crc32_byte_variable;

  always@(posedge clk or negedge rst_n) begin
    if (!rst_n)
      crc32 <= 32'hFFFFFFFF;
    else begin
      crc32 <= crc_en ? crc32_byte_variable : crc32;
    end
  end

  function [31:0] crc32_bit;
    input [31:0]   crc;
    input          data;
    begin
      crc32_bit      = crc << 1;
      crc32_bit[0]   = crc[31] ^ data;
      crc32_bit[1]   = crc[31] ^ data ^ crc[0];
      crc32_bit[2]   = crc[31] ^ data ^ crc[1];
      crc32_bit[4]   = crc[31] ^ data ^ crc[3];
      crc32_bit[5]   = crc[31] ^ data ^ crc[4];
      crc32_bit[7]   = crc[31] ^ data ^ crc[6];
      crc32_bit[8]   = crc[31] ^ data ^ crc[7];
      crc32_bit[10]  = crc[31] ^ data ^ crc[9];
      crc32_bit[11]  = crc[31] ^ data ^ crc[10];
      crc32_bit[12]  = crc[31] ^ data ^ crc[11];
      crc32_bit[16]  = crc[31] ^ data ^ crc[15];
      crc32_bit[22]  = crc[31] ^ data ^ crc[21];
      crc32_bit[23]  = crc[31] ^ data ^ crc[22];
      crc32_bit[26]  = crc[31] ^ data ^ crc[25];
    end
  endfunction

  function [31:0] crc32_byte;
    input [31:0] crc;
    input [7:0]  data;
    integer      i;
    begin
      crc32_byte = crc;
      for(i=0; i<8; i=i+1) begin
        crc32_byte = crc32_bit(crc32_byte, data[7-i]);
      end
    end
  endfunction

  assign crc32_byte_variable = crc32_byte(crc32, data);

endmodule