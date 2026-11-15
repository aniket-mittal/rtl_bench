// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034215 dut (
    .x0(in_vec[5:5]),
    .x1(in_vec[4:4]),
    .x2(in_vec[3:3]),
    .x3(in_vec[2:2]),
    .x4(in_vec[1:1]),
    .x5(in_vec[0:0]),
    .z0(out_vec[7:7]),
    .z1(out_vec[6:6]),
    .z2(out_vec[5:5]),
    .z3(out_vec[4:4]),
    .z4(out_vec[3:3]),
    .z5(out_vec[2:2]),
    .z6(out_vec[1:1]),
    .z7(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h26;
    stim[1] = 6'h3c;
    stim[2] = 6'h36;
    stim[3] = 6'h2a;
    stim[4] = 6'h11;
    stim[5] = 6'h06;
    stim[6] = 6'h08;
    stim[7] = 6'h21;
    stim[8] = 6'h07;
    stim[9] = 6'h11;
    stim[10] = 6'h2b;
    stim[11] = 6'h2f;
    stim[12] = 6'h26;
    stim[13] = 6'h2f;
    stim[14] = 6'h0b;
    stim[15] = 6'h09;
    stim[16] = 6'h35;
    stim[17] = 6'h11;
    stim[18] = 6'h25;
    stim[19] = 6'h02;
    stim[20] = 6'h39;
    stim[21] = 6'h1d;
    stim[22] = 6'h27;
    stim[23] = 6'h0b;
    stim[24] = 6'h0a;
    stim[25] = 6'h3d;
    stim[26] = 6'h3a;
    stim[27] = 6'h25;
    stim[28] = 6'h3c;
    stim[29] = 6'h35;
    stim[30] = 6'h37;
    stim[31] = 6'h1d;
    stim[32] = 6'h03;
    stim[33] = 6'h2e;
    stim[34] = 6'h31;
    stim[35] = 6'h0b;
    stim[36] = 6'h22;
    stim[37] = 6'h0f;
    stim[38] = 6'h24;
    stim[39] = 6'h34;
    stim[40] = 6'h2a;
    stim[41] = 6'h30;
    stim[42] = 6'h22;
    stim[43] = 6'h3e;
    stim[44] = 6'h15;
    stim[45] = 6'h05;
    stim[46] = 6'h07;
    stim[47] = 6'h0f;
    stim[48] = 6'h2c;
    stim[49] = 6'h23;
    stim[50] = 6'h01;
    stim[51] = 6'h03;
    stim[52] = 6'h2b;
    stim[53] = 6'h28;
    stim[54] = 6'h23;
    stim[55] = 6'h1e;
    stim[56] = 6'h18;
    stim[57] = 6'h0b;
    stim[58] = 6'h23;
    stim[59] = 6'h2d;
    stim[60] = 6'h2e;
    stim[61] = 6'h04;
    stim[62] = 6'h2d;
    stim[63] = 6'h2d;
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
      expv[0] = 8'had;
      expv[1] = 8'h4e;
      expv[2] = 8'h57;
      expv[3] = 8'h5c;
      expv[4] = 8'h7c;
      expv[5] = 8'ha6;
      expv[6] = 8'h45;
      expv[7] = 8'h7d;
      expv[8] = 8'h66;
      expv[9] = 8'h7c;
      expv[10] = 8'h9c;
      expv[11] = 8'h66;
      expv[12] = 8'had;
      expv[13] = 8'h66;
      expv[14] = 8'h67;
      expv[15] = 8'h8d;
      expv[16] = 8'h7d;
      expv[17] = 8'h7c;
      expv[18] = 8'h87;
      expv[19] = 8'h5c;
      expv[20] = 8'h7c;
      expv[21] = 8'h8d;
      expv[22] = 8'h6d;
      expv[23] = 8'h67;
      expv[24] = 8'ha7;
      expv[25] = 8'h86;
      expv[26] = 8'h56;
      expv[27] = 8'h87;
      expv[28] = 8'h4e;
      expv[29] = 8'h7d;
      expv[30] = 8'h97;
      expv[31] = 8'h8d;
      expv[32] = 8'h9c;
      expv[33] = 8'ha6;
      expv[34] = 8'h87;
      expv[35] = 8'h67;
      expv[36] = 8'h57;
      expv[37] = 8'h9d;
      expv[38] = 8'h4f;
      expv[39] = 8'hb5;
      expv[40] = 8'h5c;
      expv[41] = 8'h4f;
      expv[42] = 8'h57;
      expv[43] = 8'hac;
      expv[44] = 8'h86;
      expv[45] = 8'h8c;
      expv[46] = 8'h66;
      expv[47] = 8'h9d;
      expv[48] = 8'h44;
      expv[49] = 8'h97;
      expv[50] = 8'h76;
      expv[51] = 8'h9c;
      expv[52] = 8'h9c;
      expv[53] = 8'hbe;
      expv[54] = 8'h97;
      expv[55] = 8'ha7;
      expv[56] = 8'hbf;
      expv[57] = 8'h67;
      expv[58] = 8'h97;
      expv[59] = 8'h8c;
      expv[60] = 8'ha6;
      expv[61] = 8'h44;
      expv[62] = 8'h8c;
      expv[63] = 8'h8c;
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
