module mg_04069 (muxed,sa, sb, a, b);
input sa; 
  input sb; 
  output wire [71:0] muxed; 
  input [71:0] a; 
  input [71:0] b; 
 assign muxed = (({72{sa}} & a)| ({72{sb}} & b)); 
 endmodule