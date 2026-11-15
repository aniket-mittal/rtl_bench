// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_170644 dut (
    .INX(in_vec[3:0]),
    .DISPLAY_NUM(out_vec[26:11]),
    .TO(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hb;
    stim[1] = 4'he;
    stim[2] = 4'h6;
    stim[3] = 4'ha;
    stim[4] = 4'hb;
    stim[5] = 4'h7;
    stim[6] = 4'h2;
    stim[7] = 4'hd;
    stim[8] = 4'h4;
    stim[9] = 4'h1;
    stim[10] = 4'h7;
    stim[11] = 4'he;
    stim[12] = 4'h1;
    stim[13] = 4'h1;
    stim[14] = 4'hc;
    stim[15] = 4'hc;
    stim[16] = 4'h3;
    stim[17] = 4'h0;
    stim[18] = 4'h8;
    stim[19] = 4'hd;
    stim[20] = 4'h3;
    stim[21] = 4'h0;
    stim[22] = 4'ha;
    stim[23] = 4'h2;
    stim[24] = 4'h8;
    stim[25] = 4'h5;
    stim[26] = 4'he;
    stim[27] = 4'h6;
    stim[28] = 4'h0;
    stim[29] = 4'h5;
    stim[30] = 4'hd;
    stim[31] = 4'h2;
    stim[32] = 4'hb;
    stim[33] = 4'h1;
    stim[34] = 4'hc;
    stim[35] = 4'h8;
    stim[36] = 4'h5;
    stim[37] = 4'hc;
    stim[38] = 4'h6;
    stim[39] = 4'h1;
    stim[40] = 4'hb;
    stim[41] = 4'hd;
    stim[42] = 4'h8;
    stim[43] = 4'hc;
    stim[44] = 4'h3;
    stim[45] = 4'hc;
    stim[46] = 4'he;
    stim[47] = 4'h5;
    stim[48] = 4'hb;
    stim[49] = 4'hb;
    stim[50] = 4'h6;
    stim[51] = 4'h3;
    stim[52] = 4'h1;
    stim[53] = 4'h4;
    stim[54] = 4'h0;
    stim[55] = 4'h0;
    stim[56] = 4'h7;
    stim[57] = 4'h8;
    stim[58] = 4'hc;
    stim[59] = 4'hb;
    stim[60] = 4'h5;
    stim[61] = 4'hd;
    stim[62] = 4'h9;
    stim[63] = 4'hd;
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
      expv[0] = 27'h0805b53;
      expv[1] = 27'h0807416;
      expv[2] = 27'h000320e;
      expv[3] = 27'h0805312;
      expv[4] = 27'h0805b53;
      expv[5] = 27'h0003a4f;
      expv[6] = 27'h000110a;
      expv[7] = 27'h0806bd5;
      expv[8] = 27'h000218c;
      expv[9] = 27'h0000889;
      expv[10] = 27'h0003a4f;
      expv[11] = 27'h0807416;
      expv[12] = 27'h0000889;
      expv[13] = 27'h0000889;
      expv[14] = 27'h0806394;
      expv[15] = 27'h0806394;
      expv[16] = 27'h000194b;
      expv[17] = 27'h00007ff;
      expv[18] = 27'h0004290;
      expv[19] = 27'h0806bd5;
      expv[20] = 27'h000194b;
      expv[21] = 27'h00007ff;
      expv[22] = 27'h0805312;
      expv[23] = 27'h000110a;
      expv[24] = 27'h0004290;
      expv[25] = 27'h00029cd;
      expv[26] = 27'h0807416;
      expv[27] = 27'h000320e;
      expv[28] = 27'h00007ff;
      expv[29] = 27'h00029cd;
      expv[30] = 27'h0806bd5;
      expv[31] = 27'h000110a;
      expv[32] = 27'h0805b53;
      expv[33] = 27'h0000889;
      expv[34] = 27'h0806394;
      expv[35] = 27'h0004290;
      expv[36] = 27'h00029cd;
      expv[37] = 27'h0806394;
      expv[38] = 27'h000320e;
      expv[39] = 27'h0000889;
      expv[40] = 27'h0805b53;
      expv[41] = 27'h0806bd5;
      expv[42] = 27'h0004290;
      expv[43] = 27'h0806394;
      expv[44] = 27'h000194b;
      expv[45] = 27'h0806394;
      expv[46] = 27'h0807416;
      expv[47] = 27'h00029cd;
      expv[48] = 27'h0805b53;
      expv[49] = 27'h0805b53;
      expv[50] = 27'h000320e;
      expv[51] = 27'h000194b;
      expv[52] = 27'h0000889;
      expv[53] = 27'h000218c;
      expv[54] = 27'h00007ff;
      expv[55] = 27'h00007ff;
      expv[56] = 27'h0003a4f;
      expv[57] = 27'h0004290;
      expv[58] = 27'h0806394;
      expv[59] = 27'h0805b53;
      expv[60] = 27'h00029cd;
      expv[61] = 27'h0806bd5;
      expv[62] = 27'h0004ad1;
      expv[63] = 27'h0806bd5;
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
