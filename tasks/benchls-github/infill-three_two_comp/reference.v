module three_two_comp (data,sum);

input [2:0] data;
output [1:0] sum;

reg [1:0] sum;

always @(data) begin
	case (data)
	  0: sum=0;
	  1: sum=1;
	  2: sum=1;
	  3: sum=2;
	  4: sum=1;
	  5: sum=2;
	  6: sum=2;
	  7: sum=3;
	  default: sum=0;
	endcase
end
endmodule