// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00294 dut (
    .clk(clk),
    .address(in_vec[37:36]),
    .chipselect(in_vec[35:35]),
    .in_port(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3435d348ef;
    stim[1] = 38'h24ba4d431b;
    stim[2] = 38'h0d428c214b;
    stim[3] = 38'h3f74d44306;
    stim[4] = 38'h072a2b80f6;
    stim[5] = 38'h060c7c8ab2;
    stim[6] = 38'h32b64c7c2a;
    stim[7] = 38'h1ace8e6345;
    stim[8] = 38'h3a97d2b052;
    stim[9] = 38'h3a3acffd11;
    stim[10] = 38'h0f43ada799;
    stim[11] = 38'h377b81ab28;
    stim[12] = 38'h1b46d27fcf;
    stim[13] = 38'h1ed2a3f2a2;
    stim[14] = 38'h26da98ee54;
    stim[15] = 38'h1b95e0f96e;
    stim[16] = 38'h277c8ee594;
    stim[17] = 38'h0353b83e2a;
    stim[18] = 38'h1adaa1332d;
    stim[19] = 38'h0a3c0de7dd;
    stim[20] = 38'h0785b26a00;
    stim[21] = 38'h2fd3a8b37e;
    stim[22] = 38'h20495753a6;
    stim[23] = 38'h0320814742;
    stim[24] = 38'h06916f2f91;
    stim[25] = 38'h33139c5bd6;
    stim[26] = 38'h36952e0e13;
    stim[27] = 38'h1e721d610b;
    stim[28] = 38'h1a3b404005;
    stim[29] = 38'h373cd8f0ad;
    stim[30] = 38'h2a467519d1;
    stim[31] = 38'h3e718acbaf;
    stim[32] = 38'h1b7141574e;
    stim[33] = 38'h068f7de310;
    stim[34] = 38'h075b40f132;
    stim[35] = 38'h2fa8312e00;
    stim[36] = 38'h1f048ea7cd;
    stim[37] = 38'h2290c8b8c9;
    stim[38] = 38'h3ffeb6dc6b;
    stim[39] = 38'h36fb3ff8a9;
    stim[40] = 38'h27d09234cc;
    stim[41] = 38'h3e0d6dd60c;
    stim[42] = 38'h17bc084d8f;
    stim[43] = 38'h27c2640e07;
    stim[44] = 38'h2a1a0c7ae2;
    stim[45] = 38'h3e9d782e9c;
    stim[46] = 38'h062a6fae9d;
    stim[47] = 38'h32bacab606;
    stim[48] = 38'h3aa30ed112;
    stim[49] = 38'h1e14684fe5;
    stim[50] = 38'h0251596f4a;
    stim[51] = 38'h07c339ddc3;
    stim[52] = 38'h3f5405834a;
    stim[53] = 38'h0730883924;
    stim[54] = 38'h1fce2d20b7;
    stim[55] = 38'h176e202b12;
    stim[56] = 38'h262d9a907c;
    stim[57] = 38'h243aa3d2a9;
    stim[58] = 38'h3f21c72a11;
    stim[59] = 38'h3bd514a979;
    stim[60] = 38'h3fe88830bd;
    stim[61] = 38'h3bbfa961f2;
    stim[62] = 38'h027df93beb;
    stim[63] = 38'h13988d31ac;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000001;
      expv[6] = 33'h000000001;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000001;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000001;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000001;
      expv[31] = 33'h100000000;
      expv[32] = 33'h000000001;
      expv[33] = 33'h100000000;
      expv[34] = 33'h100000001;
      expv[35] = 33'h100000001;
      expv[36] = 33'h100000001;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000001;
      expv[39] = 33'h100000001;
      expv[40] = 33'h100000001;
      expv[41] = 33'h100000001;
      expv[42] = 33'h100000001;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000001;
      expv[45] = 33'h000000001;
      expv[46] = 33'h000000001;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000001;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000001;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h000000000;
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
