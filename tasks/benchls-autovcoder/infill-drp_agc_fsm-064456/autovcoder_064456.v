module autovcoder_064456 (

    input lock0,
    lock1,
    lock2,
    lock3,
    clk,
    reset,
    ready,
    input [15:0] di0,
    output reg [3:0] holds = 0,
    output reg [15:0] DI = 0,
    output reg [8:0] Address = 0,
    output reg [3:0] state = 0,
    output reg done = 0,
    output reg kill = 0,
    output reg rd_drp = 0,
    output reg wr_drp = 0
);



  reg [15:0] store_di0;

  initial store_di0 = 0;
  parameter



load_addr_agc=      1,
rd_drp_agc=         2,
wait_drprdy_agc=    3,
mod_drp_agc=        4,
load_drp_agc =      5,
pulse_wr_agc=       6,
wait_drp_dy_agc=    7,
lock_agc=           8,
endstate        =   9,
resetstate      =   10;

  initial holds = 4'b0;
  initial DI = 16'b0;
  initial Address = 9'b0;
  initial wr_drp = 1'b0;
  initial rd_drp = 1'b0;
  initial done = 1'b0;


  [MASKED]
endmodule

