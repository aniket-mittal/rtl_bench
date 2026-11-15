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

  autovcoder_025782 dut (
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
    stim[0] = 12'h49d;
    stim[1] = 12'h25d;
    stim[2] = 12'hac0;
    stim[3] = 12'h84b;
    stim[4] = 12'he12;
    stim[5] = 12'hc83;
    stim[6] = 12'hfce;
    stim[7] = 12'hb29;
    stim[8] = 12'had4;
    stim[9] = 12'ha5f;
    stim[10] = 12'h922;
    stim[11] = 12'ha48;
    stim[12] = 12'h9f8;
    stim[13] = 12'h855;
    stim[14] = 12'haf0;
    stim[15] = 12'h96f;
    stim[16] = 12'hcb7;
    stim[17] = 12'hcae;
    stim[18] = 12'hdf6;
    stim[19] = 12'h886;
    stim[20] = 12'hd1f;
    stim[21] = 12'he22;
    stim[22] = 12'hbd2;
    stim[23] = 12'hc86;
    stim[24] = 12'hff2;
    stim[25] = 12'hc6a;
    stim[26] = 12'hc15;
    stim[27] = 12'hf1c;
    stim[28] = 12'h85d;
    stim[29] = 12'h698;
    stim[30] = 12'hf92;
    stim[31] = 12'h9dc;
    stim[32] = 12'h9bd;
    stim[33] = 12'hf8a;
    stim[34] = 12'hd70;
    stim[35] = 12'hac0;
    stim[36] = 12'hd8b;
    stim[37] = 12'hca3;
    stim[38] = 12'haef;
    stim[39] = 12'hf7b;
    stim[40] = 12'hd8d;
    stim[41] = 12'h950;
    stim[42] = 12'h871;
    stim[43] = 12'h917;
    stim[44] = 12'h9e6;
    stim[45] = 12'hfb6;
    stim[46] = 12'hfe6;
    stim[47] = 12'hab0;
    stim[48] = 12'hce7;
    stim[49] = 12'hc0a;
    stim[50] = 12'ha99;
    stim[51] = 12'hd58;
    stim[52] = 12'h932;
    stim[53] = 12'ha3a;
    stim[54] = 12'hb50;
    stim[55] = 12'he4d;
    stim[56] = 12'hbaa;
    stim[57] = 12'he1f;
    stim[58] = 12'hb23;
    stim[59] = 12'hf32;
    stim[60] = 12'hf87;
    stim[61] = 12'hc8d;
    stim[62] = 12'hdd0;
    stim[63] = 12'hd5f;
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
      expv[5] = 8'h20;
      expv[6] = 8'h40;
      expv[7] = 8'hce;
      expv[8] = 8'h20;
      expv[9] = 8'h20;
      expv[10] = 8'h20;
      expv[11] = 8'h20;
      expv[12] = 8'h20;
      expv[13] = 8'h20;
      expv[14] = 8'h20;
      expv[15] = 8'h20;
      expv[16] = 8'h20;
      expv[17] = 8'h40;
      expv[18] = 8'h80;
      expv[19] = 8'hf6;
      expv[20] = 8'h20;
      expv[21] = 8'h1f;
      expv[22] = 8'h1f;
      expv[23] = 8'h20;
      expv[24] = 8'h40;
      expv[25] = 8'hf2;
      expv[26] = 8'hf9;
      expv[27] = 8'hef;
      expv[28] = 8'h1c;
      expv[29] = 8'h20;
      expv[30] = 8'h20;
      expv[31] = 8'h92;
      expv[32] = 8'h20;
      expv[33] = 8'h20;
      expv[34] = 8'h8a;
      expv[35] = 8'h70;
      expv[36] = 8'h20;
      expv[37] = 8'h8b;
      expv[38] = 8'h0b;
      expv[39] = 8'h20;
      expv[40] = 8'h7b;
      expv[41] = 8'h8d;
      expv[42] = 8'h20;
      expv[43] = 8'h20;
      expv[44] = 8'h20;
      expv[45] = 8'h20;
      expv[46] = 8'hb6;
      expv[47] = 8'he6;
      expv[48] = 8'h20;
      expv[49] = 8'h40;
      expv[50] = 8'h80;
      expv[51] = 8'h20;
      expv[52] = 8'h58;
      expv[53] = 8'h20;
      expv[54] = 8'h20;
      expv[55] = 8'h20;
      expv[56] = 8'h20;
      expv[57] = 8'h20;
      expv[58] = 8'h20;
      expv[59] = 8'h20;
      expv[60] = 8'h32;
      expv[61] = 8'h87;
      expv[62] = 8'h13;
      expv[63] = 8'hd0;
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
