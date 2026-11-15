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
  always @(posedge clock)begin 
  entrada[4] = botao; 
  entrada[3] = aberto; 
  entrada[2] = fechado; 
  entrada[1] = motor; 
  entrada[0] = sentido; 
  case( estado ) 
  Fechado: begin 
  tmpDisplay = 7'b0001110; 
  tmpLedVerde = 0; 
  tmpLedVermelho = 0; 
  if( entrada == 5'b10110 ) 
  estado = Abrindo; 
  end 
  Abrindo: begin 
  tmpDisplay = 7'b1000000; 
  tmpLedVerde = 1; 
  tmpLedVermelho = 0; 
  if( entrada == 5'b10010 ) 
  estado = Aberto; 
  if( entrada == 5'b00010 ) 
  estado = Fechando; 
  end 
  Aberto: begin 
  tmpDisplay = 7'b0001000; 
  tmpLedVerde = 0; 
  tmpLedVermelho = 0; 
  if( entrada == 5'b01011 ) 
  estado = Fechando; 
  end 
  Fechando: begin 
  tmpDisplay = 7'b1000000; 
  tmpLedVerde = 0; 
  tmpLedVermelho = 1; 
  if( entrada == 5'b10011 ) 
  estado = Abrindo; 
  if( entrada == 5'b00011 ) 
  estado = Fechado; 
  end 
  default: estado = Fechado; 
  endcase 
  end 
  assign display= tmpDisplay; 
  assign ledVerde = tmpLedVerde; 
  assign ledVermelho = tmpLedVermelho; 
 endmodule