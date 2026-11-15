module autovcoder_020699 (
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
    romselp_d
);

  output romselp_d;
  input [3:0] branch;
  input morethree, fmulovf, rsge64, absign, addsub, manzero, rs32, eadd, amsb, rem_op, qmsb;
  input [2:0] a2func;

  reg romselp_d;

  always @(branch or morethree or fmulovf or rsge64 or absign or
          addsub or manzero or
          rs32 or eadd or amsb or rem_op or qmsb or a2func)
 begin
    case (branch)  // synopsys parallel_case
      4'h0, 4'h2: romselp_d = 1'h1;
      4'h1:       romselp_d = morethree;
      4'h3:       romselp_d = fmulovf;
      4'h4:       romselp_d = rsge64;
      4'h5:       romselp_d = absign;
      4'h6:       romselp_d = addsub;
      4'h7:       romselp_d = manzero;
      4'h8:       romselp_d = rs32;
      4'h9:       romselp_d = eadd;
      4'h9:       romselp_d = eadd;
      4'ha: begin
        if (rem_op) romselp_d = (a2func == 3'h6) ? 1'b1 : amsb;
        else romselp_d = (a2func == 3'h6) ? qmsb : amsb;
      end
      default:    romselp_d = 1'h0;
    endcase
  end
endmodule

