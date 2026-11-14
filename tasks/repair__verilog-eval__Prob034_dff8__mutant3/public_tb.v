// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .d(in_vec[7:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h89;
    stim[1] = 8'h35;
    stim[2] = 8'h98;
    stim[3] = 8'hb2;
    stim[4] = 8'h32;
    stim[5] = 8'h5b;
    stim[6] = 8'h7e;
    stim[7] = 8'hfb;
    stim[8] = 8'h65;
    stim[9] = 8'hbf;
    stim[10] = 8'h56;
    stim[11] = 8'h0b;
    stim[12] = 8'hec;
    stim[13] = 8'hae;
    stim[14] = 8'hc4;
    stim[15] = 8'h22;
    stim[16] = 8'h04;
    stim[17] = 8'h5f;
    stim[18] = 8'hc2;
    stim[19] = 8'h91;
    stim[20] = 8'hac;
    stim[21] = 8'h7d;
    stim[22] = 8'hab;
    stim[23] = 8'h28;
    stim[24] = 8'h52;
    stim[25] = 8'h49;
    stim[26] = 8'h5a;
    stim[27] = 8'hce;
    stim[28] = 8'h56;
    stim[29] = 8'h13;
    stim[30] = 8'h89;
    stim[31] = 8'hd3;
    stim[32] = 8'h16;
    stim[33] = 8'h90;
    stim[34] = 8'hec;
    stim[35] = 8'h64;
    stim[36] = 8'h27;
    stim[37] = 8'hce;
    stim[38] = 8'h31;
    stim[39] = 8'h5a;
    stim[40] = 8'heb;
    stim[41] = 8'h23;
    stim[42] = 8'h2c;
    stim[43] = 8'h92;
    stim[44] = 8'h3a;
    stim[45] = 8'h42;
    stim[46] = 8'h55;
    stim[47] = 8'h28;
    stim[48] = 8'h49;
    stim[49] = 8'hd8;
    stim[50] = 8'h4e;
    stim[51] = 8'hca;
    stim[52] = 8'hc4;
    stim[53] = 8'h8a;
    stim[54] = 8'h9f;
    stim[55] = 8'h39;
    stim[56] = 8'h5f;
    stim[57] = 8'h8b;
    stim[58] = 8'h49;
    stim[59] = 8'h3e;
    stim[60] = 8'h85;
    stim[61] = 8'h1d;
    stim[62] = 8'h3f;
    stim[63] = 8'h89;
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
      expv[1] = 8'h09;
      expv[2] = 8'h35;
      expv[3] = 8'h18;
      expv[4] = 8'h32;
      expv[5] = 8'h32;
      expv[6] = 8'h5b;
      expv[7] = 8'h7e;
      expv[8] = 8'h7b;
      expv[9] = 8'h65;
      expv[10] = 8'h3f;
      expv[11] = 8'h56;
      expv[12] = 8'h0b;
      expv[13] = 8'h6c;
      expv[14] = 8'h2e;
      expv[15] = 8'h44;
      expv[16] = 8'h22;
      expv[17] = 8'h04;
      expv[18] = 8'h5f;
      expv[19] = 8'h42;
      expv[20] = 8'h11;
      expv[21] = 8'h2c;
      expv[22] = 8'h7d;
      expv[23] = 8'h2b;
      expv[24] = 8'h28;
      expv[25] = 8'h52;
      expv[26] = 8'h49;
      expv[27] = 8'h5a;
      expv[28] = 8'h4e;
      expv[29] = 8'h56;
      expv[30] = 8'h13;
      expv[31] = 8'h09;
      expv[32] = 8'h53;
      expv[33] = 8'h16;
      expv[34] = 8'h10;
      expv[35] = 8'h6c;
      expv[36] = 8'h64;
      expv[37] = 8'h27;
      expv[38] = 8'h4e;
      expv[39] = 8'h31;
      expv[40] = 8'h5a;
      expv[41] = 8'h6b;
      expv[42] = 8'h23;
      expv[43] = 8'h2c;
      expv[44] = 8'h12;
      expv[45] = 8'h3a;
      expv[46] = 8'h42;
      expv[47] = 8'h55;
      expv[48] = 8'h28;
      expv[49] = 8'h49;
      expv[50] = 8'h58;
      expv[51] = 8'h4e;
      expv[52] = 8'h4a;
      expv[53] = 8'h44;
      expv[54] = 8'h0a;
      expv[55] = 8'h1f;
      expv[56] = 8'h39;
      expv[57] = 8'h5f;
      expv[58] = 8'h0b;
      expv[59] = 8'h49;
      expv[60] = 8'h3e;
      expv[61] = 8'h05;
      expv[62] = 8'h1d;
      expv[63] = 8'h3f;
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
