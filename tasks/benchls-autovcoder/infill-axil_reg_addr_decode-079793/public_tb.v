// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079793 dut (
    .axaddr(in_vec[31:0]),
    .reg_decode_num(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h67512473;
    stim[1] = 32'hf2e5dd12;
    stim[2] = 32'h6d847613;
    stim[3] = 32'h1a3146b8;
    stim[4] = 32'h7404cd03;
    stim[5] = 32'h00db4d3f;
    stim[6] = 32'hc3766d91;
    stim[7] = 32'h47a6a46b;
    stim[8] = 32'hea671536;
    stim[9] = 32'h6b8311b7;
    stim[10] = 32'h03ec689d;
    stim[11] = 32'h8dc98c74;
    stim[12] = 32'h1501436e;
    stim[13] = 32'h430da6e4;
    stim[14] = 32'h07281262;
    stim[15] = 32'h6905219e;
    stim[16] = 32'h91fe7b4f;
    stim[17] = 32'h67aeb359;
    stim[18] = 32'hc5515ef8;
    stim[19] = 32'ha4df6fe4;
    stim[20] = 32'h18b44d90;
    stim[21] = 32'h8c9ec09a;
    stim[22] = 32'h77e3b703;
    stim[23] = 32'h24f948c3;
    stim[24] = 32'h123a7711;
    stim[25] = 32'hc0b0835b;
    stim[26] = 32'hd80a871c;
    stim[27] = 32'hc2390ffd;
    stim[28] = 32'haf077c2e;
    stim[29] = 32'h1999eddf;
    stim[30] = 32'hc22d5c1b;
    stim[31] = 32'h0896ae46;
    stim[32] = 32'h4589d51e;
    stim[33] = 32'h7b47a951;
    stim[34] = 32'he4315d1c;
    stim[35] = 32'h54eb49d7;
    stim[36] = 32'h5e55c801;
    stim[37] = 32'h3d2e31bf;
    stim[38] = 32'h0efca7a2;
    stim[39] = 32'h264722ff;
    stim[40] = 32'h97ec7e65;
    stim[41] = 32'h05eba6eb;
    stim[42] = 32'h60bd2353;
    stim[43] = 32'h179e6467;
    stim[44] = 32'h65857d2f;
    stim[45] = 32'h492ed419;
    stim[46] = 32'hd76d08cf;
    stim[47] = 32'hab778453;
    stim[48] = 32'h09ba07ce;
    stim[49] = 32'h7cc20bd3;
    stim[50] = 32'h795bd338;
    stim[51] = 32'h85c3ea72;
    stim[52] = 32'h0ca23356;
    stim[53] = 32'h9ce82634;
    stim[54] = 32'h8beb3b16;
    stim[55] = 32'hdcec7afb;
    stim[56] = 32'h87e9e7a6;
    stim[57] = 32'h160cc0e5;
    stim[58] = 32'hba6d8c60;
    stim[59] = 32'h22888ca2;
    stim[60] = 32'hd0e2fac6;
    stim[61] = 32'hc3a1b372;
    stim[62] = 32'h3f6555b0;
    stim[63] = 32'hcbd474f3;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h0;
      expv[8] = 3'h2;
      expv[9] = 3'h2;
      expv[10] = 3'h0;
      expv[11] = 3'h2;
      expv[12] = 3'h0;
      expv[13] = 3'h2;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h2;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h0;
      expv[31] = 3'h2;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h2;
      expv[36] = 3'h0;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h0;
      expv[40] = 3'h2;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h2;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h2;
      expv[53] = 3'h2;
      expv[54] = 3'h2;
      expv[55] = 3'h0;
      expv[56] = 3'h2;
      expv[57] = 3'h2;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h2;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
