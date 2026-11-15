module rtlpp_09090 (
   RsTx, led,
   RsRx, sw, btnS, btnR, clk
   );

   input        RsRx;
   output       RsTx;

   input  [7:0] sw;
   output [7:0] led;
   input        btnS;                 
   input        btnR;                 
   input        clk;                  
    
   wire [7:0]           seq_tx_data;         
   wire                 seq_tx_valid;           
   wire [7:0]           uart_rx_data;           
   wire                 uart_rx_valid;          
   wire                 uart_tx_busy;           
   
   wire        rst;
   wire        arst_i;
   wire [17:0] clk_dv_inc;

   reg [1:0]   arst_ff;
   reg [16:0]  clk_dv;
   reg         clk_en;
   reg         clk_en_d;
   reg [7:0]   inst_wd;
   reg         inst_vld;
   reg [2:0]   step_d;
   reg [7:0]   inst_cnt;
   
   assign arst_i = btnR;
   assign rst = arst_ff[0];
   
   always @ (posedge clk or posedge arst_i)
     if (arst_i)
       arst_ff <= 2'b11;
     else
       arst_ff <= {1'b0, arst_ff[1]};

   assign clk_dv_inc = clk_dv + 1;
   
   always @ (posedge clk)
     if (rst)
       begin
          clk_dv   <= 0;
          clk_en   <= 1'b0;
          clk_en_d <= 1'b0;
       end
     else
       begin
          clk_dv   <= clk_dv_inc[16:0];
          clk_en   <= clk_dv_inc[17];
          clk_en_d <= clk_en;
       end

   always @ (posedge clk)
     if (rst)
       begin
          inst_wd[7:0] <= 0;
          step_d[2:0]  <= 0;
       end
     else if (clk_en)
       begin
          inst_wd[7:0] <= sw[7:0];
          step_d[2:0]  <= {btnS, step_d[2:1]};
       end

   always @ (posedge clk)
     if (rst)
       inst_vld <= 1'b0;
     else
       inst_vld <= ~step_d[0] & step_d[1] & clk_en_d;

   always @ (posedge clk)
     if (rst)
       inst_cnt <= 0;
     else if (inst_vld)
       inst_cnt <= inst_cnt + 1;

   assign led[7:0] = inst_cnt[7:0];

   // Integrated seq logic
   reg [7:0] seq_o_tx_data;
   reg       seq_o_tx_valid;

   always @ (posedge clk)
     if (rst)
       begin
          seq_o_tx_data <= 0;
          seq_o_tx_valid <= 0;
       end
     else if (inst_vld)
       begin
          seq_o_tx_data <= inst_wd; // Assuming simple pass-through for example
          seq_o_tx_valid <= 1;
       end
     else
       seq_o_tx_valid <= 0;

   assign seq_tx_data = seq_o_tx_data;
   assign seq_tx_valid = seq_o_tx_valid;

   // Integrated uart_top logic
   reg [7:0] uart_o_tx_data;
   reg       uart_o_tx_busy;
   reg [7:0] uart_o_rx_data;
   reg       uart_o_rx_valid;

   always @ (posedge clk)
     if (rst)
       begin
          uart_o_tx_data <= 0;
          uart_o_tx_busy <= 0;
          uart_o_rx_data <= 0;
          uart_o_rx_valid <= 0;
       end
     else
       begin
          if (seq_tx_valid)
            begin
               uart_o_tx_data <= seq_tx_data;
               uart_o_tx_busy <= 1;
               // Assuming logic to handle transmission
            end
          else
            uart_o_tx_busy <= 0;

          if (RsRx) // Assuming simple data receiving condition
            begin
               uart_o_rx_data <= RsRx;
               uart_o_rx_valid <= 1;
               // Assuming logic to handle reception
            end
          else
            uart_o_rx_valid <= 0;
       end

   assign RsTx = uart_o_tx_data; // Assuming direct passthrough
   assign uart_tx_busy = uart_o_tx_busy;
   assign uart_rx_data = uart_o_rx_data;
   assign uart_rx_valid = uart_o_rx_valid;
   
endmodule