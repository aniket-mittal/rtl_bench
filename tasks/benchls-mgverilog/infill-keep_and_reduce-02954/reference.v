module mg_02954(input a, output b);
assign b = ~a; 
 (* keep *) reg [1:0] c; 
 (* keep *) reg d; 
 always @* d <= &c; 
 endmodule