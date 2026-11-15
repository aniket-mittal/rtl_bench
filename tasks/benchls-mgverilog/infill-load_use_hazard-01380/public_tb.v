// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01380 dut (
    .EX_MemRead(in_vec[15:15]),
    .rs(in_vec[14:10]),
    .rt(in_vec[9:5]),
    .EX_rt(in_vec[4:0]),
    .Stall(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hb5b4;
    stim[1] = 16'h7331;
    stim[2] = 16'h864b;
    stim[3] = 16'hd5f1;
    stim[4] = 16'h65d7;
    stim[5] = 16'hae61;
    stim[6] = 16'heb28;
    stim[7] = 16'hd2f8;
    stim[8] = 16'h77bb;
    stim[9] = 16'h31ee;
    stim[10] = 16'hd4da;
    stim[11] = 16'ha546;
    stim[12] = 16'h12ec;
    stim[13] = 16'h019f;
    stim[14] = 16'hd4ed;
    stim[15] = 16'h8b31;
    stim[16] = 16'h93d2;
    stim[17] = 16'hd915;
    stim[18] = 16'hfaed;
    stim[19] = 16'hfadd;
    stim[20] = 16'h157e;
    stim[21] = 16'h8db4;
    stim[22] = 16'h7128;
    stim[23] = 16'h5747;
    stim[24] = 16'h138b;
    stim[25] = 16'hcd96;
    stim[26] = 16'hf726;
    stim[27] = 16'h9114;
    stim[28] = 16'ha4ef;
    stim[29] = 16'h3e38;
    stim[30] = 16'h974a;
    stim[31] = 16'hdeab;
    stim[32] = 16'h4f10;
    stim[33] = 16'hcdd5;
    stim[34] = 16'hfff4;
    stim[35] = 16'h6667;
    stim[36] = 16'h5369;
    stim[37] = 16'hbcf3;
    stim[38] = 16'h79ba;
    stim[39] = 16'h7b95;
    stim[40] = 16'h4dfe;
    stim[41] = 16'he141;
    stim[42] = 16'h11ee;
    stim[43] = 16'h83c7;
    stim[44] = 16'h76f7;
    stim[45] = 16'h4425;
    stim[46] = 16'h7b11;
    stim[47] = 16'h39d3;
    stim[48] = 16'h55ef;
    stim[49] = 16'h18b4;
    stim[50] = 16'h405b;
    stim[51] = 16'hc275;
    stim[52] = 16'hc488;
    stim[53] = 16'h4e24;
    stim[54] = 16'hbb22;
    stim[55] = 16'h7d78;
    stim[56] = 16'h692d;
    stim[57] = 16'hc9df;
    stim[58] = 16'h7562;
    stim[59] = 16'h5440;
    stim[60] = 16'hf39e;
    stim[61] = 16'h33c4;
    stim[62] = 16'h003c;
    stim[63] = 16'h2c46;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
