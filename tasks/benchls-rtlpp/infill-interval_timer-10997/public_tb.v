// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10997 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h302e1b;
    stim[1] = 22'h18f5db;
    stim[2] = 22'h3bc7fd;
    stim[3] = 22'h3aa2b5;
    stim[4] = 22'h2e1381;
    stim[5] = 22'h3a7a5d;
    stim[6] = 22'h0221ec;
    stim[7] = 22'h33ebdd;
    stim[8] = 22'h330914;
    stim[9] = 22'h1ea9e0;
    stim[10] = 22'h0b2492;
    stim[11] = 22'h1b7056;
    stim[12] = 22'h1fe825;
    stim[13] = 22'h3a9f45;
    stim[14] = 22'h07519a;
    stim[15] = 22'h06b796;
    stim[16] = 22'h0769bb;
    stim[17] = 22'h260214;
    stim[18] = 22'h2eae9b;
    stim[19] = 22'h129ce6;
    stim[20] = 22'h2bc418;
    stim[21] = 22'h17759d;
    stim[22] = 22'h12d5ee;
    stim[23] = 22'h0ea3cb;
    stim[24] = 22'h0a6e5f;
    stim[25] = 22'h12af72;
    stim[26] = 22'h0b670e;
    stim[27] = 22'h26df10;
    stim[28] = 22'h1a2bbb;
    stim[29] = 22'h22b177;
    stim[30] = 22'h1e4b45;
    stim[31] = 22'h2762e2;
    stim[32] = 22'h27df90;
    stim[33] = 22'h131890;
    stim[34] = 22'h26e275;
    stim[35] = 22'h324e6b;
    stim[36] = 22'h176faf;
    stim[37] = 22'h3aeab2;
    stim[38] = 22'h0214c5;
    stim[39] = 22'h2b2406;
    stim[40] = 22'h12e955;
    stim[41] = 22'h3f40f2;
    stim[42] = 22'h277b4c;
    stim[43] = 22'h22854a;
    stim[44] = 22'h0e1faa;
    stim[45] = 22'h060396;
    stim[46] = 22'h17a3cd;
    stim[47] = 22'h27e7dd;
    stim[48] = 22'h2e4d4d;
    stim[49] = 22'h2ad3b2;
    stim[50] = 22'h0281e1;
    stim[51] = 22'h16b293;
    stim[52] = 22'h0242bf;
    stim[53] = 22'h0e51a8;
    stim[54] = 22'h3ff098;
    stim[55] = 22'h1d05b5;
    stim[56] = 22'h22bdfc;
    stim[57] = 22'h02548f;
    stim[58] = 22'h2a815b;
    stim[59] = 22'h1b46cb;
    stim[60] = 22'h371006;
    stim[61] = 22'h3b61bb;
    stim[62] = 22'h321687;
    stim[63] = 22'h2fa5d3;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h0a9e0;
      expv[13] = 17'h0a9e0;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h0c34f;
      expv[19] = 17'h0a9e0;
      expv[20] = 17'h0c34f;
      expv[21] = 17'h0a9e0;
      expv[22] = 17'h0c34f;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h00000;
      expv[25] = 17'h0000b;
      expv[26] = 17'h0c34f;
      expv[27] = 17'h0000b;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h0a9e0;
      expv[30] = 17'h0c34f;
      expv[31] = 17'h0a9e0;
      expv[32] = 17'h0c34f;
      expv[33] = 17'h0c34f;
      expv[34] = 17'h0c34f;
      expv[35] = 17'h0c34f;
      expv[36] = 17'h00000;
      expv[37] = 17'h0c34f;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h04b45;
      expv[41] = 17'h0c34f;
      expv[42] = 17'h00000;
      expv[43] = 17'h0c34f;
      expv[44] = 17'h0c34f;
      expv[45] = 17'h0000b;
      expv[46] = 17'h00000;
      expv[47] = 17'h0c34f;
      expv[48] = 17'h0c34f;
      expv[49] = 17'h04b45;
      expv[50] = 17'h04b45;
      expv[51] = 17'h00000;
      expv[52] = 17'h0c34f;
      expv[53] = 17'h00000;
      expv[54] = 17'h0000a;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
