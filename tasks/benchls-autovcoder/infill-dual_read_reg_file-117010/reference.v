module autovcoder_117010 (
    clk,  // system clock
    reset_b,  // power on reset
    halt,  // system wide halt
    addra,  // Port A read address 
    a_en,  // Port A read enable
    addrb,  // Port B read address 
    b_en,  // Port B read enable 
    addrc,  // Port C write address 
    dc,  // Port C write data 
    wec,  // Port C write enable 

    qra,  // Port A registered output data	
    qrb
);  // Port B registered output data 	

  parameter AWIDTH = 5;
  parameter DSIZE = 32;

  input clk;
  input reset_b;
  input halt;
  input [AWIDTH-1:0] addra;
  input a_en;
  input [AWIDTH-1:0] addrb;
  input b_en;
  input [AWIDTH-1:0] addrc;
  input [DSIZE-1:0] dc;
  input wec;

  output [DSIZE-1:0] qra;
  output [DSIZE-1:0] qrb;

  // Internal varibles and signals
  integer i;

  reg [DSIZE-1:0] reg_file[0:(1<<AWIDTH)-1];  // Syncronous Reg file

  assign qra = ((addrc == addra) && wec) ? dc : reg_file[addra];
  assign qrb = ((addrc == addrb) && wec) ? dc : reg_file[addrb];

  always @(posedge clk or negedge reset_b) begin
    if (!reset_b) for (i = 0; i < (1 << AWIDTH); i = i + 1) reg_file[i] <= {DSIZE{1'bx}};
    else if (wec) reg_file[addrc] <= dc;
  end

  task reg_display;
    integer k;
    begin
      for (k = 0; k < (1 << AWIDTH); k = k + 1) ;
    end
  endtask

endmodule

