module autovcoder_078732 #(
    parameter CLKS_PER_BIT = 217
) (
    input            i_Rst_L,
    input            i_Clock,
    input            i_TX_DV,
    input      [7:0] i_TX_Byte,
    output reg       o_TX_Active,
    output reg       o_TX_Serial,
    output reg       o_TX_Done
);

  localparam TX_IDLE = 3'b000;
  localparam TX_START_BIT = 3'b001;
  localparam TX_DATA_BITS = 3'b010;
  localparam TX_STOP_BIT = 3'b011;
  localparam TX_CLEANUP = 3'b100;

  reg [2:0] t_SM_Main = TX_IDLE;
  reg [$clog2(CLKS_PER_BIT):0] t_Clock_Count;
  reg [2:0] t_Bit_Index;
  reg [7:0] t_TX_Data;


  // Purpose: Control TX state machine
  always @(posedge i_Clock or negedge i_Rst_L) begin
    if (~i_Rst_L) begin
      t_SM_Main <= 3'b000;
      o_TX_Done <= 1'b0;
    end else begin
      case (t_SM_Main)
        TX_IDLE: begin
          o_TX_Serial   <= 1'b1;  // Drive Line High for Idle
          o_TX_Done     <= 1'b0;
          t_Clock_Count <= 0;
          t_Bit_Index   <= 0;
          o_TX_Active   <= 1'b0;

          if (i_TX_DV == 1'b1) begin
            o_TX_Active <= 1'b1;
            t_TX_Data   <= i_TX_Byte;
            t_SM_Main   <= TX_START_BIT;
          end else t_SM_Main <= TX_IDLE;
        end  // case: IDLE


        // Send out Start Bit. Start bit = 0
        TX_START_BIT: begin
          o_TX_Serial <= 1'b0;

          // Wait CLKS_PER_BIT-1 clock cycles for start bit to finish
          if (t_Clock_Count < CLKS_PER_BIT - 1) begin
            t_Clock_Count <= t_Clock_Count + 1;
            t_SM_Main     <= TX_START_BIT;
          end else begin
            t_Clock_Count <= 0;
            t_SM_Main     <= TX_DATA_BITS;
          end
        end  // case: TX_START_BIT


        // Wait CLKS_PER_BIT-1 clock cycles for data bits to finish         
        TX_DATA_BITS: begin
          o_TX_Serial <= t_TX_Data[t_Bit_Index];

          if (t_Clock_Count < CLKS_PER_BIT - 1) begin
            t_Clock_Count <= t_Clock_Count + 1;
            t_SM_Main     <= TX_DATA_BITS;
          end else begin
            t_Clock_Count <= 0;

            // Check if we have sent out all bits
            if (t_Bit_Index < 7) begin
              t_Bit_Index <= t_Bit_Index + 1;
              t_SM_Main   <= TX_DATA_BITS;
            end else begin
              t_Bit_Index <= 0;
              t_SM_Main   <= TX_STOP_BIT;
            end
          end
        end  // case: TX_DATA_BITS


        // Send out Stop bit.  Stop bit = 1
        TX_STOP_BIT: begin
          o_TX_Serial <= 1'b1;

          // Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
          if (t_Clock_Count < CLKS_PER_BIT - 1) begin
            t_Clock_Count <= t_Clock_Count + 1;
            t_SM_Main     <= TX_STOP_BIT;
          end else begin
            o_TX_Done     <= 1'b1;
            t_Clock_Count <= 0;
            t_SM_Main     <= TX_CLEANUP;
            o_TX_Active   <= 1'b0;
          end
        end  // case: TX_STOP_BIT


        // Stay here 1 clock
        TX_CLEANUP: begin
          o_TX_Done <= 1'b1;
          t_SM_Main <= TX_IDLE;
        end


        default: t_SM_Main <= TX_IDLE;

      endcase
    end  // else: !if(~i_Rst_L)
  end  // always @ (posedge i_Clock or negedge i_Rst_L)
endmodule

