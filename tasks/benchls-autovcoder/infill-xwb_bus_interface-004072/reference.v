module autovcoder_004072 (  /*AUTOARG*/
    // Outputs
    xwb_adr_o,
    xwb_dat_o,
    xwb_sel_o,
    xwb_tag_o,
    xwb_stb_o,
    xwb_cyc_o,
    xwb_wre_o,
    xwb_fb,
    xwb_mx,
    // Inputs
    xwb_dat_i,
    xwb_ack_i,
    imm_of,
    opc_of,
    opa_of,
    gclk,
    grst,
    dena,
    gpha
);
  parameter AEMB_XSL = 1;  ///< implement XSEL bus (ignored)
  parameter AEMB_XWB = 3;  ///< XSEL bus width

  // XWB control signals   
  output [AEMB_XWB-1:2] xwb_adr_o;
  output [31:0] xwb_dat_o;
  output [3:0] xwb_sel_o;
  output xwb_tag_o;
  output xwb_stb_o, xwb_cyc_o, xwb_wre_o;
  input [31:0] xwb_dat_i;
  input xwb_ack_i;

  // INTERNAL
  output xwb_fb;
  output [31:0] xwb_mx;
  input [15:0] imm_of;
  input [5:0] opc_of;
  input [31:0] opa_of;

  // SYS signals
  input gclk, grst, dena, gpha;

  /*AUTOREG*/
  // Beginning of automatic regs (for this module's undeclared outputs)
  reg [AEMB_XWB-1:2] xwb_adr_o;
  reg [31:0] xwb_dat_o;
  reg [31:0] xwb_mx;
  reg xwb_stb_o;
  reg xwb_tag_o;
  reg xwb_wre_o;
  // End of automatics

  // FIXME: perform NGET/NPUT non-blocking operations
  assign xwb_fb = (xwb_stb_o ~^ xwb_ack_i);

  // XSEL bus
  reg [31:0] xwb_lat;

  always @(posedge gclk)
    if (grst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      xwb_adr_o <= {(1 + (AEMB_XWB - 1) - (2)) {1'b0}};
      xwb_dat_o <= 32'h0;
      xwb_mx <= 32'h0;
      xwb_tag_o <= 1'h0;
      xwb_wre_o <= 1'h0;
      // End of automatics
    end else if (dena) begin

      xwb_adr_o <= #1 imm_of[11:0];  // FSLx	
      xwb_wre_o <= #1 imm_of[15];  // PUT
      xwb_tag_o <= #1 imm_of[13];  // cGET/cPUT	

      xwb_dat_o <= #1 opa_of;  // Latch output

      xwb_mx <= #1 (xwb_ack_i) ? xwb_dat_i :  // stalled from XWB
      xwb_lat;  // Latch earlier

    end  // if (dena)

  assign xwb_sel_o = 4'hF;

  // Independent on pipeline
  reg xBLK;

  always @(posedge gclk)
    if (grst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      xwb_lat <= 32'h0;
      // End of automatics
    end else if (xwb_ack_i) begin
      xwb_lat <= #1 xwb_dat_i;
    end

  always @(posedge gclk)
    if (grst) begin
      /*AUTORESET*/
      // Beginning of autoreset for uninitialized flops
      xBLK <= 1'h0;
      xwb_stb_o <= 1'h0;
      // End of automatics
    end else if (xwb_fb) begin
      xBLK <= #1 imm_of[14];  // nGET/nPUT	
      xwb_stb_o <= #1 (dena) ? !opc_of[5] & opc_of[4] & opc_of[3] & opc_of[1] :  // GET/PUT
      (xwb_stb_o & !xwb_ack_i);
    end

  assign xwb_cyc_o = xwb_stb_o;
  //assign xwb_stb_o = (AEMB_XSL[0]) ? xSTB : 1'bX;   

endmodule

