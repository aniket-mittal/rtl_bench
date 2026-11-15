module autovcoder_020697 (
    branch,
    morethree,
    fmulovf,
    rsge64,
    absign,
    addsub,
    manzero,
    rs32,
    eadd,
    amsb,
    rem_op,
    qmsb,
    a2func,
    romselp_b
);

  output romselp_b;
  input [3:0] branch;
  input morethree, fmulovf, rsge64, absign, addsub, manzero, rs32, eadd, amsb, rem_op, qmsb;
  input [2:0] a2func;

  reg romselp_b;

  always @(branch or morethree or fmulovf or rsge64 or absign or
          addsub or manzero or
          rs32 or eadd or amsb or rem_op or qmsb or a2func)
 begin
    case (branch)  // synopsys parallel_case
      4'h0, 4'h2: romselp_b = 1'h1;
      4'h1:       romselp_b = morethree;
      4'h3:       romselp_b = fmulovf;
      4'h4:       romselp_b = rsge64;
      4'h5:       romselp_b = absign;
      4'h6:       romselp_b = addsub;
      4'h7:       romselp_b = manzero;
      4'h8:       romselp_b = rs32;
      4'h9:       romselp_b = eadd;
      4'ha: begin
        if (rem_op) romselp_b = (a2func == 3'h6) ? 1'b0 : amsb;
        else romselp_b = (a2func == 3'h6) ? qmsb : amsb;
      end
      default:    romselp_b = 1'h0;
    endcase
  end
endmodule

