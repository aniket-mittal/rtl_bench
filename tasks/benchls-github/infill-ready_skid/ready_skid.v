module ready_skid #(
	parameter WIDTH = 16
)
(
	input clk,arst,
	
	input valid_i,
	input [WIDTH-1:0] dat_i,
	output reg ready_i,
	
	output reg valid_o,
	output reg [WIDTH-1:0] dat_o,
	input ready_o	
);

reg [WIDTH-1:0] backup_storage;
reg backup_valid;

// duplicate control registers to mitigate
// high fanout loading.
reg internal_valid_o /* synthesis preserve */;
reg internal_ready_i /* synthesis preserve */;

// simulation only sanity check
always @(posedge clk) begin
	if ((ready_i != internal_ready_i) || 
		(valid_o != internal_valid_o)) begin
		;	
	end
end

[MASKED]

endmodule