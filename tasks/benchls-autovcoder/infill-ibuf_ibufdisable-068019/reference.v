module autovcoder_068019 (
    O,
    I,
    IBUFDISABLE
);

  parameter IBUF_LOW_PWR = "TRUE";
  parameter IOSTANDARD = "DEFAULT";
  parameter SIM_DEVICE = "7SERIES";
  parameter USE_IBUFDISABLE = "TRUE";
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED";
`endif  // `ifdef XIL_TIMING

  output O;

  input I;
  input IBUFDISABLE;

  // define constants
  localparam MODULE_NAME = "IBUF_IBUFDISABLE";

  wire out_val;
  initial begin


    case (IBUF_LOW_PWR)

      "FALSE", "TRUE": ;
      default: begin
        $display(
            "Attribute Syntax Error : The attribute IBUF_LOW_PWR on IBUF_IBUFDISABLE instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.",
            IBUF_LOW_PWR);
        #1 ;
      end

    endcase
    if ((SIM_DEVICE != "7SERIES") &&
         (SIM_DEVICE != "ULTRASCALE") &&
         (SIM_DEVICE != "VERSAL_AI_CORE") &&
         (SIM_DEVICE != "VERSAL_AI_CORE_ES1") &&
         (SIM_DEVICE != "VERSAL_AI_CORE_ES2") &&
         (SIM_DEVICE != "VERSAL_AI_EDGE") &&
         (SIM_DEVICE != "VERSAL_AI_EDGE_ES1") &&
         (SIM_DEVICE != "VERSAL_AI_EDGE_ES2") &&
         (SIM_DEVICE != "VERSAL_AI_RF") &&
         (SIM_DEVICE != "VERSAL_AI_RF_ES1") &&
         (SIM_DEVICE != "VERSAL_AI_RF_ES2") &&
         (SIM_DEVICE != "VERSAL_HBM") &&
         (SIM_DEVICE != "VERSAL_HBM_ES1") &&
         (SIM_DEVICE != "VERSAL_HBM_ES2") &&
         (SIM_DEVICE != "VERSAL_PREMIUM") &&
         (SIM_DEVICE != "VERSAL_PREMIUM_ES1") &&
         (SIM_DEVICE != "VERSAL_PREMIUM_ES2") &&
         (SIM_DEVICE != "VERSAL_PRIME") &&
         (SIM_DEVICE != "VERSAL_PRIME_ES1") &&
         (SIM_DEVICE != "VERSAL_PRIME_ES2")) begin
      $display(
          "Error: [Unisim %s-104] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are 7SERIES, ULTRASCALE, VERSAL_AI_CORE, VERSAL_AI_CORE_ES1, VERSAL_AI_CORE_ES2, VERSAL_AI_EDGE, VERSAL_AI_EDGE_ES1, VERSAL_AI_EDGE_ES2, VERSAL_AI_RF, VERSAL_AI_RF_ES1, VERSAL_AI_RF_ES2, VERSAL_HBM, VERSAL_HBM_ES1, VERSAL_HBM_ES2, VERSAL_PREMIUM, VERSAL_PREMIUM_ES1, VERSAL_PREMIUM_ES2, VERSAL_PRIME, VERSAL_PRIME_ES1 or VERSAL_PRIME_ES2. Instance: %m",
          MODULE_NAME, SIM_DEVICE);
      #1 ;
    end
  end
  generate
    case (SIM_DEVICE)
      "7SERIES": begin
        assign out_val = 1'b1;
      end
      default:
      begin
        assign out_val = 1'b0;
      end
    endcase
  endgenerate

  generate
    case (USE_IBUFDISABLE)
      "TRUE": begin
        assign O = (IBUFDISABLE == 0) ? I : (IBUFDISABLE == 1) ? out_val : 1'bx;
      end
      "FALSE": begin
        assign O = I;
      end
    endcase
  endgenerate

`ifdef XIL_TIMING
  specify

    (I => O) = (0: 0: 0, 0: 0: 0);
    (IBUFDISABLE => O) = (0: 0: 0, 0: 0: 0);

    specparam PATHPULSE$ = 0;

  endspecify
`endif  // `ifdef XIL_TIMING

endmodule

