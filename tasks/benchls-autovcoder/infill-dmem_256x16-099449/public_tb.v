// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099449 dut (
    .clk(clk),
    .addr(in_vec[25:18]),
    .rd(in_vec[17:17]),
    .wr(in_vec[16:16]),
    .W_data(in_vec[15:0]),
    .R_data(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h1132092;
    stim[1] = 26'h204aae3;
    stim[2] = 26'h2de0b9f;
    stim[3] = 26'h15397ff;
    stim[4] = 26'h34ad93f;
    stim[5] = 26'h02ec07b;
    stim[6] = 26'h32fc687;
    stim[7] = 26'h37cda76;
    stim[8] = 26'h0742850;
    stim[9] = 26'h31915c0;
    stim[10] = 26'h0efd288;
    stim[11] = 26'h0923237;
    stim[12] = 26'h37f74db;
    stim[13] = 26'h115da54;
    stim[14] = 26'h1b553f0;
    stim[15] = 26'h01966d1;
    stim[16] = 26'h2f7d88a;
    stim[17] = 26'h39d2e42;
    stim[18] = 26'h17badf8;
    stim[19] = 26'h189fe24;
    stim[20] = 26'h2b92c3c;
    stim[21] = 26'h3581de8;
    stim[22] = 26'h284e165;
    stim[23] = 26'h2a88760;
    stim[24] = 26'h0cefe3b;
    stim[25] = 26'h15e2981;
    stim[26] = 26'h3238a3d;
    stim[27] = 26'h204858b;
    stim[28] = 26'h022d6cd;
    stim[29] = 26'h0508b53;
    stim[30] = 26'h26eb4ac;
    stim[31] = 26'h37ef383;
    stim[32] = 26'h252b6c8;
    stim[33] = 26'h118fb37;
    stim[34] = 26'h1f4fefe;
    stim[35] = 26'h080c349;
    stim[36] = 26'h24154e7;
    stim[37] = 26'h39fb155;
    stim[38] = 26'h0795f7c;
    stim[39] = 26'h3679529;
    stim[40] = 26'h029724c;
    stim[41] = 26'h20f3724;
    stim[42] = 26'h1c8f43f;
    stim[43] = 26'h3dfed99;
    stim[44] = 26'h059a4f7;
    stim[45] = 26'h388fda7;
    stim[46] = 26'h2c9db53;
    stim[47] = 26'h20c787b;
    stim[48] = 26'h1a75d59;
    stim[49] = 26'h0b3f51d;
    stim[50] = 26'h379e53c;
    stim[51] = 26'h03615c3;
    stim[52] = 26'h3d020dc;
    stim[53] = 26'h2fb7d2d;
    stim[54] = 26'h184e25f;
    stim[55] = 26'h1d91e7b;
    stim[56] = 26'h1a4bba3;
    stim[57] = 26'h0b86bbc;
    stim[58] = 26'h121a707;
    stim[59] = 26'h0fdd5b3;
    stim[60] = 26'h3d52167;
    stim[61] = 26'h1e031db;
    stim[62] = 26'h2d6997a;
    stim[63] = 26'h3be2de6;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'hb345;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h89ab;
      expv[30] = 16'h89ab;
      expv[31] = 16'h0000;
      expv[32] = 16'h74db;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h2e42;
      expv[39] = 16'h2e42;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'hd9ab;
      expv[53] = 16'hd9ab;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
