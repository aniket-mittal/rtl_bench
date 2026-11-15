module rtlpp_01747(
                   input wire          clk,
                   input wire          reset_n,

                   input wire          init,
                   
                   input wire  [4 : 0] key_write_addr,
                   input wire  [7 : 0] key_write_data,
                   input wire          key_write,
                   input wire          key_size,
                     
                   input wire  [4 : 0] key_read_addr,
                   output wire [7 : 0] key_read_data
                  );

  reg [7 : 0] key_mem [0 : 31];
  reg size_reg;
  reg [7 : 0] tmp_key_read_data;

  assign key_read_data = tmp_key_read_data;

  [MASKED]

  always @*
    begin
      reg [4 : 0] addr;
      if (size_reg)
        addr = key_read_addr;
      else
        addr = {1'b0, key_read_addr[3 : 0]};
      tmp_key_read_data = key_mem[addr];
    end

endmodule