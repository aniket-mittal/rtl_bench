// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08417 dut (
    .clk(clk),
    .wr0a(in_vec[19:19]),
    .wr0b(in_vec[18:18]),
    .wr1a(in_vec[17:17]),
    .wr1b(in_vec[16:16]),
    .inData(in_vec[15:0]),
    .out0(out_vec[31:16]),
    .out1(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'he07da;
    stim[1] = 20'hcf04e;
    stim[2] = 20'hd7e4c;
    stim[3] = 20'haa2f5;
    stim[4] = 20'h04b92;
    stim[5] = 20'hc5cb7;
    stim[6] = 20'h41677;
    stim[7] = 20'h86b90;
    stim[8] = 20'hf6ccb;
    stim[9] = 20'hf7f11;
    stim[10] = 20'hd0215;
    stim[11] = 20'hf6b5f;
    stim[12] = 20'hb716d;
    stim[13] = 20'hf204f;
    stim[14] = 20'h2612a;
    stim[15] = 20'h53454;
    stim[16] = 20'h8e36d;
    stim[17] = 20'hba9de;
    stim[18] = 20'hb92fa;
    stim[19] = 20'hba432;
    stim[20] = 20'h3ff35;
    stim[21] = 20'h5f002;
    stim[22] = 20'h7c361;
    stim[23] = 20'h96137;
    stim[24] = 20'h8cdb5;
    stim[25] = 20'h03f45;
    stim[26] = 20'h2f128;
    stim[27] = 20'h0f74a;
    stim[28] = 20'h69e09;
    stim[29] = 20'hd7d0e;
    stim[30] = 20'h16885;
    stim[31] = 20'h5875c;
    stim[32] = 20'had9dc;
    stim[33] = 20'h616c1;
    stim[34] = 20'h2d3c6;
    stim[35] = 20'hcdb4e;
    stim[36] = 20'h21abd;
    stim[37] = 20'hd6964;
    stim[38] = 20'h303a0;
    stim[39] = 20'hd2c19;
    stim[40] = 20'h1553e;
    stim[41] = 20'h51911;
    stim[42] = 20'h2631c;
    stim[43] = 20'h5efb9;
    stim[44] = 20'hf24e2;
    stim[45] = 20'h82f40;
    stim[46] = 20'h189fb;
    stim[47] = 20'he177b;
    stim[48] = 20'hfe021;
    stim[49] = 20'hfcc9b;
    stim[50] = 20'h0c4fe;
    stim[51] = 20'h2037d;
    stim[52] = 20'h23c07;
    stim[53] = 20'hf8216;
    stim[54] = 20'hfeec5;
    stim[55] = 20'h17b23;
    stim[56] = 20'h923f6;
    stim[57] = 20'h276cb;
    stim[58] = 20'h8837c;
    stim[59] = 20'h0c14a;
    stim[60] = 20'h5fb88;
    stim[61] = 20'h8c311;
    stim[62] = 20'hf6cfe;
    stim[63] = 20'h07251;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hffff0000;
      expv[2] = 32'hffff0000;
      expv[3] = 32'hffff8669;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'hffff0000;
      expv[7] = 32'hb53f0000;
      expv[8] = 32'h00000000;
      expv[9] = 32'hffffffff;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hffff82fb;
      expv[12] = 32'hffffffff;
      expv[13] = 32'h0000ffff;
      expv[14] = 32'hffffffff;
      expv[15] = 32'hffff0000;
      expv[16] = 32'hebe4aa81;
      expv[17] = 32'h0000aa81;
      expv[18] = 32'h0000ffff;
      expv[19] = 32'h0000ffff;
      expv[20] = 32'h0000ffff;
      expv[21] = 32'h0000ffff;
      expv[22] = 32'habcff0c8;
      expv[23] = 32'h98acffff;
      expv[24] = 32'h00005da9;
      expv[25] = 32'h00005da9;
      expv[26] = 32'h00005da9;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'hac430000;
      expv[30] = 32'hffff1cf8;
      expv[31] = 32'hffff0973;
      expv[32] = 32'h05ade6aa;
      expv[33] = 32'h00000000;
      expv[34] = 32'h30e20000;
      expv[35] = 32'h30e20000;
      expv[36] = 32'hffff0000;
      expv[37] = 32'hffff0000;
      expv[38] = 32'hffff8c26;
      expv[39] = 32'hffffffff;
      expv[40] = 32'hffffd046;
      expv[41] = 32'hffffa961;
      expv[42] = 32'hcaf7e54e;
      expv[43] = 32'hcaf70000;
      expv[44] = 32'h3c5f735a;
      expv[45] = 32'hffffffff;
      expv[46] = 32'h0000ffff;
      expv[47] = 32'h000052e6;
      expv[48] = 32'hffff0000;
      expv[49] = 32'hffffffff;
      expv[50] = 32'hffffffff;
      expv[51] = 32'hffffffff;
      expv[52] = 32'hffff0000;
      expv[53] = 32'hffff0000;
      expv[54] = 32'hffffffff;
      expv[55] = 32'hffffffff;
      expv[56] = 32'hffff6a19;
      expv[57] = 32'h000032cc;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h870b72bc;
      expv[62] = 32'h000072bc;
      expv[63] = 32'hffffffff;
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
