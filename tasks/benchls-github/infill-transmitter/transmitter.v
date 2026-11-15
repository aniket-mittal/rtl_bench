module transmitter(pc_t,tx,dma_txend,clk,fifo_status);

    input[7:0] pc_t;
    //input txrdy;
    input clk;
    input fifo_status;
    output reg tx;
    output reg dma_txend;

    reg[7:0] mem_t[0:1023];
    reg txrdy;
   
    parameter tx_idle = 2'b00;
    parameter tx_start = 2'b01;
    parameter tx_data = 2'b10;
    parameter tx_stop = 2'b11;
    
    integer index;
    reg[1:0] mode = 2'b00;
    integer clk_count;
    
    // 10000000/9600 = 1041.66 ~= 1042
    // 10000000/115200 = 86.80 ~= 87
    // 100000000/115200 = 868.05 ~= 868
    // 100000000/9600 = 10416.66 ~= 10417

    reg[7:0] thr;
    reg[9:0] tsr;
    
    [MASKED] 

endmodule