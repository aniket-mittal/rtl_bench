module autovcoder_092904 #(
    parameter READ_WIDTH = 32,
    parameter IN_WIDTH   = 8
) (
    input                       clk,
    input                       reset,
    output reg [READ_WIDTH-1:0] dout,
    input                       enable,  /* Trigger to start operation for reading data */
    output reg                  done,    /* Used to show data out is valid */

    input      [IN_WIDTH-1:0] din,
    output reg                busy
);

  /* Required calculation to get correct number of stages for entire width
	* parallel read */
  //	reg [IN_WIDTH-1:0]  data [ 0 : ((READ_WIDTH >> $clog2(8)) - 1) ];

  //	/* Counter for how many bytes are left to shift out */
  //	reg [ ((READ_WIDTH >> $clog2(8)) - 1) : 0] dcount;
  //
  //	genvar i;
  //	generate
  //		for( i = 0; i < ((READ_WIDTH >> $clog2(8)) - 1); i = i + 1) begin
  //			always @(posedge clk or posedge reset ) begin
  //				if( reset ) begin
  //					data[i] <= READ_WIDTH'b0;
  //				end
  //				else if( !busy && enable ) begin
  //					busy <= 1'b1;	
  //					dcount <= (READ_WIDTH >> $clog2(8));
  //					data[i] <= din;
  //				end
  //				else if(busy && dcount) begin
  //					if( i == 0 ) begin
  //						data[i] <= 0;
  //						dcount <= dcount - 1;
  //					end
  //					else 
  //						data[i] <= data[i-1]; 
  //						dcount <= dcount - 1;
  //					end
  //				end
  //				else if( busy && !dcount ) begin
  //					busy <= 1'b0;
  //					dout[ (IN_WIDTH * (i+1)) - 1 : IN_WIDTH * i ] <= data[i];
  //					
  //				end
  //			end
  //		end
  //	endgenerate
  //
  //	/* Reset handling outside of generate statement */
  //	always @(posedge clk or posedge reset ) begin
  //		if( reset ) begin
  //			dout <= 0;
  //			dcount <= (READ_WIDTH >> $clog2(8));
  //		end
  //	end

  reg [7:0] data[3:0];

  /* Counter for how many bytes are left to shift out */
  reg [((READ_WIDTH >> $clog2(8)) - 1) : 0] dcount;

  [MASKED]




endmodule

