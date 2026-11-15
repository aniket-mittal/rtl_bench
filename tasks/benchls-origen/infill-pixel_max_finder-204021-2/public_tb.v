// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204021 dut (
    .clk(clk),
    .enable(in_vec[18:18]),
    .memstartp(in_vec[17:8]),
    .qp(in_vec[7:0]),
    .STOP(out_vec[15:15]),
    .read_addressp(out_vec[14:5]),
    .re(out_vec[4:4]),
    .RESULT(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h65848;
    stim[1] = 19'h61421;
    stim[2] = 19'h556b1;
    stim[3] = 19'h2fe82;
    stim[4] = 19'h1aee8;
    stim[5] = 19'h40a08;
    stim[6] = 19'h6ff71;
    stim[7] = 19'h2c320;
    stim[8] = 19'h0bcec;
    stim[9] = 19'h04da1;
    stim[10] = 19'h16de4;
    stim[11] = 19'h6f385;
    stim[12] = 19'h7af1a;
    stim[13] = 19'h5c56d;
    stim[14] = 19'h45737;
    stim[15] = 19'h4312d;
    stim[16] = 19'h32565;
    stim[17] = 19'h27a12;
    stim[18] = 19'h5ba6e;
    stim[19] = 19'h3b2b4;
    stim[20] = 19'h36b6a;
    stim[21] = 19'h352a6;
    stim[22] = 19'h4d291;
    stim[23] = 19'h6e8eb;
    stim[24] = 19'h7b938;
    stim[25] = 19'h1cba8;
    stim[26] = 19'h38399;
    stim[27] = 19'h7b487;
    stim[28] = 19'h4f1ca;
    stim[29] = 19'h61adc;
    stim[30] = 19'h1cf5d;
    stim[31] = 19'h2a38c;
    stim[32] = 19'h42af0;
    stim[33] = 19'h0babe;
    stim[34] = 19'h2953d;
    stim[35] = 19'h4db27;
    stim[36] = 19'h03919;
    stim[37] = 19'h72922;
    stim[38] = 19'h76f6d;
    stim[39] = 19'h13798;
    stim[40] = 19'h579f5;
    stim[41] = 19'h6d532;
    stim[42] = 19'h1c3b1;
    stim[43] = 19'h3ed9b;
    stim[44] = 19'h22ebd;
    stim[45] = 19'h10437;
    stim[46] = 19'h389a0;
    stim[47] = 19'h7840b;
    stim[48] = 19'h5f73c;
    stim[49] = 19'h34e75;
    stim[50] = 19'h0e9e4;
    stim[51] = 19'h0d4ee;
    stim[52] = 19'h41573;
    stim[53] = 19'h5ad60;
    stim[54] = 19'h387fb;
    stim[55] = 19'h490c3;
    stim[56] = 19'h23948;
    stim[57] = 19'h08c88;
    stim[58] = 19'h0c523;
    stim[59] = 19'h14017;
    stim[60] = 19'h790ac;
    stim[61] = 19'h2627e;
    stim[62] = 19'h37841;
    stim[63] = 19'h1464b;
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
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'h017x;
      expv[7] = 16'h603x;
      expv[8] = 16'h602x;
      expv[9] = 16'h602x;
      expv[10] = 16'h602x;
      expv[11] = 16'h602x;
      expv[12] = 16'h5e9x;
      expv[13] = 16'h763x;
      expv[14] = 16'h3911;
      expv[15] = 16'h0b70;
      expv[16] = 16'h06d0;
      expv[17] = 16'h06c0;
      expv[18] = 16'h06c0;
      expv[19] = 16'h3770;
      expv[20] = 16'h3760;
      expv[21] = 16'h3760;
      expv[22] = 16'h3760;
      expv[23] = 16'h1a70;
      expv[24] = 16'h5d50;
      expv[25] = 16'h7791;
      expv[26] = 16'h7781;
      expv[27] = 16'h7781;
      expv[28] = 16'h76b1;
      expv[29] = 16'h1e71;
      expv[30] = 16'h43b1;
      expv[31] = 16'h43a1;
      expv[32] = 16'h43a1;
      expv[33] = 16'h0571;
      expv[34] = 16'h0561;
      expv[35] = 16'h0561;
      expv[36] = 16'h1b91;
      expv[37] = 16'h1b81;
      expv[38] = 16'h6551;
      expv[39] = 16'h6e31;
      expv[40] = 16'h6e21;
      expv[41] = 16'h2f51;
      expv[42] = 16'h5af1;
      expv[43] = 16'h5ae1;
      expv[44] = 16'h5ae1;
      expv[45] = 16'h5ae1;
      expv[46] = 16'h5ae1;
      expv[47] = 16'h5ae1;
      expv[48] = 16'h70b1;
      expv[49] = 16'h3f31;
      expv[50] = 16'h3f21;
      expv[51] = 16'h3f21;
      expv[52] = 16'h3f21;
      expv[53] = 16'h02d1;
      expv[54] = 16'h35f1;
      expv[55] = 16'h35e1;
      expv[56] = 16'h1231;
      expv[57] = 16'h1221;
      expv[58] = 16'h1221;
      expv[59] = 16'h1221;
      expv[60] = 16'h1221;
      expv[61] = 16'h7231;
      expv[62] = 16'h7221;
      expv[63] = 16'h7221;
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
