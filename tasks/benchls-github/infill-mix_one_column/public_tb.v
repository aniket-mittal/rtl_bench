// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mix_one_column dut (
    .in(in_vec[31:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hcd724be4;
    stim[1] = 32'h9a58f739;
    stim[2] = 32'h20cbd3ca;
    stim[3] = 32'h618f75c0;
    stim[4] = 32'hdba8a32f;
    stim[5] = 32'h77a0d3f8;
    stim[6] = 32'h94bbfee2;
    stim[7] = 32'hd8679ff3;
    stim[8] = 32'ha2a64205;
    stim[9] = 32'h3349848b;
    stim[10] = 32'h5c36265b;
    stim[11] = 32'h43dd557d;
    stim[12] = 32'hd60ff641;
    stim[13] = 32'h9ec43511;
    stim[14] = 32'ha986c0e0;
    stim[15] = 32'hc7ec8dd1;
    stim[16] = 32'h3246ad08;
    stim[17] = 32'h7784942b;
    stim[18] = 32'h9fb83b88;
    stim[19] = 32'h886b8bbe;
    stim[20] = 32'h4a1c389b;
    stim[21] = 32'ha941a753;
    stim[22] = 32'hbb36cc15;
    stim[23] = 32'hff703ab1;
    stim[24] = 32'h983a91f5;
    stim[25] = 32'h74de0052;
    stim[26] = 32'hcd42a9d6;
    stim[27] = 32'h7755a363;
    stim[28] = 32'h2bbc6939;
    stim[29] = 32'h78ba6889;
    stim[30] = 32'hf77cb7cf;
    stim[31] = 32'h0cc0f74f;
    stim[32] = 32'h70e239e7;
    stim[33] = 32'h6aba8de7;
    stim[34] = 32'hc4a1ae9f;
    stim[35] = 32'hb3fa6b02;
    stim[36] = 32'h10b23864;
    stim[37] = 32'h667fef43;
    stim[38] = 32'hbc05abdc;
    stim[39] = 32'h302c68aa;
    stim[40] = 32'ha239c002;
    stim[41] = 32'h69b5f194;
    stim[42] = 32'h101915a0;
    stim[43] = 32'h4dcb9d78;
    stim[44] = 32'h90247042;
    stim[45] = 32'hb3a6ef60;
    stim[46] = 32'hce3c5ca1;
    stim[47] = 32'h436630b9;
    stim[48] = 32'ha3538445;
    stim[49] = 32'hbfd07cea;
    stim[50] = 32'h72f37f09;
    stim[51] = 32'hb2ec1ebf;
    stim[52] = 32'hdea2d26c;
    stim[53] = 32'h46b7b390;
    stim[54] = 32'h755c9c20;
    stim[55] = 32'h5ebec40f;
    stim[56] = 32'hadf7a8f1;
    stim[57] = 32'h0f840783;
    stim[58] = 32'he6d7ac46;
    stim[59] = 32'h0b57d841;
    stim[60] = 32'h31a29e5b;
    stim[61] = 32'h652508a2;
    stim[62] = 32'h50896a8b;
    stim[63] = 32'h942cd1cc;
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
      expv[0] = 32'hb8101ea6;
      expv[1] = 32'h09117c68;
      expv[2] = 32'h1f0913f7;
      expv[3] = 32'hfd3b5fc2;
      expv[4] = 32'hc2415f23;
      expv[5] = 32'h3eba7901;
      expv[6] = 32'hf902f53d;
      expv[7] = 32'h6e5f9476;
      expv[8] = 32'he9368f13;
      expv[9] = 32'hb2bdef95;
      expv[10] = 32'h9f01cb42;
      expv[11] = 32'hd260b3b7;
      expv[12] = 32'h1188ed1a;
      expv[13] = 32'h5443036a;
      expv[14] = 32'hf8058f7d;
      expv[15] = 32'he659428a;
      expv[16] = 32'h0b5a2dad;
      expv[17] = 32'hc6e8bddf;
      expv[18] = 32'h4531d232;
      expv[19] = 32'h83663704;
      expv[20] = 32'h13a190d7;
      expv[21] = 32'h7e8a48a0;
      expv[22] = 32'hee8d3106;
      expv[23] = 32'hfee03329;
      expv[24] = 32'h01b19fe9;
      expv[25] = 32'hc3815ce6;
      expv[26] = 32'h387fa710;
      expv[27] = 32'hd140daa9;
      expv[28] = 32'hd9ca0eda;
      expv[29] = 32'hc4269253;
      expv[30] = 32'h0902b44c;
      expv[31] = 32'hfbdae8bd;
      expv[32] = 32'h0303d29e;
      expv[33] = 32'h6b6ee35c;
      expv[34] = 32'h5aeb987d;
      expv[35] = 32'h01e3995b;
      expv[36] = 32'hb1437e72;
      expv[37] = 32'he1f119bc;
      expv[38] = 32'h1b8c8bd2;
      expv[39] = 32'hd67a295b;
      expv[40] = 32'hd6890600;
      expv[41] = 32'h738482cc;
      expv[42] = 32'hbebdd867;
      expv[43] = 32'h39042f71;
      expv[44] = 32'h650a927b;
      expv[45] = 32'h03ae7047;
      expv[46] = 32'h3ef3b270;
      expv[47] = 32'ha56695fa;
      expv[48] = 32'h69d72ca3;
      expv[49] = 32'h986ab2b9;
      expv[50] = 32'h9c076408;
      expv[51] = 32'hf1ecb85a;
      expv[52] = 32'he48077d1;
      expv[53] = 32'h6d6d27f5;
      expv[54] = 32'hb2526a1f;
      expv[55] = 32'hae616286;
      expv[56] = 32'h1a4a194a;
      expv[57] = 32'h0d961b8f;
      expv[58] = 32'h5ffab8c6;
      expv[59] = 32'h76973410;
      expv[60] = 32'h5a8c59d9;
      expv[61] = 32'h0f95addd;
      expv[62] = 32'hc16c8b1e;
      expv[63] = 32'h5a684ed9;
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
