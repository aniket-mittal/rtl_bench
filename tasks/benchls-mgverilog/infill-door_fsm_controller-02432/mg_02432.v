module mg_02432 ( botao, aberto, fechado, motor, sentido, ledVerde, ledVermelho, display, clock );
input botao, aberto, fechado, motor, sentido, clock; 
  output ledVerde, ledVermelho; 
  output [6:0] display; 
  reg [1:0] estado; 
  reg [4:0] entrada; 
  reg [6:0] tmpDisplay; 
  reg tmpLedVerde, tmpLedVermelho; 
  parameter Fechado = 2'b00, Abrindo = 2'b01, Aberto = 2'b10, Fechando = 2'b11; 
  initial estado = Fechado; 
  [MASKED] 
  assign display= tmpDisplay; 
  assign ledVerde = tmpLedVerde; 
  assign ledVermelho = tmpLedVermelho; 
 endmodule