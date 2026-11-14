// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
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
    .d(in_vec[8:1]),
    .reset(in_vec[0:0]),
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
    stim[0] = 9'h03b;
    stim[1] = 9'h0f9;
    stim[2] = 9'h068;
    stim[3] = 9'h1b6;
    stim[4] = 9'h190;
    stim[5] = 9'h17e;
    stim[6] = 9'h082;
    stim[7] = 9'h130;
    stim[8] = 9'h060;
    stim[9] = 9'h186;
    stim[10] = 9'h0c8;
    stim[11] = 9'h0ea;
    stim[12] = 9'h048;
    stim[13] = 9'h1a6;
    stim[14] = 9'h10a;
    stim[15] = 9'h100;
    stim[16] = 9'h092;
    stim[17] = 9'h07e;
    stim[18] = 9'h196;
    stim[19] = 9'h138;
    stim[20] = 9'h146;
    stim[21] = 9'h0e0;
    stim[22] = 9'h01e;
    stim[23] = 9'h000;
    stim[24] = 9'h1b8;
    stim[25] = 9'h122;
    stim[26] = 9'h0d2;
    stim[27] = 9'h024;
    stim[28] = 9'h08e;
    stim[29] = 9'h09a;
    stim[30] = 9'h102;
    stim[31] = 9'h132;
    stim[32] = 9'h11c;
    stim[33] = 9'h112;
    stim[34] = 9'h12c;
    stim[35] = 9'h112;
    stim[36] = 9'h11a;
    stim[37] = 9'h182;
    stim[38] = 9'h02b;
    stim[39] = 9'h1ac;
    stim[40] = 9'h16a;
    stim[41] = 9'h030;
    stim[42] = 9'h0ea;
    stim[43] = 9'h0d8;
    stim[44] = 9'h00a;
    stim[45] = 9'h1bc;
    stim[46] = 9'h18a;
    stim[47] = 9'h174;
    stim[48] = 9'h0ca;
    stim[49] = 9'h098;
    stim[50] = 9'h0d8;
    stim[51] = 9'h198;
    stim[52] = 9'h0a2;
    stim[53] = 9'h03a;
    stim[54] = 9'h0e4;
    stim[55] = 9'h112;
    stim[56] = 9'h110;
    stim[57] = 9'h174;
    stim[58] = 9'h02e;
    stim[59] = 9'h01f;
    stim[60] = 9'h170;
    stim[61] = 9'h05a;
    stim[62] = 9'h056;
    stim[63] = 9'h1e4;
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
      expv[1] = 8'h43;
      expv[2] = 8'h43;
      expv[3] = 8'h34;
      expv[4] = 8'hdb;
      expv[5] = 8'hc8;
      expv[6] = 8'hbf;
      expv[7] = 8'h41;
      expv[8] = 8'h98;
      expv[9] = 8'h30;
      expv[10] = 8'hc3;
      expv[11] = 8'h64;
      expv[12] = 8'h75;
      expv[13] = 8'h24;
      expv[14] = 8'hd3;
      expv[15] = 8'h85;
      expv[16] = 8'h80;
      expv[17] = 8'h49;
      expv[18] = 8'h3f;
      expv[19] = 8'hcb;
      expv[20] = 8'h9c;
      expv[21] = 8'ha3;
      expv[22] = 8'h70;
      expv[23] = 8'h0f;
      expv[24] = 8'h00;
      expv[25] = 8'hdc;
      expv[26] = 8'h91;
      expv[27] = 8'h69;
      expv[28] = 8'h12;
      expv[29] = 8'h47;
      expv[30] = 8'h4d;
      expv[31] = 8'h81;
      expv[32] = 8'h99;
      expv[33] = 8'h8e;
      expv[34] = 8'h89;
      expv[35] = 8'h96;
      expv[36] = 8'h89;
      expv[37] = 8'h8d;
      expv[38] = 8'hc1;
      expv[39] = 8'h43;
      expv[40] = 8'hd6;
      expv[41] = 8'hb5;
      expv[42] = 8'h18;
      expv[43] = 8'h75;
      expv[44] = 8'h6c;
      expv[45] = 8'h05;
      expv[46] = 8'hde;
      expv[47] = 8'hc5;
      expv[48] = 8'hba;
      expv[49] = 8'h65;
      expv[50] = 8'h4c;
      expv[51] = 8'h6c;
      expv[52] = 8'hcc;
      expv[53] = 8'h51;
      expv[54] = 8'h1d;
      expv[55] = 8'h72;
      expv[56] = 8'h89;
      expv[57] = 8'h88;
      expv[58] = 8'hba;
      expv[59] = 8'h17;
      expv[60] = 8'h43;
      expv[61] = 8'hb8;
      expv[62] = 8'h2d;
      expv[63] = 8'h2b;
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
