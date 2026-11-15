// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04226 dut (
    .clk(clk),
    .ce(in_vec[63:63]),
    .a(in_vec[62:32]),
    .b(in_vec[31:0]),
    .p(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h2f78fce4120a5635;
    stim[1] = 64'h32ce993d6bd20069;
    stim[2] = 64'h3a2b75ce5dce6c70;
    stim[3] = 64'hd4c7203f09934fb2;
    stim[4] = 64'h2c2caa860c9c618c;
    stim[5] = 64'h55f0505fa422ada9;
    stim[6] = 64'h679168c99c2d21a7;
    stim[7] = 64'he9d7782d5a1e083a;
    stim[8] = 64'h727434bd09ff5961;
    stim[9] = 64'h8411a09dec6b4c00;
    stim[10] = 64'hfb590d48742e40bc;
    stim[11] = 64'hd9ce7e6fd2e45ecc;
    stim[12] = 64'hc5488cb012657ee7;
    stim[13] = 64'h2ee8c90c35ecd54d;
    stim[14] = 64'ha5d440cad3fad4a0;
    stim[15] = 64'h4bc16fee966e8861;
    stim[16] = 64'hfdf1da26baf0508f;
    stim[17] = 64'h49aa532bf56ffc71;
    stim[18] = 64'h9fe4098836aaf51d;
    stim[19] = 64'h3897239634bd203a;
    stim[20] = 64'h671c9aa13bb3a92b;
    stim[21] = 64'h11dd1a4fcd0854d6;
    stim[22] = 64'he0a4a4d06f01251d;
    stim[23] = 64'ha6743466bbc5ec21;
    stim[24] = 64'h6fa67acc916bcd06;
    stim[25] = 64'he2fc310179593f1b;
    stim[26] = 64'h9b0adf68ae5fd60d;
    stim[27] = 64'h5719e267d6981911;
    stim[28] = 64'h3402f47b66a5d405;
    stim[29] = 64'h83c5e910258cebeb;
    stim[30] = 64'h89b95aa4bbd2d37f;
    stim[31] = 64'h9ab65775d08a119d;
    stim[32] = 64'hed494e65c4c91585;
    stim[33] = 64'h349140c8ff124b18;
    stim[34] = 64'h96b09f77b2f55315;
    stim[35] = 64'h9e61c6b20b06bcd9;
    stim[36] = 64'h995af1807df10242;
    stim[37] = 64'hfbf77b83a0721dcc;
    stim[38] = 64'hd343e619e6c0edd2;
    stim[39] = 64'h147db4a8e571678d;
    stim[40] = 64'h7571865a4b9678d7;
    stim[41] = 64'he8049476d637fdbb;
    stim[42] = 64'h02fca625aedfc9ca;
    stim[43] = 64'h28da802ec441be7e;
    stim[44] = 64'hb664973201d29581;
    stim[45] = 64'h5d5ab0d70d29ee9e;
    stim[46] = 64'h14c7a42b56ae38d0;
    stim[47] = 64'h31b00ba14eb8709b;
    stim[48] = 64'haa33cdd8a1740c4b;
    stim[49] = 64'h1d4e3b0334d52896;
    stim[50] = 64'hc4121b74863f0f7a;
    stim[51] = 64'hcc84d42fcdb4d935;
    stim[52] = 64'ha67373515671383c;
    stim[53] = 64'h7cfcc3c2caf5a575;
    stim[54] = 64'hc91ba39653b13b62;
    stim[55] = 64'hb66f2758425da4d1;
    stim[56] = 64'h2c8aa9fb4c7bb9f3;
    stim[57] = 64'h229fe675fa1f6433;
    stim[58] = 64'h6234eb08482be180;
    stim[59] = 64'hf79e80c968b76e9a;
    stim[60] = 64'h5abc4eebca4db5b7;
    stim[61] = 64'he4a8424aff3c3e8d;
    stim[62] = 64'h82a827aa4c364653;
    stim[63] = 64'h5c95fdbc33bad531;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'h2094dcce;
      expv[9] = 32'h2094dcce;
      expv[10] = 32'h9dd8a232;
      expv[11] = 32'h194d9c00;
      expv[12] = 32'hdba7c0e0;
      expv[13] = 32'h0bd58274;
      expv[14] = 32'h0bd58274;
      expv[15] = 32'h1b2592d0;
      expv[16] = 32'h1b2592d0;
      expv[17] = 32'h2d93c640;
      expv[18] = 32'h2d93c640;
      expv[19] = 32'h0de4bb3a;
      expv[20] = 32'h0de4bb3a;
      expv[21] = 32'h0de4bb3a;
      expv[22] = 32'h0de4bb3a;
      expv[23] = 32'hde443c68;
      expv[24] = 32'h9348bb90;
      expv[25] = 32'h9348bb90;
      expv[26] = 32'he9c6c926;
      expv[27] = 32'h03016a1b;
      expv[28] = 32'h03016a1b;
      expv[29] = 32'h03016a1b;
      expv[30] = 32'h0de64848;
      expv[31] = 32'he85ea1b0;
      expv[32] = 32'hbf31235c;
      expv[33] = 32'hb2b467c1;
      expv[34] = 32'hb2b467c1;
      expv[35] = 32'habd10379;
      expv[36] = 32'h7b13a9c3;
      expv[37] = 32'hdcf824e2;
      expv[38] = 32'h18d54300;
      expv[39] = 32'hb28a4364;
      expv[40] = 32'hb28a4364;
      expv[41] = 32'hb28a4364;
      expv[42] = 32'h3277e582;
      expv[43] = 32'h3277e582;
      expv[44] = 32'h3277e582;
      expv[45] = 32'h0b6b1032;
      expv[46] = 32'h0b6b1032;
      expv[47] = 32'h0b6b1032;
      expv[48] = 32'h0b6b1032;
      expv[49] = 32'h2db44a32;
      expv[50] = 32'h2db44a32;
      expv[51] = 32'he8b36e48;
      expv[52] = 32'hf9c8e148;
      expv[53] = 32'h4367c4bb;
      expv[54] = 32'h4367c4bb;
      expv[55] = 32'h6109befc;
      expv[56] = 32'h17fe316c;
      expv[57] = 32'h17fe316c;
      expv[58] = 32'h17fe316c;
      expv[59] = 32'h17fe316c;
      expv[60] = 32'ha0eb7ed8;
      expv[61] = 32'ha0eb7ed8;
      expv[62] = 32'hc85ed6ea;
      expv[63] = 32'h70126ec2;
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
