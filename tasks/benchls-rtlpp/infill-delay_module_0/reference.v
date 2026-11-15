module delay_module_0
   (input [31:0] addr,
    input clk,
    input [31:0] datain,
    output reg [31:0] dataout,
    input debug,
    output reg enb,
    output reg [3:0] web);

  reg [31:0] delay_memory [0:255];
  reg [7:0] write_ptr;
  reg [7:0] read_ptr;

  always @(posedge clk) begin
    if (debug) begin
      delay_memory[write_ptr] <= datain;
      write_ptr <= write_ptr + 1;
    end
    else begin
      dataout <= delay_memory[read_ptr];
      read_ptr <= read_ptr + 1;
    end
    enb <= debug;
    web <= debug ? 4'b1111 : 4'b0000;
  end
endmodule