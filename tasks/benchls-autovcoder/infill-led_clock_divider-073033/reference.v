module autovcoder_073033 (
    // inputs
    input  wire       clk,       // 
    input  wire       rst,       // asynchronous reset
    // input wire        enable,
    // outputs
    output reg  [7:0] LED_array
);

  //----------------------------------------------------------------------------
  //                                                                          --
  //                       ARCHITECTURE DEFINITION                            --
  //                                                                          --
  //----------------------------------------------------------------------------
  //------------------------------
  // INTERNAL SIGNAL DECLARATIONS: 
  //------------------------------
  // parameters (constants)
  parameter clk_freq = 26'd25000000;  // in Hz

  // wires (assigns)

  // regs (always)
  reg [25:0] clk_div;  // enough bits for clk_freq =< 900Mhz
  reg [ 3:0] count;
  reg        enable;

  //-------------------------------------//
  //-- assign (non-process) operations --//
  //-------------------------------------//


  //-------------------------------------//
  //---- always (process) operations ----//
  //-------------------------------------//

  //  clock divider (assumes 25Mhz)
  //   (this process can be disabled if external enable is available)
  //
  always @(posedge clk or posedge rst)
    if (rst) begin
      clk_div <= 0;
      enable  <= 0;
    end else begin
      if (clk_div >= (clk_freq / 14)) begin
        clk_div <= 0;
        enable  <= 1;
      end else begin
        clk_div <= clk_div + 1;
        enable  <= 0;
      end
    end



  //  sequence counter 
  //
  always @(posedge clk or posedge rst)
    if (rst) begin
      count <= 0;
    end else begin
      if (enable) begin
        if (count >= 13) count <= 0;
        else count <= count + 1;
      end
    end

  //  kitcar decode 
  //
  always @(posedge clk or posedge rst)
    if (rst) begin
      LED_array <= 0;
    end else begin
      case (count)
        0: LED_array <= 8'b10000000;
        1: LED_array <= 8'b01000000;
        2: LED_array <= 8'b00100000;
        3: LED_array <= 8'b00010000;
        4: LED_array <= 8'b00001000;
        5: LED_array <= 8'b00000100;
        6: LED_array <= 8'b00000010;
        7: LED_array <= 8'b00000001;
        8: LED_array <= 8'b00000010;
        9: LED_array <= 8'b00000100;
        10: LED_array <= 8'b00001000;
        11: LED_array <= 8'b00010000;
        12: LED_array <= 8'b00100000;
        13: LED_array <= 8'b01000000;
        default: LED_array <= 0;
      endcase
    end

endmodule

