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
    stim[0] = 9'h0f7;
    stim[1] = 9'h1e3;
    stim[2] = 9'h1cc;
    stim[3] = 9'h0e4;
    stim[4] = 9'h044;
    stim[5] = 9'h1e2;
    stim[6] = 9'h0b6;
    stim[7] = 9'h012;
    stim[8] = 9'h1cc;
    stim[9] = 9'h1e8;
    stim[10] = 9'h1de;
    stim[11] = 9'h0dc;
    stim[12] = 9'h1a6;
    stim[13] = 9'h1a6;
    stim[14] = 9'h06c;
    stim[15] = 9'h0f8;
    stim[16] = 9'h0d0;
    stim[17] = 9'h092;
    stim[18] = 9'h1ba;
    stim[19] = 9'h026;
    stim[20] = 9'h1ca;
    stim[21] = 9'h190;
    stim[22] = 9'h09e;
    stim[23] = 9'h112;
    stim[24] = 9'h19e;
    stim[25] = 9'h120;
    stim[26] = 9'h1c5;
    stim[27] = 9'h150;
    stim[28] = 9'h16c;
    stim[29] = 9'h0ee;
    stim[30] = 9'h05c;
    stim[31] = 9'h0ec;
    stim[32] = 9'h0ea;
    stim[33] = 9'h17e;
    stim[34] = 9'h088;
    stim[35] = 9'h192;
    stim[36] = 9'h1fa;
    stim[37] = 9'h124;
    stim[38] = 9'h1b0;
    stim[39] = 9'h0ec;
    stim[40] = 9'h044;
    stim[41] = 9'h1fe;
    stim[42] = 9'h194;
    stim[43] = 9'h08c;
    stim[44] = 9'h0b0;
    stim[45] = 9'h0c2;
    stim[46] = 9'h19a;
    stim[47] = 9'h042;
    stim[48] = 9'h040;
    stim[49] = 9'h148;
    stim[50] = 9'h064;
    stim[51] = 9'h032;
    stim[52] = 9'h082;
    stim[53] = 9'h112;
    stim[54] = 9'h0b0;
    stim[55] = 9'h0ee;
    stim[56] = 9'h15c;
    stim[57] = 9'h13e;
    stim[58] = 9'h122;
    stim[59] = 9'h1d8;
    stim[60] = 9'h100;
    stim[61] = 9'h1ee;
    stim[62] = 9'h146;
    stim[63] = 9'h0e6;
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
      expv[3] = 8'he6;
      expv[4] = 8'h72;
      expv[5] = 8'h22;
      expv[6] = 8'hf1;
      expv[7] = 8'h5b;
      expv[8] = 8'h09;
      expv[9] = 8'he6;
      expv[10] = 8'hf4;
      expv[11] = 8'hef;
      expv[12] = 8'h6e;
      expv[13] = 8'hd3;
      expv[14] = 8'hd3;
      expv[15] = 8'h36;
      expv[16] = 8'h7c;
      expv[17] = 8'h68;
      expv[18] = 8'h49;
      expv[19] = 8'hdd;
      expv[20] = 8'h13;
      expv[21] = 8'he5;
      expv[22] = 8'hc8;
      expv[23] = 8'h4f;
      expv[24] = 8'h89;
      expv[25] = 8'hcf;
      expv[26] = 8'h90;
      expv[27] = 8'h43;
      expv[28] = 8'ha8;
      expv[29] = 8'hb6;
      expv[30] = 8'h77;
      expv[31] = 8'h2e;
      expv[32] = 8'h76;
      expv[33] = 8'h75;
      expv[34] = 8'hbf;
      expv[35] = 8'h44;
      expv[36] = 8'hc9;
      expv[37] = 8'hfd;
      expv[38] = 8'h92;
      expv[39] = 8'hd8;
      expv[40] = 8'h76;
      expv[41] = 8'h22;
      expv[42] = 8'hff;
      expv[43] = 8'hca;
      expv[44] = 8'h46;
      expv[45] = 8'h58;
      expv[46] = 8'h61;
      expv[47] = 8'hcd;
      expv[48] = 8'h21;
      expv[49] = 8'h20;
      expv[50] = 8'ha4;
      expv[51] = 8'h32;
      expv[52] = 8'h19;
      expv[53] = 8'h41;
      expv[54] = 8'h89;
      expv[55] = 8'h58;
      expv[56] = 8'h77;
      expv[57] = 8'hae;
      expv[58] = 8'h9f;
      expv[59] = 8'h91;
      expv[60] = 8'hec;
      expv[61] = 8'h80;
      expv[62] = 8'hf7;
      expv[63] = 8'ha3;
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
