module autovcoder_029312 (
    DispVal,
    //anode,
    segOut
);

  // ==============================================================================================
  // 											Port Declarations
  // ==============================================================================================

  input [3:0] DispVal;  // Output from the Decoder
  //output [3:0] anode;				// Controls the display digits
  output [6:0] segOut;  // Controls which digit to display

  // ==============================================================================================
  // 							  		Parameters, Regsiters, and Wires
  // ==============================================================================================

  // Output wires and registers
  //wire [3:0] anode;
  reg [6:0] segOut;

  // ==============================================================================================
  // 												Implementation
  // ==============================================================================================

  // only display the rightmost digit
  //assign anode = 4'b1110;

  //------------------------------
  //		   Segment Decoder
  // Determines cathode pattern
  //   to display digit on SSD
  //------------------------------
  [MASKED]

endmodule

