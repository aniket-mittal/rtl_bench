module autovcoder_063136 (
    note_in,
    note_clk,
    note_out,
    speed,
    depth,
    offset_mul,
    offset_dir,
    en,
    clk50mhz
);


  input [5:0] note_in;
  input note_clk;
  output [5:0] note_out;
  input [1:0] speed;  //when speed goes up, vibrato slows down. 
  input [1:0] depth;

  output reg [2:0] offset_mul;
  output reg offset_dir;

  input en;
  input clk50mhz;

  reg [4:0] speed_counter;
  reg [3:0] count;


  assign note_out = note_in; //note coming in doesn't change, we just apply some pitch bending via the BFG. 

  initial begin
    speed_counter = 0;
    offset_mul = 0;
    count = 0;
    offset_dir = 0;

  end


  [MASKED]

endmodule

