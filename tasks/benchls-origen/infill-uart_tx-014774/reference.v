module origen_014774 
  #(parameter CLKS_PER_BIT = 868)
  (
   input       i_Clk,
   input       i_TX_DV,
   input [7:0] i_TX_BYTE, 
   output      o_TX_SERIAL,
   output      o_TX_ACTIVE,
   output      o_TX_DONE
   );
  
  parameter IDLE      = 3'b000;
  parameter START_BIT = 3'b001;
  parameter DATA_BITS = 3'b010;
  parameter STOP_BIT  = 3'b011;
  parameter CLEANUP   = 3'b100;
   
  reg [2:0]    r_SM_Main     = 0;
  reg [9:0]    r_Clock_Count = 0;
  reg [2:0]    r_BIT_INDEX   = 0;
  reg          r_TX_ACTIVE   = 0;
  reg          r_TX_DONE     = 0;
  reg          r_TX_SERIAL   = 1;
  reg [7:0]    r_TX_DATA     = 0;
   
  always @(posedge i_Clk)
  begin
    case (r_SM_Main)
      IDLE :
        begin
          r_TX_SERIAL   <= 1'b1;
          r_TX_DONE     <= 1'b0;
          r_Clock_Count <= 0;
          r_BIT_INDEX   <= 0;
          
          if (i_TX_DV == 1'b1)
          begin
            r_TX_ACTIVE <= 1'b1;
            r_TX_DATA   <= i_TX_BYTE;
            r_SM_Main   <= START_BIT;
          end
          else
            r_SM_Main <= IDLE;
        end
      
      START_BIT :
        begin
          r_TX_SERIAL <= 1'b0;
          
          if (r_Clock_Count < CLKS_PER_BIT-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= START_BIT;
          end
          else
          begin
            r_Clock_Count <= 0;
            r_SM_Main     <= DATA_BITS;
          end
        end
      
      DATA_BITS :
        begin
          r_TX_SERIAL <= r_TX_DATA[r_BIT_INDEX];
          
          if (r_Clock_Count < CLKS_PER_BIT-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= DATA_BITS;
          end
          else
          begin
            r_Clock_Count <= 0;
            
            if (r_BIT_INDEX < 7)
            begin
              r_BIT_INDEX <= r_BIT_INDEX + 1;
              r_SM_Main   <= DATA_BITS;
            end
            else
            begin
              r_BIT_INDEX <= 0;
              r_SM_Main   <= STOP_BIT;
            end
          end
        end
      
      STOP_BIT :
        begin
          r_TX_SERIAL <= 1'b1;
          
          if (r_Clock_Count < CLKS_PER_BIT-1)
          begin
            r_Clock_Count <= r_Clock_Count + 1;
            r_SM_Main     <= STOP_BIT;
          end
          else
          begin
            r_TX_DONE     <= 1'b1;
            r_Clock_Count <= 0;
            r_SM_Main     <= CLEANUP;
            r_TX_ACTIVE   <= 1'b0;
          end
        end
      
      CLEANUP :
        begin
          r_TX_DONE   <= 1'b1;
          r_SM_Main   <= IDLE;
        end
      
      default :
        r_SM_Main <= IDLE;
      
    endcase
  end

  assign o_TX_SERIAL = r_TX_SERIAL;
  assign o_TX_ACTIVE = r_TX_ACTIVE;
  assign o_TX_DONE   = r_TX_DONE;
   
endmodule