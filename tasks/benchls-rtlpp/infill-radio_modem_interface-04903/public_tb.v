// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04903 dut (
    .clk(clk),
    .iocs(in_vec[59:59]),
    .ioaddr(in_vec[58:56]),
    .din(in_vec[55:40]),
    .iowr(in_vec[39:39]),
    .iord(in_vec[38:38]),
    .rdix(in_vec[37:20]),
    .rdiy(in_vec[19:2]),
    .riv(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .dout(out_vec[83:68]),
    .pttout(out_vec[67:67]),
    .x(out_vec[66:51]),
    .y(out_vec[50:35]),
    .xyv(out_vec[34:34]),
    .m(out_vec[33:18]),
    .p(out_vec[17:6]),
    .mpv(out_vec[5:5]),
    .start(out_vec[4:4]),
    .sync(out_vec[3:3]),
    .dcd(out_vec[2:2]),
    .fcd(out_vec[1:1]),
    .xmtout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h438e554f0f7927f;
    stim[1] = 60'h7635645dae6fbdb;
    stim[2] = 60'h904c033894995e6;
    stim[3] = 60'h41c6a93c738355e;
    stim[4] = 60'h52e0ae05f6bfd82;
    stim[5] = 60'h7b01bbb0dbde7b8;
    stim[6] = 60'h1a47e8b409ecbd0;
    stim[7] = 60'h4c9d3f9ea962bbe;
    stim[8] = 60'h726922b579ab102;
    stim[9] = 60'ha17a0a0d5692c40;
    stim[10] = 60'h7ab5f48d9eb0b3a;
    stim[11] = 60'h3899f4ec7b1ce1e;
    stim[12] = 60'hccd164ec55973de;
    stim[13] = 60'hf96a2ddcb5b914e;
    stim[14] = 60'haae48ab83643c66;
    stim[15] = 60'hfdcbe464f167b8e;
    stim[16] = 60'h08aeb45ae0c22ca;
    stim[17] = 60'h4b39da1a1500500;
    stim[18] = 60'hd2926b707ac23b2;
    stim[19] = 60'h52c667452735a32;
    stim[20] = 60'h04a4f455f831cb0;
    stim[21] = 60'h34d0ff308fe9cb4;
    stim[22] = 60'hbdddda8221beebe;
    stim[23] = 60'h20a5d5ae3346e7c;
    stim[24] = 60'h6cf625a20fbbc5e;
    stim[25] = 60'h56a047020865d84;
    stim[26] = 60'h6de743ab9b0b0a4;
    stim[27] = 60'h5ced8ad63cbc00e;
    stim[28] = 60'hcb37d423fba6776;
    stim[29] = 60'h04b066825aa7b84;
    stim[30] = 60'h50d6bca696f4e1e;
    stim[31] = 60'h302f099b7d6cccc;
    stim[32] = 60'hbe1d0b529176772;
    stim[33] = 60'hf02f9e5017797e4;
    stim[34] = 60'hab2bc5302a64720;
    stim[35] = 60'h115a293523904d2;
    stim[36] = 60'hc2eb113c730d7fc;
    stim[37] = 60'h51447dd95b8b90e;
    stim[38] = 60'h4578a7b5c97ac44;
    stim[39] = 60'haec7ec2aba8b8a8;
    stim[40] = 60'h67621cc8d2558c0;
    stim[41] = 60'h9affc7a6d74dab6;
    stim[42] = 60'h45e8d87e4a719fe;
    stim[43] = 60'h27137b3733ee5b0;
    stim[44] = 60'h0655c2e7fbaeb40;
    stim[45] = 60'h8d6c60611c4cb30;
    stim[46] = 60'hb395cef49f19290;
    stim[47] = 60'h727b1502ca0948c;
    stim[48] = 60'h1fe5dfe9b7224c4;
    stim[49] = 60'h0f2aeb90503754a;
    stim[50] = 60'hce6baf9cf94346e;
    stim[51] = 60'h740645d63a5b88e;
    stim[52] = 60'h512ad00bc81e500;
    stim[53] = 60'h867fa1884252206;
    stim[54] = 60'h04b52c07fa08d30;
    stim[55] = 60'hbdff7f1df19b66a;
    stim[56] = 60'h2a73147850ce914;
    stim[57] = 60'h6ce7c6535f17414;
    stim[58] = 60'h3c184b1c10dbcc8;
    stim[59] = 60'hcb08b6f9f228754;
    stim[60] = 60'hf6ca7156b8c9566;
    stim[61] = 60'h5c9652c28d6d0b8;
    stim[62] = 60'h7653c07b1d98726;
    stim[63] = 60'hd19cc2d29a36dbc;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 84'hxxxxxxxxxxxxx0000000x;
      expv[1] = 84'hxxxxxxxxxxxxx0000000x;
      expv[2] = 84'hx000xxxxxxxxx0000000x;
      expv[3] = 84'hx000xxxxxxxxx0000000x;
      expv[4] = 84'hxxxxxxxxxxxxx0000000x;
      expv[5] = 84'hx000xxxxxxxxx0000000x;
      expv[6] = 84'hx000xxxxxxxxx0000000x;
      expv[7] = 84'hx000xxxxxxxxx0000000x;
      expv[8] = 84'hxxxx034b000040000003x;
      expv[9] = 84'hx000034b000040d2c003c;
      expv[10] = 84'h034b034b000040d2c003c;
      expv[11] = 84'h2800034b000040d2c003c;
      expv[12] = 84'h2000049c800040d2c003c;
      expv[13] = 84'h0000049c800041270003c;
      expv[14] = 84'h2800049c800041270003c;
      expv[15] = 84'h049c049c800041270003c;
      expv[16] = 84'h2800049c800041270003c;
      expv[17] = 84'h049c049c800041270003c;
      expv[18] = 84'h0000049c800041270003c;
      expv[19] = 84'h2800049c800041270003c;
      expv[20] = 84'h28002917000041270003c;
      expv[21] = 84'h049c291700004a45c003c;
      expv[22] = 84'h2000291700004a45c003c;
      expv[23] = 84'h2000374d80004a45c003c;
      expv[24] = 84'h2917374d80004dd34003c;
      expv[25] = 84'h0000374d80004dd34003c;
      expv[26] = 84'h2800433900004dd34003c;
      expv[27] = 84'h00004339000050ce4003c;
      expv[28] = 84'h2800597c000050ce4003c;
      expv[29] = 84'h0000597c0000565f0003c;
      expv[30] = 84'h597c597c0000565f0003c;
      expv[31] = 84'h2800597c0000565f0003c;
      expv[32] = 84'h2000450f0000565f0003c;
      expv[33] = 84'h2000450f00005143c003c;
      expv[34] = 84'h2800e98780005143c003d;
      expv[35] = 84'h450fe98780005a61c003d;
      expv[36] = 84'h2000bc5a80005a61c003d;
      expv[37] = 84'h0000bc5a80004f168003d;
      expv[38] = 84'h2800bc5a80004f168003d;
      expv[39] = 84'h0000f9f780004f168003d;
      expv[40] = 84'h3c5af9f780005e7dc003d;
      expv[41] = 84'h0000d58c00005e7dc003d;
      expv[42] = 84'h2000d58c000055630003d;
      expv[43] = 84'h0000d58c000055630003d;
      expv[44] = 84'h558cd58c000055630003d;
      expv[45] = 84'h558cd58c000055630003d;
      expv[46] = 84'h558cdbe5800055630003d;
      expv[47] = 84'h2000dbe5800056f94003d;
      expv[48] = 84'h2800dbe5800056f94003d;
      expv[49] = 84'h2000dbe5800056f94003d;
      expv[50] = 84'h5be5dbe5800056f94003d;
      expv[51] = 84'h0000dbe5800056f94003d;
      expv[52] = 84'h2800dbe5800056f94003d;
      expv[53] = 84'h2800dbe5800056f94003d;
      expv[54] = 84'h5be5dbe5800056f94003d;
      expv[55] = 84'h5be5b40b800056f94003d;
      expv[56] = 84'h2000b40b80004d02c003d;
      expv[57] = 84'h340b9fe080004d02c003d;
      expv[58] = 84'h00009fe0800047f80003d;
      expv[59] = 84'h2000d82b800047f80003d;
      expv[60] = 84'h0000d82b8000560ac003d;
      expv[61] = 84'h2800d82b8000560ac003d;
      expv[62] = 84'h2800d82b8000560ac003d;
      expv[63] = 84'h2800d82b8000560ac003d;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
