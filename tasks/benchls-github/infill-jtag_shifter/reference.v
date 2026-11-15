module jtag_shifter (shift_clk, shift_din, shift, shift_dout, control_reg_ce, bram_ce, bram_a, din_load, din, bram_d, bram_we) ;

parameter integer 	C_NUM_PICOBLAZE = 1 ;
parameter integer 	C_BRAM_MAX_ADDR_WIDTH = 10 ;
parameter integer 	C_PICOBLAZE_INSTRUCTION_DATA_WIDTH = 18 ;

input							shift_clk ;
input							shift_din ;
input							shift ;
output							shift_dout ;
output							control_reg_ce ;
output	[C_NUM_PICOBLAZE-1:0]				bram_ce ;
output	[C_BRAM_MAX_ADDR_WIDTH-1:0]			bram_a ;
input							din_load ;
input	[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0]	din ;
output	[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0]	bram_d ;
output							bram_we ;

reg							control_reg_ce_int ;
reg	[C_NUM_PICOBLAZE-1:0]				bram_ce_int ;		//:= (others (1'b0);
reg	[C_BRAM_MAX_ADDR_WIDTH-1:0]			bram_a_int ;		//:= (others (1'b0);
reg	[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1:0]	bram_d_int ; 		//:= (others (1'b0);
reg							bram_we_int ; 		//:= 1'b0;

always @ (posedge shift_clk) begin
	if (shift == 1'b1) begin
	        control_reg_ce_int <= shift_din;
	end
end

assign control_reg_ce = control_reg_ce_int;

always @ (posedge shift_clk) begin
	if (shift == 1'b1) begin
	        bram_ce_int[0] <= control_reg_ce_int ;
	end
end 

genvar i ;
generate
for (i = 0 ; i <= C_NUM_PICOBLAZE-2 ; i = i+1)
begin : loop0
if (C_NUM_PICOBLAZE > 1) begin
always @ (posedge shift_clk) begin
	if (shift == 1'b1) begin
	        bram_ce_int[i+1] <= bram_ce_int[i] ;
	end
end
end 
end
endgenerate

always @ (posedge shift_clk) begin
        if (shift == 1'b1) begin
		bram_we_int <= bram_ce_int[C_NUM_PICOBLAZE-1] ;
        end
end

always @ (posedge shift_clk) begin 
        if (shift == 1'b1) begin
               	bram_a_int[0] <= bram_we_int ;
        end
end

generate
for (i = 0 ; i <= C_BRAM_MAX_ADDR_WIDTH-2 ; i = i+1)
begin : loop1
always @ (posedge shift_clk) begin
	if (shift == 1'b1) begin
	        bram_a_int[i+1] <= bram_a_int[i] ;
	end
end 
end
endgenerate

always @ (posedge shift_clk) begin 
        if (din_load == 1'b1) begin
                bram_d_int[0] <= din[0] ;
        end
        else if (shift == 1'b1) begin
              	bram_d_int[0] <= bram_a_int[C_BRAM_MAX_ADDR_WIDTH-1] ;
        end
end

generate
for (i = 0 ; i <= C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-2 ; i = i+1)
begin : loop2
always @ (posedge shift_clk) begin
        if (din_load == 1'b1) begin
                bram_d_int[i+1] <= din[i+1] ;
        end
	if (shift == 1'b1) begin
	        bram_d_int[i+1] <= bram_d_int[i] ;
	end
end 
end
endgenerate

assign bram_ce = bram_ce_int;
assign bram_we = bram_we_int;
assign bram_d  = bram_d_int;
assign bram_a  = bram_a_int;
assign shift_dout = bram_d_int[C_PICOBLAZE_INSTRUCTION_DATA_WIDTH-1];

endmodule