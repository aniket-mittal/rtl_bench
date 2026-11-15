module mg_01242 (input clk,input resetn,input [7:0] din,output [7:0] dout,input shift_in,input shift_out,output reg [7:0] used_slots,output reg [7:0] free_slots);
reg [7:0] memory [0:255]; 
  reg [7:0] wptr, rptr; 
  reg [7:0] memory_dout; 
  reg [7:0] pass_dout; 
  reg use_pass_dout; 
  assign dout = use_pass_dout ? pass_dout : memory_dout; 
  wire do_shift_in = shift_in && |free_slots; 
  wire do_shift_out = shift_out && |used_slots; 
  always @(posedge clk) begin 
  if (!resetn) begin 
  wptr <= 0; 
  rptr <= 0; 
  used_slots <= 0; 
  free_slots <= 255; 
  end else begin 
  memory[wptr] <= din; 
  wptr <= wptr + do_shift_in; 
  memory_dout <= memory[rptr + do_shift_out]; 
  rptr <= rptr + do_shift_out; 
  use_pass_dout <= wptr == rptr; 
  pass_dout <= din; 
  if (do_shift_in && !do_shift_out) begin 
  used_slots <= used_slots + 1; 
  free_slots <= free_slots - 1; 
  end 
  if (!do_shift_in && do_shift_out) begin 
  used_slots <= used_slots - 1; 
  free_slots <= free_slots + 1; 
  end 
  end 
  end 
 endmodule