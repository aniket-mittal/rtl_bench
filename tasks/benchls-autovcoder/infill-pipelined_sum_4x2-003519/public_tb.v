// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_003519 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .inp00(in_vec[31:28]),
    .inp01(in_vec[27:24]),
    .inp10(in_vec[23:20]),
    .inp11(in_vec[19:16]),
    .inp20(in_vec[15:12]),
    .inp21(in_vec[11:8]),
    .inp30(in_vec[7:4]),
    .inp31(in_vec[3:0]),
    .sum_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1621d3d29;
    stim[1] = 33'h1ccbd986d;
    stim[2] = 33'h096cc4d7e;
    stim[3] = 33'h0e90202b2;
    stim[4] = 33'h0dade35b4;
    stim[5] = 33'h0e14d3346;
    stim[6] = 33'h036c241dc;
    stim[7] = 33'h0ab1c0130;
    stim[8] = 33'h0a315149a;
    stim[9] = 33'h007e0df9e;
    stim[10] = 33'h0f17cf40f;
    stim[11] = 33'h0a36dd5ea;
    stim[12] = 33'h0e60b7ccb;
    stim[13] = 33'h0dc22d364;
    stim[14] = 33'h094e94e43;
    stim[15] = 33'h053eebd31;
    stim[16] = 33'h054e2eb34;
    stim[17] = 33'h04b47552c;
    stim[18] = 33'h085be6738;
    stim[19] = 33'h0c13be6e5;
    stim[20] = 33'h06276611c;
    stim[21] = 33'h06b2058dd;
    stim[22] = 33'h0dcd8f2d1;
    stim[23] = 33'h006509938;
    stim[24] = 33'h035f6dae5;
    stim[25] = 33'h0042e9e81;
    stim[26] = 33'h090133b06;
    stim[27] = 33'h05dd8016b;
    stim[28] = 33'h07fe7d522;
    stim[29] = 33'h0134de54a;
    stim[30] = 33'h0bf3c04c0;
    stim[31] = 33'h0e8984759;
    stim[32] = 33'h09c4e58d0;
    stim[33] = 33'h0b388d74e;
    stim[34] = 33'h0d7919044;
    stim[35] = 33'h016759bed;
    stim[36] = 33'h058650798;
    stim[37] = 33'h0a3870bf5;
    stim[38] = 33'h0c6555d8e;
    stim[39] = 33'h013c31ed3;
    stim[40] = 33'h05db0f1c2;
    stim[41] = 33'h0283144c3;
    stim[42] = 33'h02f03bea6;
    stim[43] = 33'h00ee187a5;
    stim[44] = 33'h0d5ed9393;
    stim[45] = 33'h09d1171fa;
    stim[46] = 33'h05a79c1b1;
    stim[47] = 33'h0612ebb79;
    stim[48] = 33'h0a6dcec7b;
    stim[49] = 33'h0d8d4dfe7;
    stim[50] = 33'h07b4fc283;
    stim[51] = 33'h04c6c42e1;
    stim[52] = 33'h0a059c321;
    stim[53] = 33'h0472eb165;
    stim[54] = 33'h092e5e4e2;
    stim[55] = 33'h0e04b0f80;
    stim[56] = 33'h0ec682153;
    stim[57] = 33'h0101c2e3a;
    stim[58] = 33'h08b25d8ef;
    stim[59] = 33'h0826ea669;
    stim[60] = 33'h0a078edc0;
    stim[61] = 33'h08bb6565f;
    stim[62] = 33'h0e7650278;
    stim[63] = 33'h0576eac51;
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
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h31;
      expv[4] = 8'h54;
      expv[5] = 8'h4d;
      expv[6] = 8'h28;
      expv[7] = 8'h49;
      expv[8] = 8'h30;
      expv[9] = 8'h35;
      expv[10] = 8'h26;
      expv[11] = 8'h2b;
      expv[12] = 8'h48;
      expv[13] = 8'h45;
      expv[14] = 8'h4a;
      expv[15] = 8'h49;
      expv[16] = 8'h37;
      expv[17] = 8'h3d;
      expv[18] = 8'h40;
      expv[19] = 8'h39;
      expv[20] = 8'h32;
      expv[21] = 8'h3e;
      expv[22] = 8'h42;
      expv[23] = 8'h29;
      expv[24] = 8'h3a;
      expv[25] = 8'h4d;
      expv[26] = 8'h28;
      expv[27] = 8'h47;
      expv[28] = 8'h34;
      expv[29] = 8'h21;
      expv[30] = 8'h39;
      expv[31] = 8'h41;
      expv[32] = 8'h36;
      expv[33] = 8'h39;
      expv[34] = 8'h40;
      expv[35] = 8'h41;
      expv[36] = 8'h44;
      expv[37] = 8'h2f;
      expv[38] = 8'h42;
      expv[39] = 8'h30;
      expv[40] = 8'h3b;
      expv[41] = 8'h44;
      expv[42] = 8'h32;
      expv[43] = 8'h3b;
      expv[44] = 8'h25;
      expv[45] = 8'h3d;
      expv[46] = 8'h3b;
      expv[47] = 8'h45;
      expv[48] = 8'h39;
      expv[49] = 8'h38;
      expv[50] = 8'h3d;
      expv[51] = 8'h55;
      expv[52] = 8'h57;
      expv[53] = 8'h3e;
      expv[54] = 8'h37;
      expv[55] = 8'h2a;
      expv[56] = 8'h32;
      expv[57] = 8'h40;
      expv[58] = 8'h34;
      expv[59] = 8'h33;
      expv[60] = 8'h2b;
      expv[61] = 8'h4c;
      expv[62] = 8'h3d;
      expv[63] = 8'h40;
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
