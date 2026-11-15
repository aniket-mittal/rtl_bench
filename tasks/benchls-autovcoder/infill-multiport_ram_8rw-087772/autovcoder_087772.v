module autovcoder_087772 (
    clk,
    write_en1,
    write_en2,
    write_en3,
    write_en4,
    write_en5,
    write_en6,
    write_en7,
    write_en8,
    read_en1,
    read_en2,
    read_en3,
    read_en4,
    read_en5,
    read_en6,
    read_en7,
    read_en8,
    addr1,
    addr2,
    addr3,
    addr4,
    addr5,
    addr6,
    addr7,
    addr8,
    Data_in1,
    Data_in2,
    Data_in3,
    Data_in4,
    Data_in5,
    Data_in6,
    Data_in7,
    Data_in8,
    Data_out1,
    Data_out2,
    Data_out3,
    Data_out4,
    Data_out5,
    Data_out6,
    Data_out7,
    Data_out8
);

  input clk, write_en1, write_en2, write_en3, write_en4, write_en5, write_en6, write_en7, write_en8;
  input read_en1, read_en2, read_en3, read_en4, read_en5, read_en6, read_en7, read_en8;
  input [8:0] addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8;
  input [15:0] Data_in1, Data_in2, Data_in3, Data_in4, Data_in5, Data_in6, Data_in7, Data_in8;
  output[15:0] Data_out1,Data_out2,Data_out3,Data_out4,Data_out5,Data_out6,Data_out7,Data_out8;

  reg [15:0] octaport_ram[511:0];
  reg [8:0]
      addr_read1,
      addr_read2,
      addr_read3,
      addr_read4,
      addr_read5,
      addr_read6,
      addr_read7,
      addr_read8;

  [MASKED]

  assign Data_out1 = octaport_ram[addr_read1];
  assign Data_out2 = octaport_ram[addr_read2];
  assign Data_out3 = octaport_ram[addr_read3];
  assign Data_out4 = octaport_ram[addr_read4];
  assign Data_out5 = octaport_ram[addr_read5];
  assign Data_out6 = octaport_ram[addr_read6];
  assign Data_out7 = octaport_ram[addr_read7];
  assign Data_out8 = octaport_ram[addr_read8];

endmodule

