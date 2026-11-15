// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00376 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h7043e364cca;
    stim[1] = 43'h2b506c2b8b5;
    stim[2] = 43'h7812616f9f3;
    stim[3] = 43'h0709aad345f;
    stim[4] = 43'h0f332d69db6;
    stim[5] = 43'h47988e4630b;
    stim[6] = 43'h6db297793ff;
    stim[7] = 43'h708bb3915e7;
    stim[8] = 43'h7827c38e15b;
    stim[9] = 43'h479bf7129f4;
    stim[10] = 43'h0d38ea01f1c;
    stim[11] = 43'h6e82d0d16e7;
    stim[12] = 43'h2615f0bcdd3;
    stim[13] = 43'h422db7dc0d0;
    stim[14] = 43'h660633ba096;
    stim[15] = 43'h373eded3820;
    stim[16] = 43'h0488a844230;
    stim[17] = 43'h2e3b9084c3c;
    stim[18] = 43'h440b7a05b14;
    stim[19] = 43'h47bb26b43fa;
    stim[20] = 43'h46ac14b0000;
    stim[21] = 43'h0eb289be985;
    stim[22] = 43'h25890b96def;
    stim[23] = 43'h6daec6befdb;
    stim[24] = 43'h50908abfc55;
    stim[25] = 43'h1225f691fbb;
    stim[26] = 43'h3d071a046e7;
    stim[27] = 43'h0c25ae84590;
    stim[28] = 43'h298ec4b5893;
    stim[29] = 43'h2e999b2acae;
    stim[30] = 43'h0a8a8eec708;
    stim[31] = 43'h5ba79b670a0;
    stim[32] = 43'h111903f22ed;
    stim[33] = 43'h4f170a03066;
    stim[34] = 43'h6925c6b0947;
    stim[35] = 43'h251035c4f18;
    stim[36] = 43'h5f809513d6a;
    stim[37] = 43'h732f1af2d75;
    stim[38] = 43'h49b2e8da01d;
    stim[39] = 43'h7c04bd63ae1;
    stim[40] = 43'h48a7cd6cfaf;
    stim[41] = 43'h5982f4c1ac4;
    stim[42] = 43'h213c0ad03f0;
    stim[43] = 43'h3d97e170a5b;
    stim[44] = 43'h3b6415dd397;
    stim[45] = 43'h242c04b5d7e;
    stim[46] = 43'h7022d828fb4;
    stim[47] = 43'h5299b109e90;
    stim[48] = 43'h71b06cedaac;
    stim[49] = 43'h14b53aaa753;
    stim[50] = 43'h0ab205ed49d;
    stim[51] = 43'h068756fd9e7;
    stim[52] = 43'h7bb7f313c80;
    stim[53] = 43'h6c2fb323e5a;
    stim[54] = 43'h71d0811c9f9;
    stim[55] = 43'h2a9b8ee29d5;
    stim[56] = 43'h370dbcbdd89;
    stim[57] = 43'h249de54d3c0;
    stim[58] = 43'h0f048a75479;
    stim[59] = 43'h3b81785587e;
    stim[60] = 43'h5b2af864312;
    stim[61] = 43'h0aa96df53fa;
    stim[62] = 43'h4bb28e7e855;
    stim[63] = 43'h490b498641c;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h2616f9f3;
      expv[4] = 32'h2616f9f3;
      expv[5] = 32'h32d69db6;
      expv[6] = 32'h7bb29ae4;
      expv[7] = 32'h297793ff;
      expv[8] = 32'hf7a93eef;
      expv[9] = 32'hf7a93eef;
      expv[10] = 32'hb779bf3d;
      expv[11] = 32'h8ea01f1c;
      expv[12] = 32'h960655f2;
      expv[13] = 32'h5f0bcdd3;
      expv[14] = 32'h5f0bcdd3;
      expv[15] = 32'h311d5548;
      expv[16] = 32'heded3820;
      expv[17] = 32'h8977e23f;
      expv[18] = 32'hb9084c3c;
      expv[19] = 32'hda207622;
      expv[20] = 32'hb26b43fa;
      expv[21] = 32'h8ebc10ab;
      expv[22] = 32'hb1538dc1;
      expv[23] = 32'h97ae091a;
      expv[24] = 32'h97ae091a;
      expv[25] = 32'haf83f37b;
      expv[26] = 32'haf83f37b;
      expv[27] = 32'hc1b454c7;
      expv[28] = 32'hc1b454c7;
      expv[29] = 32'h87067a36;
      expv[30] = 32'h99b2acae;
      expv[31] = 32'h99b2acae;
      expv[32] = 32'h99b2acae;
      expv[33] = 32'h1601b99a;
      expv[34] = 32'h70a03066;
      expv[35] = 32'h70a03066;
      expv[36] = 32'h589d0e60;
      expv[37] = 32'h589d0e60;
      expv[38] = 32'h589d0e60;
      expv[39] = 32'h1cbe4894;
      expv[40] = 32'hef0bcd3b;
      expv[41] = 32'hef0bcd3b;
      expv[42] = 32'hd7f78515;
      expv[43] = 32'hc0ad03f0;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'hfa3253ed;
      expv[47] = 32'h86ef5e90;
      expv[48] = 32'h597d181d;
      expv[49] = 32'h06cedaac;
      expv[50] = 32'h1cb6e622;
      expv[51] = 32'h75112553;
      expv[52] = 32'hbd80969f;
      expv[53] = 32'h7f313c80;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'hb8ee29d5;
      expv[57] = 32'hb8ee29d5;
      expv[58] = 32'hde54d3c0;
      expv[59] = 32'hde54d3c0;
      expv[60] = 32'hde54d3c0;
      expv[61] = 32'hde54d3c0;
      expv[62] = 32'hde7ee867;
      expv[63] = 32'h08293ab8;
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
