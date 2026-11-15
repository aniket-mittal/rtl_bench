module mg_09109(input wire clk,input wire [4:0] L_1,input wire [4:0] L_2,input wire [4:0] L_3,input wire [4:0] L_4,output reg [3:0] segment_out,output reg seg_um,output reg seg_ul,output reg seg_ur,output reg seg_mm,output reg seg_dl,output reg seg_dr,output reg seg_dm,output reg seg_dot);
function [7:0]liczbaNAsygnaly; 
  input [4:0]liczba; 
  begin 
  case (liczba[3:0]) 
  default: liczbaNAsygnaly = ~8'b00000000; 
  4'b0000: liczbaNAsygnaly = ~{liczba[4:4],7'b1110111}; 
  4'b0001: liczbaNAsygnaly = ~{liczba[4:4],7'b0010010}; 
  4'b0010: liczbaNAsygnaly = ~{liczba[4:4],7'b1011101}; 
  4'b0011: liczbaNAsygnaly = ~{liczba[4:4],7'b1011011}; 
  4'b0100: liczbaNAsygnaly = ~{liczba[4:4],7'b0111010}; 
  4'b0101: liczbaNAsygnaly = ~{liczba[4:4],7'b1101011}; 
  4'b0110: liczbaNAsygnaly = ~{liczba[4:4],7'b1101111}; 
  4'b0111: liczbaNAsygnaly = ~{liczba[4:4],7'b1010010}; 
  4'b1000: liczbaNAsygnaly = ~{liczba[4:4],7'b1111111}; 
  4'b1001: liczbaNAsygnaly = ~{liczba[4:4],7'b1111011}; 
  4'b1010: liczbaNAsygnaly = ~{liczba[4:4],7'b0001000}; 
  4'b1011: liczbaNAsygnaly = ~{liczba[4:4],7'b1000000}; 
  4'b1100: liczbaNAsygnaly = ~{liczba[4:4],7'b0010000}; 
  4'b1101: liczbaNAsygnaly = ~{liczba[4:4],7'b0001000}; 
  4'b1110: liczbaNAsygnaly = ~{liczba[4:4],7'b0100000}; 
  4'b1111: liczbaNAsygnaly = ~{liczba[4:4],7'b0000000}; 
  endcase 
  end 
  endfunction 
  always @(negedge clk) 
  begin 
  case (segment_out) 
  default: begin segment_out <= ~4'b0001; {seg_dot,seg_um,seg_ul,seg_ur,seg_mm,seg_dl,seg_dr,seg_dm} <= liczbaNAsygnaly(L_1); end 
  4'b1110: begin segment_out <= ~4'b0010; {seg_dot,seg_um,seg_ul,seg_ur,seg_mm,seg_dl,seg_dr,seg_dm} <= liczbaNAsygnaly(L_2); end 
  4'b1101: begin segment_out <= ~4'b0100; {seg_dot,seg_um,seg_ul,seg_ur,seg_mm,seg_dl,seg_dr,seg_dm} <= liczbaNAsygnaly(L_3); end 
  4'b1011: begin segment_out <= ~4'b1000; {seg_dot,seg_um,seg_ul,seg_ur,seg_mm,seg_dl,seg_dr,seg_dm} <= liczbaNAsygnaly(L_4); end 
  4'b0111: begin segment_out <= ~4'b0001; {seg_dot,seg_um,seg_ul,seg_ur,seg_mm,seg_dl,seg_dr,seg_dm} <= liczbaNAsygnaly(L_1); end 
  endcase 
  end 
 endmodule