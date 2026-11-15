module autovcoder_004332 #(
    parameter DATA_WIDTH = 32
) (
    // -----------------------------------------------------------------------------
    // Module Parameters
    // -----------------------------------------------------------------------------
    // ------------------------------------------------------------------------------
    // Input/Output Ports
    // ------------------------------------------------------------------------------
    input ahbl_hclk_i,
    input ahbl_hresetn_i,
    input ahbl_hsel_i,
    input [1:0] ahbl_htrans_i,
    output reg ahbl_hready_def_o,
    output reg ahbl_hresp_def_o,
    output wire [(DATA_WIDTH - 1):0] ahbl_hrdata_def_o
);
  // ------------------------------------------------------------------------------
  // Local Parameters
  // ------------------------------------------------------------------------------
  localparam ST_WIDTH = 2;
  localparam ST_RDY = 0;
  localparam ST_ERR0 = 1;
  localparam ST_ERR1 = 2;
  localparam IDLE = 2'b00;
  localparam BUSY = 2'b01;
  localparam NSEQ = 2'b10;
  localparam SEQ = 2'b11;
  // ------------------------------------------------------------------------------
  // Combinatorial Registers
  // ------------------------------------------------------------------------------
  reg [(ST_WIDTH - 1):0] ns_sm;
  // ------------------------------------------------------------------------------
  // Sequential Registers3
  // ------------------------------------------------------------------------------
  reg [(ST_WIDTH - 1):0] cs_sm;
  // ------------------------------------------------------------------------------
  // Assign Statements
  // ------------------------------------------------------------------------------
  assign ahbl_hrdata_def_o = {DATA_WIDTH{1'b1}};
  // ------------------------------------------------------------------------------
  // Combinatorial Block
  // ------------------------------------------------------------------------------
  always @(*) begin
    ns_sm = cs_sm;
    ahbl_hready_def_o = 1'b1;
    ahbl_hresp_def_o = 1'b0;
    case (cs_sm)
      ST_RDY: begin
        if (ahbl_hsel_i) begin
          ns_sm = (((ahbl_htrans_i == NSEQ) || (ahbl_htrans_i == SEQ)) ? ST_ERR0 : ST_RDY);
        end
      end
      ST_ERR0: begin
        //      if (ahbl_hsel_i) begin      
        ahbl_hready_def_o = 1'b0;
        ahbl_hresp_def_o = 1'b1;
        ns_sm = ST_ERR1;
        //      end
        //      else begin
        //        ns_sm  = ST_RDY;
        //      end
      end
      ST_ERR1: begin
        ahbl_hready_def_o = 1'b1;
        ahbl_hresp_def_o = 1'b1;
        ns_sm = (((ahbl_htrans_i == IDLE) || (ahbl_htrans_i == BUSY)) ? ST_RDY : ST_ERR0);
      end
      default: begin
        ns_sm = ST_RDY;
      end
    endcase  // case (cs_sm)
  end
  // ------------------------------------------------------------------------------
  // Sequential Block
  // ------------------------------------------------------------------------------
  always @(posedge ahbl_hclk_i or negedge ahbl_hresetn_i) begin
    if ((~ahbl_hresetn_i)) begin
      cs_sm <= ST_RDY;
    end else begin
      cs_sm <= ns_sm;
    end
  end
endmodule

