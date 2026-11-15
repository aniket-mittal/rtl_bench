module autovcoder_100883 #(
    parameter NUM_CHAN = 3
) (
    input clk,
    input reset,
    input reading, //will not switch until clear

    input [NUM_CHAN-1:0] chans_ready,  //set bits for ready channels

    //channel outputs
    output reg [NUM_CHAN-1:0] chan_en,  //channel enable signals
    output reg [4:0] chan_num

);

  //map data outputs
  //assign mux_header_data = o_header_data[chan_sel];
  //assign mux_chan_data = o_chan_data[chan_sel];				

  // Handle channel mux selection on clk.
  // Only change when when no packet is being sent.
  // Use next_chan logic to select the next available
  // channel from the last channel we sent.
  integer i, next;
  reg [4:0] sel_next_chan_num[NUM_CHAN-1:0];
  reg [4:0] last_chan_num;

  //	always @ (posedge clk)
  [MASKED]

endmodule

