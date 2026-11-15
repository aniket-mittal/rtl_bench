// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072350 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h281f0f13eb;
    stim[1] = 38'h374df01886;
    stim[2] = 38'h161b54a358;
    stim[3] = 38'h00f8645a58;
    stim[4] = 38'h1dbd352347;
    stim[5] = 38'h098ec4a491;
    stim[6] = 38'h01119e1fe2;
    stim[7] = 38'h1a6469c01f;
    stim[8] = 38'h0d6817fcd6;
    stim[9] = 38'h0ceb66bbf2;
    stim[10] = 38'h05d3cd7984;
    stim[11] = 38'h1c3b72e73c;
    stim[12] = 38'h009a1ee043;
    stim[13] = 38'h0c9274be4c;
    stim[14] = 38'h1e089e898c;
    stim[15] = 38'h162a891853;
    stim[16] = 38'h16587f0b36;
    stim[17] = 38'h0a7f5a1c8e;
    stim[18] = 38'h04f6510acc;
    stim[19] = 38'h0b78c988c3;
    stim[20] = 38'h142ba6934e;
    stim[21] = 38'h17e1f4f066;
    stim[22] = 38'h1f558012bd;
    stim[23] = 38'h126e2d7f55;
    stim[24] = 38'h0031793b6d;
    stim[25] = 38'h008fa4e4e9;
    stim[26] = 38'h1b1bab21ed;
    stim[27] = 38'h0a77131427;
    stim[28] = 38'h03aa5c7d72;
    stim[29] = 38'h159546cede;
    stim[30] = 38'h003833b049;
    stim[31] = 38'h0c92fc0944;
    stim[32] = 38'h1362bb6354;
    stim[33] = 38'h04aea46f9f;
    stim[34] = 38'h17c13b79e9;
    stim[35] = 38'h16e691aee6;
    stim[36] = 38'h01ddbb4626;
    stim[37] = 38'h1e18cff496;
    stim[38] = 38'h16089156e8;
    stim[39] = 38'h1be3906ac3;
    stim[40] = 38'h18604c6ca1;
    stim[41] = 38'h1947777656;
    stim[42] = 38'h11fb4d7fcb;
    stim[43] = 38'h0f7bd08664;
    stim[44] = 38'h1a53d78ead;
    stim[45] = 38'h1bc47e2682;
    stim[46] = 38'h0cf1b3e8c0;
    stim[47] = 38'h17e6c75fcd;
    stim[48] = 38'h00790210fb;
    stim[49] = 38'h1f624b1603;
    stim[50] = 38'h0387e71075;
    stim[51] = 38'h0a5078f2a2;
    stim[52] = 38'h115c2bb0b6;
    stim[53] = 38'h17bda61ad5;
    stim[54] = 38'h0bde61da15;
    stim[55] = 38'h1a2759f251;
    stim[56] = 38'h11c57470fd;
    stim[57] = 38'h16abd90395;
    stim[58] = 38'h0a90705261;
    stim[59] = 38'h13b2b8e9f7;
    stim[60] = 38'h1f1bc34c52;
    stim[61] = 38'h1a03be4b77;
    stim[62] = 38'h0f5a243e54;
    stim[63] = 38'h01220eb550;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h36f4d48d1;
      expv[9] = 34'h36f4d48d1;
      expv[10] = 34'h36f4d48d1;
      expv[11] = 34'h36f4d48d1;
      expv[12] = 34'h36f4d48d1;
      expv[13] = 34'h36f4d48d1;
      expv[14] = 34'h36f4d48d1;
      expv[15] = 34'h36f4d48d1;
      expv[16] = 34'h30edcb9cf;
      expv[17] = 34'h30edcb9cf;
      expv[18] = 34'h30edcb9cf;
      expv[19] = 34'h30edcb9cf;
      expv[20] = 34'h30edcb9cf;
      expv[21] = 34'h30edcb9cf;
      expv[22] = 34'h30edcb9cf;
      expv[23] = 34'h30edcb9cf;
      expv[24] = 34'h30edcb9cf;
      expv[25] = 34'h30edcb9cf;
      expv[26] = 34'h30edcb9cf;
      expv[27] = 34'h30edcb9cf;
      expv[28] = 34'h30edcb9cf;
      expv[29] = 34'h30edcb9cf;
      expv[30] = 34'h30edcb9cf;
      expv[31] = 34'h30edcb9cf;
      expv[32] = 34'h30edcb9cf;
      expv[33] = 34'h30edcb9cf;
      expv[34] = 34'h30edcb9cf;
      expv[35] = 34'h30edcb9cf;
      expv[36] = 34'h30edcb9cf;
      expv[37] = 34'h30edcb9cf;
      expv[38] = 34'h30edcb9cf;
      expv[39] = 34'h30edcb9cf;
      expv[40] = 34'h38227a263;
      expv[41] = 34'h38227a263;
      expv[42] = 34'h38227a263;
      expv[43] = 34'h3d56004af;
      expv[44] = 34'h3d56004af;
      expv[45] = 34'h3d56004af;
      expv[46] = 34'h3d56004af;
      expv[47] = 34'h3d56004af;
      expv[48] = 34'h3d56004af;
      expv[49] = 34'h3d56004af;
      expv[50] = 34'h33c6cfa30;
      expv[51] = 34'h33c6cfa30;
      expv[52] = 34'h33c6cfa30;
      expv[53] = 34'h33c6cfa30;
      expv[54] = 34'h33c6cfa30;
      expv[55] = 34'h33c6cfa30;
      expv[56] = 34'h33c6cfa30;
      expv[57] = 34'h33c6cfa30;
      expv[58] = 34'h33c6cfa30;
      expv[59] = 34'h33c6cfa30;
      expv[60] = 34'h3d892c580;
      expv[61] = 34'h3d892c580;
      expv[62] = 34'h3c6f0d314;
      expv[63] = 34'h3c6f0d314;
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
