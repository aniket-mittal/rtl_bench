module mg_01097(input a, output b);
assign b = ~a; 
 (* keep *) reg [1:0] c; 
 reg d; 
 always @* d <= &c; 
 endmodule