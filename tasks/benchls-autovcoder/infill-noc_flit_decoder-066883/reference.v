module autovcoder_066883 #(
    parameter SWA_ARBITER_TYPE= "RRA",// "RRA", "WRRA",
    parameter WEIGHTw = 4, // WRRA weight width
    parameter V = 4,    // vc_num_per_port
    parameter EAw = 3,
    parameter DSTPw=4,
    parameter C = 4,    //  number of flit class 
    parameter Fpay = 32,     //payload width
    parameter DATA_w = 0
) (
    //inputs
    flit_in,
    flit_in_we,
    //outputs
    src_e_addr_o,
    dest_e_addr_o,
    destport_o,
    class_o,
    weight_o,
    data_o,
    tail_flg_o,
    hdr_flg_o,
    vc_num_o,
    hdr_flit_wr_o

);



  function integer log2;
    input integer number;
    begin
      log2 = (number <= 1) ? 1 : 0;
      while (2 ** log2 < number) begin
        log2 = log2 + 1;
      end
    end
  endfunction  // log2 

  localparam Fw = 2 + V + Fpay,  //flit width
  Cw = (C > 1) ? log2(
      C
  ) : 1, W = WEIGHTw;

  localparam Dw = (DATA_w == 0) ? 1 : DATA_w;


  input [Fw-1 : 0] flit_in;
  input flit_in_we;

  output [EAw-1 : 0] src_e_addr_o;
  output [EAw-1 : 0] dest_e_addr_o;
  output [DSTPw-1 : 0] destport_o;
  output [Cw-1 : 0] class_o;
  output [W-1 : 0] weight_o;
  output tail_flg_o;
  output hdr_flg_o;
  output [V-1 : 0] vc_num_o;
  output [V-1 : 0] hdr_flit_wr_o;
  output [Dw-1 : 0] data_o;



  localparam 
        E_SRC_LSB =0,                   E_SRC_MSB = E_SRC_LSB + EAw-1,
        E_DST_LSB = E_SRC_MSB +1,       E_DST_MSB = E_DST_LSB + EAw-1,  
        DST_P_LSB = E_DST_MSB + 1,      DST_P_MSB = DST_P_LSB + DSTPw-1, 
        CLASS_LSB = DST_P_MSB + 1,      CLASS_MSB = CLASS_LSB + Cw -1, 
        MSB_CLASS = (C>1)? CLASS_MSB : DST_P_MSB,
        WEIGHT_LSB= MSB_CLASS + 1,           WEIGHT_MSB = WEIGHT_LSB + WEIGHTw -1,
  /* verilator lint_off WIDTH */
  MSB_W = (SWA_ARBITER_TYPE == "WRRA") ? WEIGHT_MSB : MSB_CLASS,
  /* verilator lint_on WIDTH */
  DATA_LSB = MSB_W + 1, DATA_MSB = (DATA_LSB + DATA_w) < Fpay ? DATA_LSB + Dw - 1 : Fpay - 1;



  localparam OFFSETw = DATA_MSB - DATA_LSB + 1;

  wire [OFFSETw-1 : 0] offset;

  assign src_e_addr_o = flit_in[E_SRC_MSB : E_SRC_LSB];
  assign dest_e_addr_o = flit_in[E_DST_MSB : E_DST_LSB];
  assign destport_o = flit_in[DST_P_MSB : DST_P_LSB];


  generate
    if (C > 1) begin : have_class
      assign class_o = flit_in[CLASS_MSB : CLASS_LSB];
    end else begin : no_class
      assign class_o = {Cw{1'b0}};
    end

    /* verilator lint_off WIDTH */
    if (SWA_ARBITER_TYPE != "RRA") begin : wrra_b
      /* verilator lint_on WIDTH */
      assign weight_o = flit_in[WEIGHT_MSB : WEIGHT_LSB];
    end else begin : rra_b
      assign weight_o = {WEIGHTw{1'bX}};
    end

    assign offset = flit_in[DATA_MSB : DATA_LSB];


    if (Dw > OFFSETw) begin : if1
      assign data_o = {{(Dw - OFFSETw) {1'b0}}, offset};
    end else begin : if2
      assign data_o = offset[Dw-1 : 0];
    end

  endgenerate

  assign vc_num_o = flit_in [Fpay+V-1 : Fpay];
  assign hdr_flg_o= flit_in [Fw-1];
  assign tail_flg_o=    flit_in   [Fw-2];
  assign hdr_flit_wr_o= (flit_in_we & hdr_flg_o )? vc_num_o : {V{1'b0}};

endmodule

