module mg_09512(clk, rst, note_on, note_off, note, out_note, out_gate);
input wire clk, rst, note_on, note_off; 
 input wire [6:0] note; 
 output wire [6:0] out_note; 
 output reg out_gate; 
 initial out_gate <= 0; 
 reg [6:0] t_out_note; 
 initial t_out_note <= 7'd0; 
 assign out_note = t_out_note; 
 reg [127:0] keys; 
 initial keys <= 128'd0; 
 reg [6:0] bit_ptr; 
 parameter READY = 1'd0; 
 parameter BUSY = 1'd1; 
 reg state; 
 initial state <= READY; 
 [MASKED] 
 endmodule