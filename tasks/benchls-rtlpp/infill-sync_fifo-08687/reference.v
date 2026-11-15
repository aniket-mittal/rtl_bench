module rtlpp_08687(data_out, empty, full, data_in, push, pop, reset, clk);

	parameter DEPTH = 8;			
	parameter WIDTH = 8;
	
	output reg [WIDTH-1:0] data_out;
	output reg empty;
	output reg full;
	
	input [WIDTH-1:0] data_in;
	input push;
	input pop;
	input reset;
	input clk;

	reg [WIDTH-1:0] reg_file [0:DEPTH-1];
	reg [DEPTH-1:0] wraddr, rdaddr;
	reg [DEPTH:0] num_elems;
	
	always @(posedge reset or posedge clk)
	begin
		if (reset) begin
			data_out <= {WIDTH{1'b0}};
			empty <= 1'b1;
			full <= 1'b0;
			wraddr <= {DEPTH{1'b0}};
			rdaddr <= {DEPTH{1'b0}};
			num_elems <= {DEPTH{1'b0}};
		end
		else begin
			if (push && (~full) && (~pop)) begin
				reg_file[wraddr] <= data_in;
				wraddr <= (wraddr + 1) % DEPTH;
				num_elems <= num_elems + 1;
			
				if (empty)
					empty <= 1'b0;

				if ((wraddr == rdaddr) && (num_elems == DEPTH-1)) // num_elems == DEPTH-1 before writing
					full <= 1'b1;
				else
					full <= 1'b0;
					
			end
			else if (pop && (~empty) && (~push)) begin
				data_out <= reg_file[rdaddr];
				rdaddr <= (rdaddr + 1) % DEPTH;
				num_elems <= num_elems - 1;
				
				if (full)
					full <= 1'b0;
					
				if (wraddr == rdaddr)
					empty <= 1'b1;
				else
					empty <= 1'b0;
			end
		end
	end
	
endmodule