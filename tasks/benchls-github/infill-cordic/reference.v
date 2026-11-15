module iter_addsub (
	input clk,sclr,
	input first,sub,
	input a,b,
	output sum
);

reg car;
assign sum = a ^ (sub ^ b) ^ (first ? sub : car);

always @(posedge clk) begin
	if (sclr) car <= 1'b0;
	else car <= a & (sub ^ b) |
				a & (first ? sub : car) |
				(sub ^ b) & (first ? sub : car);
end

endmodule

module cordic 
	#(parameter WIDTH = 16) // note : update ROM content if changing this parameter
(
	input clk,sclr,
	input xi,yi,zi,
	input rot,
	output valid,
	output xo,yo,zo
);

////////////////////
// control
////////////////////
reg [3:0] round_num;
reg [3:0] bits_left;
reg sign_ext;
reg round_num_max;

always @(posedge clk) begin
	if (sclr) begin
		round_num <= 0;
		bits_left <= 4'hf;
		sign_ext <= 1'b0;
		round_num_max <= 0;
	end
	else begin
		bits_left <= bits_left - 1'b1;
		if (bits_left == round_num) sign_ext <= 1'b1;
		if (~|bits_left) begin
			round_num_max <= (round_num == 4'hc); // count 0..d
			sign_ext <= 1'b0;
			if (round_num_max) round_num <= 0;
			else round_num <= round_num + 1'b1;
		end
	end
end
wire isel = round_num_max;
assign valid = isel;

////////////////////
// iterative adders
////////////////////
reg [WIDTH-1:0] x,y,z,zrom;
wire xsum,ysum,zsum, xshift, yshift;
reg d;

wire first = &bits_left;
iter_addsub xa (.clk(clk),.sclr(sclr),.a(x[0]), .b(yshift), 
			.first(first),.sub(d),.sum(xsum));
iter_addsub ya (.clk(clk),.sclr(sclr),.a(y[0]), .b(xshift), 
			.first(first),.sub(!d),.sum(ysum));
iter_addsub za (.clk(clk),.sclr(sclr),.a(z[0]), .b(zrom[0]), 
			.first(first),.sub(d),.sum(zsum));

//////////////////////////////////
// grab registers for sign extend
//////////////////////////////////
reg last_xshift,last_yshift;
always @(posedge clk) begin
	if (sclr) begin
		last_xshift <= 1'b0;
		last_yshift <= 1'b0;
	end
	else begin
		last_yshift <= yshift;
		last_xshift <= xshift;		
	end
end

//////////////////////////////////
// debug monitor
//////////////////////////////////
// synthesis translate off
always @(posedge clk) begin
	if (first) begin
		;
		;
		;
		;
		;
	end
end
// synthesis translate on

//////////////////////////////////
// depending on the mode, minimize
//  y or z register
//////////////////////////////////
always @(posedge clk) begin
	if (sclr) d <= 0;
	else begin
		if (~|bits_left) begin
			if (rot) d <= !(isel ? zi : zsum);
			else d <= (isel ? yi : ysum);
		end
	end
end


//////////////////////////////////
// XYZ shift registers
//////////////////////////////////
always @(posedge clk) begin
	if (sclr) begin
		x <= 0;
		y <= 0;
		z <= 0;
	end
	else begin
		x <= {(isel ? xi : xsum),x[WIDTH-1:1]};
		y <= {(isel ? yi : ysum),y[WIDTH-1:1]};
		z <= {(isel ? zi : zsum),z[WIDTH-1:1]};
	end
end
assign xshift = sign_ext ? last_xshift : x[round_num];
assign yshift = sign_ext ? last_yshift : y[round_num];
assign xo = x[0];
assign yo = y[0];
assign zo = z[0];


//////////////////////////////////////////////////////////////
// This is a little ROM of the arctangent of 2^-i in radians
// MSB weight is -2
//  next	is 1
//  next	is 0.5 and so on
// The indexing is off by one to load the constant associated
// with the NEXT round.
//////////////////////////////////////////////////////////////
wire zrom_load = ~|bits_left;
always @(posedge clk) begin
	if (sclr) zrom <= 1'b0;
	else if (zrom_load) begin
		case (round_num)
			4'hd : zrom <= 16'b0011001001000011; // 0.78539816
			4'h0 : zrom <= 16'b0001110110101100; // 0.46364761
			4'h1 : zrom <= 16'b0000111110101101; // 0.24497866
			4'h2 : zrom <= 16'b0000011111110101; // 0.12435499
			4'h3 : zrom <= 16'b0000001111111110; // 0.06241881
			4'h4 : zrom <= 16'b0000000111111111; // 0.03123983
			4'h5 : zrom <= 16'b0000000011111111; // 0.01562373
			4'h6 : zrom <= 16'b0000000001111111; // 0.00781234
			4'h7 : zrom <= 16'b0000000000111111; // 0.00390623
			4'h8 : zrom <= 16'b0000000000011111; // 0.00195312
			4'h9 : zrom <= 16'b0000000000001111; // 0.00097656
			4'ha : zrom <= 16'b0000000000000111; // 0.00048828
			4'hb : zrom <= 16'b0000000000000011; // 0.00024414
			4'hc : zrom <= 16'b0000000000000001; // 0.00012207

			// these are unused
			4'he : zrom <= 16'b0000000000000000; // 0.00006104
			4'hf : zrom <= 16'b0000000000000000; // 0.00003052
		endcase
	end
	else zrom <= {1'b0,zrom[WIDTH-1:1]};
end

endmodule