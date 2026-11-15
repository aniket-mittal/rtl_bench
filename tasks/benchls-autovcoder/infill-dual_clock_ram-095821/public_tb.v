// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_095821 dut (
    .clk_1(clk),
    .clk_2(in_vec[17:17]),
    .reset_n(in_vec[16:16]),
    .cs_n(in_vec[15:15]),
    .we_n(in_vec[14:14]),
    .addr_r(in_vec[13:11]),
    .addr_w(in_vec[10:8]),
    .data_in(in_vec[7:0]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2a7b3;
    stim[1] = 18'h0282b;
    stim[2] = 18'h3899d;
    stim[3] = 18'h3e792;
    stim[4] = 18'h15693;
    stim[5] = 18'h37fc1;
    stim[6] = 18'h1d180;
    stim[7] = 18'h1f0c6;
    stim[8] = 18'h31dc5;
    stim[9] = 18'h1aeae;
    stim[10] = 18'h16eba;
    stim[11] = 18'h1bdb1;
    stim[12] = 18'h18815;
    stim[13] = 18'h1488e;
    stim[14] = 18'h3dbdb;
    stim[15] = 18'h16a77;
    stim[16] = 18'h351ed;
    stim[17] = 18'h3ecd1;
    stim[18] = 18'h39e68;
    stim[19] = 18'h37c7e;
    stim[20] = 18'h10473;
    stim[21] = 18'h3f71b;
    stim[22] = 18'h37cf8;
    stim[23] = 18'h1d2bd;
    stim[24] = 18'h1f898;
    stim[25] = 18'h319f4;
    stim[26] = 18'h3e552;
    stim[27] = 18'h39d9f;
    stim[28] = 18'h123e3;
    stim[29] = 18'h1e561;
    stim[30] = 18'h14bec;
    stim[31] = 18'h392d7;
    stim[32] = 18'h1b79d;
    stim[33] = 18'h3a704;
    stim[34] = 18'h32522;
    stim[35] = 18'h14792;
    stim[36] = 18'h359a9;
    stim[37] = 18'h187ff;
    stim[38] = 18'h1b4ae;
    stim[39] = 18'h1cefa;
    stim[40] = 18'h36f2e;
    stim[41] = 18'h12d3a;
    stim[42] = 18'h1ce3d;
    stim[43] = 18'h380ed;
    stim[44] = 18'h1886c;
    stim[45] = 18'h1425e;
    stim[46] = 18'h1f890;
    stim[47] = 18'h31fab;
    stim[48] = 18'h1ac6a;
    stim[49] = 18'h1af8b;
    stim[50] = 18'h14b74;
    stim[51] = 18'h39e1f;
    stim[52] = 18'h32dd3;
    stim[53] = 18'h15d9d;
    stim[54] = 18'h3729b;
    stim[55] = 18'h343d2;
    stim[56] = 18'h1c760;
    stim[57] = 18'h1583d;
    stim[58] = 18'h10b03;
    stim[59] = 18'h321ff;
    stim[60] = 18'h33d89;
    stim[61] = 18'h32ae8;
    stim[62] = 18'h1487f;
    stim[63] = 18'h16685;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'he3;
      expv[37] = 8'he3;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h22;
      expv[41] = 8'h22;
      expv[42] = 8'h22;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
