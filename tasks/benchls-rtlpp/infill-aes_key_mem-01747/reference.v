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

  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n)
        begin
          key_mem[00] <= 8'h00;
          key_mem[01] <= 8'h00;
          key_mem[02] <= 8'h00;
          key_mem[03] <= 8'h00;
          key_mem[04] <= 8'h00;
          key_mem[05] <= 8'h00;
          key_mem[06] <= 8'h00;
          key_mem[07] <= 8'h00;
          key_mem[08] <= 8'h00;
          key_mem[09] <= 8'h00;
          key_mem[10] <= 8'h00;
          key_mem[11] <= 8'h00;
          key_mem[12] <= 8'h00;
          key_mem[13] <= 8'h00;
          key_mem[14] <= 8'h00;
          key_mem[15] <= 8'h00;
          key_mem[16] <= 8'h00;
          key_mem[17] <= 8'h00;
          key_mem[18] <= 8'h00;
          key_mem[19] <= 8'h00;
          key_mem[20] <= 8'h00;
          key_mem[21] <= 8'h00;
          key_mem[22] <= 8'h00;
          key_mem[23] <= 8'h00;
          key_mem[24] <= 8'h00;
          key_mem[25] <= 8'h00;
          key_mem[26] <= 8'h00;
          key_mem[27] <= 8'h00;
          key_mem[28] <= 8'h00;
          key_mem[29] <= 8'h00;
          key_mem[30] <= 8'h00;
          key_mem[31] <= 8'h00;
          size_reg    <= 0;
        end
      else
        begin
          if (key_write)
            begin
              key_mem[key_write_addr] <= key_write_data;
            end
          
          if (init)
            begin
              size_reg <= key_size;
            end
        end
    end

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