module autovcoder_004074 (  /*AUTOARG*/
    // Outputs
    rFSM,
    nclk,
    prst,
    prun,
    frun,
    drun,
    // Inputs
    sys_rst_i,
    sys_clk_i,
    sys_int_i,
    sys_exc_i,
    rIWBSTB,
    iwb_ack_i,
    rDWBSTB,
    dwb_ack_i,
    rBRA,
    rDLY,
    iwb_dat_i,
    rMSR_IE
);
  // System
  input sys_rst_i, sys_clk_i;
  input sys_int_i;
  input sys_exc_i;

  // Instruction WB
  input rIWBSTB;
  input iwb_ack_i;

  // Data WB
  input rDWBSTB;
  input dwb_ack_i;

  // Internal
  input rBRA, rDLY;
  input [31:0] iwb_dat_i;
  input rMSR_IE;

  output [1:0] rFSM;
  //, rLDST;
  output nclk, prst, prun;
  output frun, drun;

  /**
    RUN Signal
    ----------
    This master run signal will pause or run the entire pipeline. It
    will pause for any incomplete bus transaction.
    */

  assign prun = ~((rDWBSTB ^ dwb_ack_i) | ((rIWBSTB ^ iwb_ack_i)));

  /**
    Debounce
    --------
    The following external signals are debounced and synchronised:
    - Interrupt
    
    TODO: Exceptions
    */
  wire fINT;
  reg [2:0] rEXC, rINT;
  always @(negedge nclk)
    if (prst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      rINT <= 3'h0;
      // End of automatics
    end else if (prun) begin
      //rEXC <= #1 {rEXC[1:0], sys_exc_i};
      rINT <= #1{rINT[1:0], sys_int_i};
    end

  /**
    Machine States
    --------------
    The internal machine state is affected by external interrupt,
    exception and software exceptions. Only interrupts are
    implemented.
    
    TODO: Implement Exceptions
    */
  parameter [1:0] FSM_RUN = 2'o0, FSM_SWEXC = 2'o3, FSM_HWEXC = 2'o2, FSM_HWINT = 2'o1;

  reg [1:0] rFSM, rNXT;
  always @(negedge nclk)
    if (prst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      rFSM <= 2'h0;
      // End of automatics
    end else if (prun) begin
      rFSM <= #1 rNXT;
    end

  always @(  /*AUTOSENSE*/ fINT or rFSM)
    case (rFSM)
      FSM_HWEXC: rNXT <= FSM_RUN;
      //FSM_SWEXC: rNXT <= FSM_RUN;     
      FSM_HWINT: rNXT <= FSM_RUN;
      default: begin
        rNXT <=  //(rEXC == 3'h3) ? FSM_HWEXC :
        (fINT) ? FSM_HWINT : FSM_RUN;
      end
    endcase  // case (rFSM)

  /**
    Interrupt Check
    ---------------
    It checks to make sure that all the instructions in the pipeline
    are atomic before allowing the detection of interrupts. Empirical
    response latency is 3-7 cycles.
    */

  wire [5:0] rOPC = iwb_dat_i[31:26];
  reg [2:0] rHWINT;
  reg [1:0] rNCLR;
  wire fCLR = ~|rNCLR;
  wire fNCLR = ({rOPC[5:4], rOPC[2:1]} == 4'b1011) | (rOPC == 6'o54) | (rOPC == 6'o55);
  assign fINT = (rHWINT == 3'o3) & fCLR;

  always @(negedge nclk)
    if (prst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      rHWINT <= 3'h0;
      // End of automatics
    end else if (fINT) begin
      rHWINT <= 3'o0;
    end else if (prun & fCLR & rMSR_IE) begin
      rHWINT <= {rHWINT[1:0], sys_int_i};
    end

  always @(negedge nclk)
    if (prst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      rNCLR <= 2'h0;
      // End of automatics
    end else if (prun) begin
      rNCLR <= {rNCLR[0], fNCLR};
    end

  /**
    Bubble
    ------
    Pipeline bubbles are introduced during a branch or interrupt.
    */

  reg [1:0] rRUN, xRUN;
  wire fXCE = ~|rFSM;
  assign {drun, frun} = {xRUN[1] & fXCE, xRUN[0] & fXCE};

  always @(  /*AUTOSENSE*/ rBRA or rDLY) begin
    xRUN <= {~(rBRA ^ rDLY), ~rBRA};
  end

  /**
    Clock/Reset
    -----------
    This controls the internal clock/reset signal for the core. Any
    DCM/PLL/DPLL can be instantiated here if needed.
    */

  reg [1:0] rRST;
  assign nclk = sys_clk_i;
  assign prst = rRST[1];

  always @(negedge nclk)
    if (!sys_rst_i) begin
      rRST <= 2'h3;
      /*AUTORESET*/
    end else begin
      rRST <= {rRST[0], 1'b0};
    end


endmodule

