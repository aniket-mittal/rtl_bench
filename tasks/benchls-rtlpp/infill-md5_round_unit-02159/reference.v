module rtlpp_02159 (
     a
   , b
   , c
   , d
   , m
   , s
   , t 
   , round

   , next_a
   );

input  [31:0] a;
input  [31:0] b;
input  [31:0] c;
input  [31:0] d;
input  [31:0] m;          
input  [31:0] s;
input  [31:0] t;          
input   [1:0] round;      

output [31:0] next_a;
reg   [31:0] next_a;

reg   [31:0] add_result;
reg   [31:0] rotate_result1;
reg   [31:0] rotate_result2;

// Defining constants for rounding
parameter ROUND1 = 2'b00;
parameter ROUND2 = 2'b01;
parameter ROUND3 = 2'b10;
parameter ROUND4 = 2'b11;

always @(a
   or    b
   or    c
   or    d
   or    m
   or    s
   or    t
   or    round) begin 
   case (round)
   ROUND1: 
   begin 
      add_result = (a + F(b,c,d) + m + t);
      rotate_result1 = add_result << s;
      rotate_result2 = add_result >> (32-s);
      next_a = b + (rotate_result1 | rotate_result2);
   end 
   ROUND2: 
   begin 
      add_result = (a + G(b,c,d) + m + t);
      rotate_result1 = add_result << s;
      rotate_result2 = add_result >> (32-s);
      next_a = b + (rotate_result1 | rotate_result2);
   end 
   ROUND3:
   begin 
      add_result = (a + H(b,c,d) + m + t);
      rotate_result1 = add_result << s;
      rotate_result2 = add_result >> (32-s);
      next_a = b + (rotate_result1 | rotate_result2);
   end 
   ROUND4:
   begin 
      add_result = (a + I(b,c,d) + m + t);
      rotate_result1 = add_result << s;
      rotate_result2 = add_result >> (32-s);
      next_a = b + (rotate_result1 | rotate_result2);
   end 
   endcase
end 

function [31:0] F;
input [31:0] x, y, z;
begin 
   F = (x&y)|((~x)&z);
end 
endfunction 

function [31:0] G;
input [31:0] x, y, z;
begin 
   G = (x&z)|(y&(~z));
end 
endfunction 

function [31:0] H;
input [31:0] x, y, z;
begin 
   H = (x^y^z);
end 
endfunction 

function [31:0] I;
input [31:0] x, y, z;
begin 
   I = (y^(x|(~z)));
end 
endfunction 

endmodule