// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087575 dut (
    .clk(clk),
    .ra(in_vec[61:57]),
    .re(in_vec[56:56]),
    .ore(in_vec[55:55]),
    .wa(in_vec[54:50]),
    .we(in_vec[49:49]),
    .di(in_vec[48:41]),
    .byp_sel(in_vec[40:40]),
    .dbyp(in_vec[39:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h0ce7a80ff2c9171c;
    stim[1] = 62'h312201f2e87d8048;
    stim[2] = 62'h0c7086e4df060d07;
    stim[3] = 62'h23c3b036424ed180;
    stim[4] = 62'h3d680dfdd7d478dc;
    stim[5] = 62'h054df69f7fd26159;
    stim[6] = 62'h15f28e6d38827473;
    stim[7] = 62'h13a5212fc37e442a;
    stim[8] = 62'h369224b9fc8306ba;
    stim[9] = 62'h0d4fababd49e06f5;
    stim[10] = 62'h2886e45cc09aab76;
    stim[11] = 62'h3083298f47791ff1;
    stim[12] = 62'h1b183acb76c1dc8a;
    stim[13] = 62'h37df56296fe09917;
    stim[14] = 62'h223ff0866683d927;
    stim[15] = 62'h1631bf4a941c7a07;
    stim[16] = 62'h248ea5691f3fbe73;
    stim[17] = 62'h15634372848f1d3d;
    stim[18] = 62'h3129bc84443a5d71;
    stim[19] = 62'h091f814c4816ca27;
    stim[20] = 62'h3ce1eafeb784a069;
    stim[21] = 62'h1c280a07d6a7a8bf;
    stim[22] = 62'h2f8720056072c760;
    stim[23] = 62'h1c30139f670b0699;
    stim[24] = 62'h188d83151f5b3042;
    stim[25] = 62'h2520d924a711d142;
    stim[26] = 62'h3387c69af549f1e5;
    stim[27] = 62'h3ac31d7e67b1b22e;
    stim[28] = 62'h2b807590a1721be0;
    stim[29] = 62'h135de70820b5108c;
    stim[30] = 62'h1b0f10f853456b89;
    stim[31] = 62'h0f2a540b075288ca;
    stim[32] = 62'h083afe0aa21be731;
    stim[33] = 62'h1f60ac681d44bdc5;
    stim[34] = 62'h222e1e70e6d0c6ef;
    stim[35] = 62'h22b0703ab2273c71;
    stim[36] = 62'h2b9e332994c06f49;
    stim[37] = 62'h225107fba5769f3e;
    stim[38] = 62'h3f1348d05ebba34d;
    stim[39] = 62'h1b23684b27214d0e;
    stim[40] = 62'h1fb3aa5a589ce4ad;
    stim[41] = 62'h1d44e9af68900ee1;
    stim[42] = 62'h3684fbfa05f2585a;
    stim[43] = 62'h32e21697b39d5953;
    stim[44] = 62'h102dfb709cfb04c4;
    stim[45] = 62'h24d3e964e4733337;
    stim[46] = 62'h2914feae9723977c;
    stim[47] = 62'h2beaefbe4d8ce1c9;
    stim[48] = 62'h10609ddb2a92a8ad;
    stim[49] = 62'h1518a8833b36ba0c;
    stim[50] = 62'h20eb70b8d4fa4e23;
    stim[51] = 62'h17f3da92b6ed738a;
    stim[52] = 62'h10c45f074bb69578;
    stim[53] = 62'h1994d24f1d885065;
    stim[54] = 62'h2f541c10ee039339;
    stim[55] = 62'h2ed00dd3244a17f5;
    stim[56] = 62'h13aa55b90ac4300a;
    stim[57] = 62'h3fc53436bf4d6400;
    stim[58] = 62'h38c5afbd766ae266;
    stim[59] = 62'h2d2ae677c4a077e2;
    stim[60] = 62'h2beeac14c5feea38;
    stim[61] = 62'h1106f5d8f5e14a73;
    stim[62] = 62'h320d34636d98f012;
    stim[63] = 62'h0c5b055aa278f357;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'h2f;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'h8f;
      expv[13] = 8'h8f;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'h69;
      expv[18] = 8'h69;
      expv[19] = 8'h69;
      expv[20] = 8'h69;
      expv[21] = 8'h12;
      expv[22] = 8'h12;
      expv[23] = 8'h12;
      expv[24] = 8'h12;
      expv[25] = 8'h15;
      expv[26] = 8'h15;
      expv[27] = 8'hxx;
      expv[28] = 8'h7e;
      expv[29] = 8'h90;
      expv[30] = 8'h90;
      expv[31] = 8'h90;
      expv[32] = 8'h90;
      expv[33] = 8'h90;
      expv[34] = 8'h90;
      expv[35] = 8'h90;
      expv[36] = 8'hf8;
      expv[37] = 8'h29;
      expv[38] = 8'h29;
      expv[39] = 8'h29;
      expv[40] = 8'h29;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'hfa;
      expv[44] = 8'h7f;
      expv[45] = 8'h7f;
      expv[46] = 8'h64;
      expv[47] = 8'h64;
      expv[48] = 8'hbe;
      expv[49] = 8'hbe;
      expv[50] = 8'hbe;
      expv[51] = 8'h2a;
      expv[52] = 8'h2a;
      expv[53] = 8'h07;
      expv[54] = 8'h0f;
      expv[55] = 8'h0f;
      expv[56] = 8'hd3;
      expv[57] = 8'hb9;
      expv[58] = 8'hxx;
      expv[59] = 8'hbd;
      expv[60] = 8'hbd;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
