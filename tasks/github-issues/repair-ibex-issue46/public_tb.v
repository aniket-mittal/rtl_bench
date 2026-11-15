// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_compressed_decoder dut (
    .instr_i(in_vec[31:0]),
    .instr_o(out_vec[33:2]),
    .is_compressed_o(out_vec[1:1]),
    .illegal_instr_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hcdc9096a;
    stim[1] = 32'hfed3c448;
    stim[2] = 32'h4f5ae69f;
    stim[3] = 32'h9dff82e1;
    stim[4] = 32'hb29d0a55;
    stim[5] = 32'h6e8f24e0;
    stim[6] = 32'h9d9d8133;
    stim[7] = 32'h7f5f4f67;
    stim[8] = 32'h20c764c3;
    stim[9] = 32'h29950ea2;
    stim[10] = 32'h5fd9d6ec;
    stim[11] = 32'h545c5bf1;
    stim[12] = 32'h26160182;
    stim[13] = 32'h4ded5bc9;
    stim[14] = 32'hb68c8137;
    stim[15] = 32'h8e8626e7;
    stim[16] = 32'h1b0b5005;
    stim[17] = 32'hc8f15ed8;
    stim[18] = 32'hff89b658;
    stim[19] = 32'h41906b79;
    stim[20] = 32'hfdd49888;
    stim[21] = 32'hd1199022;
    stim[22] = 32'h596f59ca;
    stim[23] = 32'h679b9352;
    stim[24] = 32'h2eeb6df8;
    stim[25] = 32'hbfaef55a;
    stim[26] = 32'h32eddbe6;
    stim[27] = 32'h275b71b5;
    stim[28] = 32'h939bd218;
    stim[29] = 32'h6091e829;
    stim[30] = 32'h4ba8e374;
    stim[31] = 32'h19997214;
    stim[32] = 32'h9dac5d9c;
    stim[33] = 32'h60498a40;
    stim[34] = 32'hf590de80;
    stim[35] = 32'h07d31a08;
    stim[36] = 32'h10b1f096;
    stim[37] = 32'hde718765;
    stim[38] = 32'h3bc40824;
    stim[39] = 32'h2c1ba436;
    stim[40] = 32'h2e9e3ba4;
    stim[41] = 32'h33955f1f;
    stim[42] = 32'h467f5b75;
    stim[43] = 32'h129696d2;
    stim[44] = 32'hd353624e;
    stim[45] = 32'h5af8ed51;
    stim[46] = 32'hea05aecf;
    stim[47] = 32'h21332a4b;
    stim[48] = 32'h61cf4653;
    stim[49] = 32'ha88206f3;
    stim[50] = 32'hcbc1dda1;
    stim[51] = 32'h5b246c71;
    stim[52] = 32'h847fa122;
    stim[53] = 32'h291b2eee;
    stim[54] = 32'h06af5ba8;
    stim[55] = 32'h017d6ac7;
    stim[56] = 32'h5c9ae96d;
    stim[57] = 32'hcbd08bdd;
    stim[58] = 32'he17694fa;
    stim[59] = 32'hfdfbd849;
    stim[60] = 32'hf88ef71a;
    stim[61] = 32'hfe574e3c;
    stim[62] = 32'hefc7e99a;
    stim[63] = 32'h793048c4;
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
      expv[0] = 34'h006a4644e;
      expv[1] = 34'h00290988e;
      expv[2] = 34'h13d6b9a7c;
      expv[3] = 34'h0061b5a4e;
      expv[4] = 34'h00568284e;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'h2767604cc;
      expv[7] = 34'h1fd7d3d9c;
      expv[8] = 34'h0831d930c;
      expv[9] = 34'h0023a7a4e;
      expv[10] = 34'h01ada988e;
      expv[11] = 34'h3ff002e4e;
      expv[12] = 34'h00006464f;
      expv[13] = 34'h3fc802e4e;
      expv[14] = 34'h2da3204dc;
      expv[15] = 34'h23a189b9c;
      expv[16] = 34'h3f840004f;
      expv[17] = 34'h00f1a9c0e;
      expv[18] = 34'hxxxxxxxxx;
      expv[19] = 34'h00007acde;
      expv[20] = 34'hxxxxxxxxx;
      expv[21] = 34'h0020000ce;
      expv[22] = 34'h02c04a60e;
      expv[23] = 34'h0050c0cce;
      expv[24] = 34'hxxxxxxxxx;
      expv[25] = 34'hxxxxxxxxx;
      expv[26] = 34'h03e44a88e;
      expv[27] = 34'h3fffb46de;
      expv[28] = 34'h00b98808e;
      expv[29] = 34'h01010658e;
      expv[30] = 34'hxxxxxxxxx;
      expv[31] = 34'hxxxxxxxxx;
      expv[32] = 34'h00e169e0e;
      expv[33] = 34'hxxxxxxxxx;
      expv[34] = 34'h00a1ab08e;
      expv[35] = 34'h04c04144e;
      expv[36] = 34'hxxxxxxxxx;
      expv[37] = 34'h1065d5c4e;
      expv[38] = 34'h00604124e;
      expv[39] = 34'hxxxxxxxxx;
      expv[40] = 34'hxxxxxxxxx;
      expv[41] = 34'h0ce557c7c;
      expv[42] = 34'h3ff402c4e;
      expv[43] = 34'h0051a1ace;
      expv[44] = 34'hxxxxxxxxx;
      expv[45] = 34'h02014798e;
      expv[46] = 34'h3a816bb3c;
      expv[47] = 34'h084cca92c;
      expv[48] = 34'h1873d194c;
      expv[49] = 34'h2a2081bcc;
      expv[50] = 34'h3d016338e;
      expv[51] = 34'h0000730de;
      expv[52] = 34'hxxxxxxxxx;
      expv[53] = 34'hxxxxxxxxx;
      expv[54] = 34'h01c1e940e;
      expv[55] = 34'h005f5ab1c;
      expv[56] = 34'h03814658e;
      expv[57] = 34'h005dfde4e;
      expv[58] = 34'h0079212ce;
      expv[59] = 34'h3e010278e;
      expv[60] = 34'hxxxxxxxxx;
      expv[61] = 34'h016189e0e;
      expv[62] = 34'hxxxxxxxxx;
      expv[63] = 34'h00512920e;
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
