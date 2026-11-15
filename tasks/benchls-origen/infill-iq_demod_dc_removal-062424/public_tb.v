// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062424 dut (
    .CLK(clk),
    .RESET(in_vec[30:30]),
    .conv_en(in_vec[29:29]),
    .adc_data_in(in_vec[28:15]),
    .adc_dcval_subtractor(in_vec[14:0]),
    .data_i(out_vec[29:15]),
    .data_q(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h7466f302;
    stim[1] = 31'h519728ea;
    stim[2] = 31'h3d1b950d;
    stim[3] = 31'h022e8374;
    stim[4] = 31'h1fa46da7;
    stim[5] = 31'h38752fd3;
    stim[6] = 31'h013e8bc9;
    stim[7] = 31'h3f99c982;
    stim[8] = 31'h157dcd3a;
    stim[9] = 31'h136a60d9;
    stim[10] = 31'h16b1bba1;
    stim[11] = 31'h2e407738;
    stim[12] = 31'h140b949a;
    stim[13] = 31'h05341fbe;
    stim[14] = 31'h1f0a21cf;
    stim[15] = 31'h27208650;
    stim[16] = 31'h22dc8551;
    stim[17] = 31'h1bfa01fe;
    stim[18] = 31'h15b6328e;
    stim[19] = 31'h0d728c45;
    stim[20] = 31'h30193ab2;
    stim[21] = 31'h3a78e39b;
    stim[22] = 31'h2ced39d0;
    stim[23] = 31'h37781987;
    stim[24] = 31'h0daa9e20;
    stim[25] = 31'h002a383b;
    stim[26] = 31'h3cbe5227;
    stim[27] = 31'h2f77634e;
    stim[28] = 31'h3e114ef9;
    stim[29] = 31'h0d2cd943;
    stim[30] = 31'h2b421fdc;
    stim[31] = 31'h28d1a320;
    stim[32] = 31'h33f82630;
    stim[33] = 31'h14a56415;
    stim[34] = 31'h18264743;
    stim[35] = 31'h12a91019;
    stim[36] = 31'h25a2d2d0;
    stim[37] = 31'h0b6703cc;
    stim[38] = 31'h368deb4b;
    stim[39] = 31'h1ed6e6d0;
    stim[40] = 31'h090bf751;
    stim[41] = 31'h21804e71;
    stim[42] = 31'h33c3d7af;
    stim[43] = 31'h2efdc571;
    stim[44] = 31'h1595806e;
    stim[45] = 31'h3a189653;
    stim[46] = 31'h356b51fe;
    stim[47] = 31'h2d70f24d;
    stim[48] = 31'h324d7a68;
    stim[49] = 31'h1f10dcdc;
    stim[50] = 31'h01a98f07;
    stim[51] = 31'h5f93de26;
    stim[52] = 31'h106d33a6;
    stim[53] = 31'h2637230b;
    stim[54] = 31'h2bb9b741;
    stim[55] = 31'h05992a53;
    stim[56] = 31'h01c95dfa;
    stim[57] = 31'h3ee2e290;
    stim[58] = 31'h0671c810;
    stim[59] = 31'h2660ee0f;
    stim[60] = 31'h1aa0dbf9;
    stim[61] = 31'h2696490a;
    stim[62] = 31'h3f8d50c8;
    stim[63] = 31'h0e85fedf;
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
      expv[0] = 30'h00000000;
      expv[1] = 30'h00000000;
      expv[2] = 30'h00000000;
      expv[3] = 30'h3295652a;
      expv[4] = 30'h3295652a;
      expv[5] = 30'h3295652a;
      expv[6] = 30'h208bbee9;
      expv[7] = 30'h208bbee9;
      expv[8] = 30'h2527ca4f;
      expv[9] = 30'h2527ca4f;
      expv[10] = 30'h2527ca4f;
      expv[11] = 30'h2527ca4f;
      expv[12] = 30'h2d5c2548;
      expv[13] = 30'h2d5c2548;
      expv[14] = 30'h2d5c2548;
      expv[15] = 30'h2d5c2548;
      expv[16] = 30'h03f887f1;
      expv[17] = 30'h00347f98;
      expv[18] = 30'h00347f98;
      expv[19] = 30'h00347f98;
      expv[20] = 30'h00347f98;
      expv[21] = 30'h2d405a80;
      expv[22] = 30'h37551156;
      expv[23] = 30'h3005600a;
      expv[24] = 30'h2ab4aa97;
      expv[25] = 30'h2ab4aa97;
      expv[26] = 30'h2ab4aa97;
      expv[27] = 30'h2c55d8ab;
      expv[28] = 30'h22303ba0;
      expv[29] = 30'h1694ad29;
      expv[30] = 30'h1694ad29;
      expv[31] = 30'h3b540958;
      expv[32] = 30'h08be917d;
      expv[33] = 30'h1f2041c0;
      expv[34] = 30'h1f2041c0;
      expv[35] = 30'h1f2041c0;
      expv[36] = 30'h1f2041c0;
      expv[37] = 30'h1c3ab875;
      expv[38] = 30'h1c3ab875;
      expv[39] = 30'h00e87e30;
      expv[40] = 30'h00e87e30;
      expv[41] = 30'h00e87e30;
      expv[42] = 30'h25b8cb71;
      expv[43] = 30'h38140fd8;
      expv[44] = 30'h2c45588a;
      expv[45] = 30'h2c45588a;
      expv[46] = 30'h2eef2222;
      expv[47] = 30'h33946728;
      expv[48] = 30'h2bb62894;
      expv[49] = 30'h35196a32;
      expv[50] = 30'h35196a32;
      expv[51] = 30'h00000000;
      expv[52] = 30'h00000000;
      expv[53] = 30'h00000000;
      expv[54] = 30'h34b1e963;
      expv[55] = 30'h30191fce;
      expv[56] = 30'h30191fce;
      expv[57] = 30'h30191fce;
      expv[58] = 30'h3265e4cb;
      expv[59] = 30'h3265e4cb;
      expv[60] = 30'h30a71eb2;
      expv[61] = 30'h30a71eb2;
      expv[62] = 30'h22114422;
      expv[63] = 30'h172951ae;
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
