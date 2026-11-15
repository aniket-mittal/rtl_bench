// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005106 dut (
    .clk(clk),
    .reset_n(in_vec[11:11]),
    .enable(in_vec[10:10]),
    .pause(in_vec[9:9]),
    .load(in_vec[8:8]),
    .ldata(in_vec[7:0]),
    .data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h37c;
    stim[1] = 12'h03a;
    stim[2] = 12'haba;
    stim[3] = 12'h806;
    stim[4] = 12'hd7d;
    stim[5] = 12'ha95;
    stim[6] = 12'hff5;
    stim[7] = 12'hd54;
    stim[8] = 12'hbea;
    stim[9] = 12'h9bb;
    stim[10] = 12'ha16;
    stim[11] = 12'h924;
    stim[12] = 12'h8f4;
    stim[13] = 12'hb8f;
    stim[14] = 12'hdc9;
    stim[15] = 12'hf4c;
    stim[16] = 12'h930;
    stim[17] = 12'h9f1;
    stim[18] = 12'hcfa;
    stim[19] = 12'he7f;
    stim[20] = 12'hc69;
    stim[21] = 12'hdd7;
    stim[22] = 12'hca8;
    stim[23] = 12'hfd7;
    stim[24] = 12'hb8f;
    stim[25] = 12'he45;
    stim[26] = 12'hf19;
    stim[27] = 12'heaa;
    stim[28] = 12'hfb3;
    stim[29] = 12'hc1f;
    stim[30] = 12'h8bf;
    stim[31] = 12'hdbf;
    stim[32] = 12'hd04;
    stim[33] = 12'hb7f;
    stim[34] = 12'hf90;
    stim[35] = 12'hb84;
    stim[36] = 12'hb67;
    stim[37] = 12'h91b;
    stim[38] = 12'hf0d;
    stim[39] = 12'hfd4;
    stim[40] = 12'he16;
    stim[41] = 12'h9ce;
    stim[42] = 12'hc4e;
    stim[43] = 12'h96d;
    stim[44] = 12'h8bc;
    stim[45] = 12'hfc4;
    stim[46] = 12'hcd0;
    stim[47] = 12'h8b7;
    stim[48] = 12'ha04;
    stim[49] = 12'hdbf;
    stim[50] = 12'hbe5;
    stim[51] = 12'he83;
    stim[52] = 12'ha1a;
    stim[53] = 12'hb84;
    stim[54] = 12'hf4a;
    stim[55] = 12'h8e7;
    stim[56] = 12'hbbb;
    stim[57] = 12'ha1b;
    stim[58] = 12'hb68;
    stim[59] = 12'h823;
    stim[60] = 12'hcd6;
    stim[61] = 12'he9e;
    stim[62] = 12'hf9c;
    stim[63] = 12'hd65;
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
      expv[0] = 8'h20;
      expv[1] = 8'h20;
      expv[2] = 8'h20;
      expv[3] = 8'h20;
      expv[4] = 8'h20;
      expv[5] = 8'h7d;
      expv[6] = 8'h20;
      expv[7] = 8'hf5;
      expv[8] = 8'h54;
      expv[9] = 8'h20;
      expv[10] = 8'h20;
      expv[11] = 8'h20;
      expv[12] = 8'h20;
      expv[13] = 8'h20;
      expv[14] = 8'h20;
      expv[15] = 8'hc9;
      expv[16] = 8'h4c;
      expv[17] = 8'h20;
      expv[18] = 8'h20;
      expv[19] = 8'h40;
      expv[20] = 8'h40;
      expv[21] = 8'h80;
      expv[22] = 8'hd7;
      expv[23] = 8'hb3;
      expv[24] = 8'hd7;
      expv[25] = 8'h20;
      expv[26] = 8'h20;
      expv[27] = 8'h19;
      expv[28] = 8'h19;
      expv[29] = 8'hb3;
      expv[30] = 8'h7b;
      expv[31] = 8'h20;
      expv[32] = 8'hbf;
      expv[33] = 8'h04;
      expv[34] = 8'h20;
      expv[35] = 8'h90;
      expv[36] = 8'h20;
      expv[37] = 8'h20;
      expv[38] = 8'h20;
      expv[39] = 8'h0d;
      expv[40] = 8'hd4;
      expv[41] = 8'hd4;
      expv[42] = 8'h20;
      expv[43] = 8'h40;
      expv[44] = 8'h20;
      expv[45] = 8'h20;
      expv[46] = 8'hc4;
      expv[47] = 8'h95;
      expv[48] = 8'h20;
      expv[49] = 8'h20;
      expv[50] = 8'hbf;
      expv[51] = 8'h20;
      expv[52] = 8'h20;
      expv[53] = 8'h20;
      expv[54] = 8'h20;
      expv[55] = 8'h4a;
      expv[56] = 8'h20;
      expv[57] = 8'h20;
      expv[58] = 8'h20;
      expv[59] = 8'h20;
      expv[60] = 8'h20;
      expv[61] = 8'h40;
      expv[62] = 8'h40;
      expv[63] = 8'h9c;
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
