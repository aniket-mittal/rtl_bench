module fullAdder(a, b, cin, cout, s);
	input a;
	input b;
	input cin;
	output cout;
	output s;
	
	assign cout = (a & b) | (a & cin) | (b & cin);
	assign s = (a ^ b ^ cin);
endmodule

module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             
    output [3:0] out,
    output c_out            
); 
    
    wire c1, c2, c3;
    fullAdder M1(x[0], y[0], c_in , out[0], c1); 
    fullAdder M2(x[1], y[1], c1, out[1], c2);
    fullAdder M3(x[2], y[2], c2 , out[2], c3); 
    fullAdder M4(x[3], y[3], c3, out[3], c_out); 

endmodule

module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            
);

    wire [3:0] A;

    or(A[0], y[0]&select[1], ~y[0]&select[2]);
    or(A[1], y[1]&select[1], ~y[1]&select[2]);
    or(A[2], y[2]&select[1], ~y[2]&select[2]);
    or(A[3], y[3]&select[1], ~y[3]&select[2]);

    adder Adder(.x(x), .y(A), .c_in(select[0]), .out(out), .c_out(c_out));

endmodule