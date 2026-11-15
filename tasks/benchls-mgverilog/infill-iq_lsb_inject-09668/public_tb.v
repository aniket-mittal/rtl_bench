// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09668 dut (
    .clock(clk),
    .reset(in_vec[35:35]),
    .enable(in_vec[34:34]),
    .i_in_ana(in_vec[33:18]),
    .q_in_ana(in_vec[17:2]),
    .i_in_dig(in_vec[1:1]),
    .q_in_dig(in_vec[0:0]),
    .i_out(out_vec[31:16]),
    .q_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hf73eae05d;
    stim[1] = 36'hec2a5e0ec;
    stim[2] = 36'h482bd8fad;
    stim[3] = 36'h4409a2ad1;
    stim[4] = 36'h21bd9698c;
    stim[5] = 36'h76e8dab45;
    stim[6] = 36'h6ade29490;
    stim[7] = 36'h2825d8960;
    stim[8] = 36'h52b480d6a;
    stim[9] = 36'h63aa52d3a;
    stim[10] = 36'h166d4c8c7;
    stim[11] = 36'h5feffcf4b;
    stim[12] = 36'h51bd130a1;
    stim[13] = 36'h1380d2cbd;
    stim[14] = 36'h630c3b2b0;
    stim[15] = 36'h65a367091;
    stim[16] = 36'h3f4d28694;
    stim[17] = 36'h65dee5081;
    stim[18] = 36'h7bc4ee6fe;
    stim[19] = 36'h12fd3d2dd;
    stim[20] = 36'h65cb4870e;
    stim[21] = 36'h6a8267139;
    stim[22] = 36'h69098ff11;
    stim[23] = 36'h68f0f0cba;
    stim[24] = 36'h68180ac95;
    stim[25] = 36'h342178e9d;
    stim[26] = 36'h695d08cf7;
    stim[27] = 36'h3eef140a8;
    stim[28] = 36'h0e4cc4925;
    stim[29] = 36'h177047eb7;
    stim[30] = 36'h14001b4ed;
    stim[31] = 36'h306b4a31d;
    stim[32] = 36'h03222af02;
    stim[33] = 36'h57c2ba973;
    stim[34] = 36'h18f94971d;
    stim[35] = 36'h4dabc541e;
    stim[36] = 36'h099375941;
    stim[37] = 36'h08195c893;
    stim[38] = 36'h168f82370;
    stim[39] = 36'h1dd9f74ac;
    stim[40] = 36'h18cd453f5;
    stim[41] = 36'h38b7f662f;
    stim[42] = 36'h363979515;
    stim[43] = 36'h6f23e2655;
    stim[44] = 36'h644916729;
    stim[45] = 36'h3df761948;
    stim[46] = 36'h287317876;
    stim[47] = 36'h61b71d356;
    stim[48] = 36'h686ee91c0;
    stim[49] = 36'h4ac39286e;
    stim[50] = 36'h19b2a02ba;
    stim[51] = 36'h3a75b8f8a;
    stim[52] = 36'h38984ae98;
    stim[53] = 36'h323dab117;
    stim[54] = 36'h4333c514c;
    stim[55] = 36'h280544f77;
    stim[56] = 36'h624f3305e;
    stim[57] = 36'h786847ef1;
    stim[58] = 36'h49f0f9129;
    stim[59] = 36'h746d774ab;
    stim[60] = 36'h531e13372;
    stim[61] = 36'h6490b5c2b;
    stim[62] = 36'h71dd8be3e;
    stim[63] = 36'h1550d32ea;
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
      expv[0] = 32'hdcfab817;
      expv[1] = 32'hb0a8783a;
      expv[2] = 32'h20ae63eb;
      expv[3] = 32'h10268ab5;
      expv[4] = 32'h86f65a63;
      expv[5] = 32'hdba26ad1;
      expv[6] = 32'hab78a524;
      expv[7] = 32'ha0976258;
      expv[8] = 32'h4ad3035a;
      expv[9] = 32'h8ea94b4e;
      expv[10] = 32'h59b53231;
      expv[11] = 32'h7fbff3d3;
      expv[12] = 32'h46f44c29;
      expv[13] = 32'h4e034b2f;
      expv[14] = 32'h8c30ecac;
      expv[15] = 32'h968c9c25;
      expv[16] = 32'hfd34a1a5;
      expv[17] = 32'h977a9421;
      expv[18] = 32'hef13b9be;
      expv[19] = 32'h4bf4f4b7;
      expv[20] = 32'h972d21c2;
      expv[21] = 32'haa089c4f;
      expv[22] = 32'ha4263fc5;
      expv[23] = 32'ha3c3c32e;
      expv[24] = 32'ha0602b25;
      expv[25] = 32'hd085e3a7;
      expv[26] = 32'ha575233d;
      expv[27] = 32'hfbbc502a;
      expv[28] = 32'h39331249;
      expv[29] = 32'h5dc11fad;
      expv[30] = 32'h50006d3b;
      expv[31] = 32'hc1ad28c7;
      expv[32] = 32'h0c88abc0;
      expv[33] = 32'h5f0bea5d;
      expv[34] = 32'h63e525c7;
      expv[35] = 32'h36af1506;
      expv[36] = 32'h264dd650;
      expv[37] = 32'h20657224;
      expv[38] = 32'h5a3e08dc;
      expv[39] = 32'h7767dd2b;
      expv[40] = 32'h633514fd;
      expv[41] = 32'he2dfd98b;
      expv[42] = 32'hd8e5e545;
      expv[43] = 32'hbc8e8995;
      expv[44] = 32'h912459cb;
      expv[45] = 32'hf7dd8652;
      expv[46] = 32'ha1cc5e1d;
      expv[47] = 32'h86dd74d4;
      expv[48] = 32'ha1baa470;
      expv[49] = 32'h2b0f4a1a;
      expv[50] = 32'h66ca80ae;
      expv[51] = 32'he9d6e3e2;
      expv[52] = 32'he2612ba6;
      expv[53] = 32'hc8f6ac45;
      expv[54] = 32'h0cce1452;
      expv[55] = 32'ha01513dd;
      expv[56] = 32'h893dcc16;
      expv[57] = 32'he1a01fbd;
      expv[58] = 32'h27c2e44b;
      expv[59] = 32'hd1b5dd2b;
      expv[60] = 32'h4c794cdc;
      expv[61] = 32'h9243d70b;
      expv[62] = 32'hc7772f8e;
      expv[63] = 32'h55434cba;
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
