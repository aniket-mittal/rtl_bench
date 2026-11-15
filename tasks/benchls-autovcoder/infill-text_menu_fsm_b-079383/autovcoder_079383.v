module autovcoder_079383 (
    input rst,
    input clk2,
    input clk_20m,
    input wrmenu,
    input down,
    input up,
    output reg [7:0] dbi,
    output reg wr,
    output reg dr,
    output reg [7:0] direc
);

  initial wr = 0;
  reg [1:0] pag = 0;
  reg [6:0] estado = 0;
  reg [6:0] nestado = 0;

  parameter stay = 0;

  parameter dr1 = 1;
  parameter dr10 = 2;
  parameter dr11 = 3;

  parameter R11 = 4;
  parameter e11 = 5;
  parameter g11 = 6;
  parameter i11 = 7;
  parameter s11 = 8;
  parameter t11 = 9;
  parameter r11 = 10;
  parameter o11 = 11;
  parameter espace11 = 12;
  parameter e12 = 13;
  parameter x11 = 14;
  parameter i12 = 15;
  parameter t12 = 16;
  parameter o12 = 17;
  parameter s12 = 18;
  parameter o13 = 19;

  parameter dr4 = 20;

  parameter P31 = 21;
  parameter r31 = 22;
  parameter e31 = 23;
  parameter s31 = 24;
  parameter i31 = 25;
  parameter o31 = 26;
  parameter n31 = 27;
  parameter e32 = 28;
  parameter espace31 = 29;
  parameter par_abierto31 = 30;
  parameter cero31 = 31;
  parameter par_cerrado31 = 32;

  parameter erase = 33;

  always@( negedge clk_20m ) //Logica de estado siguiente
	begin

    if (estado == stay) begin
      if (wrmenu) begin
        nestado = erase;
      end else begin
        nestado = stay;
      end
    end else if (estado == erase) nestado = dr1;

    else if (estado == par_cerrado31) nestado = stay;

    else nestado = estado + 7'd1;

  end

  always@( posedge clk2 ) //Reset opcional, Actualizacion de estados
	begin

    if (rst) estado = stay;
    else estado = nestado;

  end

  [MASKED]

endmodule

