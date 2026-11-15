module autovcoder_018624 (
    input wire [31:0] register,
    input wire [31:0] data,
    output reg out
);

  reg [9:0] x1;
  reg [9:0] y1;

  reg [9:0] x2;
  reg [9:0] y2;

  reg [9:0] y_face_1;
  reg [9:0] y_face_2;

  reg [9:0] x_face_1;
  reg [9:0] x_face_2;

  /*----------Registers of results-----------*/
  reg up_collision;
  reg down_collision;
  reg left_collision;
  reg right_collision;
  /*-----------------------------------------*/

  localparam [9:0] h1 = 20;
  localparam [9:0] h2 = 20;
  localparam [9:0] w1 = 20;
  localparam [9:0] w2 = 20;

  /*--------------Equations-------------------
Equations: h = height w = width
yl = [ (y1 + h1) > y2 ] && [ y1 < (y2 + h2) ] left collision for y
yr = [ (y1 + h1) > y2 ] && [ y1 < (y2 + h2) ] right collision for  y

xl = [ (x1 + w1) > x2 ] left collision for x
xr = [ (x2 + w2) > x1 ] right collision for x 

up collision:
first check if: y1 > y2
after check if: [ (x1 + w1) > x2 ] && [ x1 < (x2 + w2) ]

 
down colision:
first check if: y1 < (y2 + h2)
after check if: [ (x1 + w1) > x2 ] && [ x1 < (x2 + w2) ]
*/

  [MASKED]
endmodule

