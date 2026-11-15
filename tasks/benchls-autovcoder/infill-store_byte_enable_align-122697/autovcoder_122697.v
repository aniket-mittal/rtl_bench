module autovcoder_122697 (
    write_data,  // data in least significant position
    d_address,
    store_size,  // 0-byte, 1-16bits, 2-32bits, 3-64bits
    d_byteena,
    d_writedataout
);  // shifted data to coincide with address
  parameter WIDTH = 32;

  input [WIDTH-1:0] write_data;
  input [1:0] d_address;
  input [1:0] store_size;
  output [3:0] d_byteena;
  output [WIDTH-1:0] d_writedataout;

  reg [3:0] d_byteena;
  reg [WIDTH-1:0] d_writedataout;

  [MASKED]

endmodule

