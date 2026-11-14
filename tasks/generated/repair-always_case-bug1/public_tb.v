// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[26:24]),
    .data0(in_vec[23:20]),
    .data1(in_vec[19:16]),
    .data2(in_vec[15:12]),
    .data3(in_vec[11:8]),
    .data4(in_vec[7:4]),
    .data5(in_vec[3:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h6ec9d3a;
    stim[1] = 27'h3aaa12a;
    stim[2] = 27'h1bd86be;
    stim[3] = 27'h2a708de;
    stim[4] = 27'h0e2c8aa;
    stim[5] = 27'h3a360b2;
    stim[6] = 27'h5f04fd1;
    stim[7] = 27'h0f3dfa6;
    stim[8] = 27'h7ed69fb;
    stim[9] = 27'h35d7395;
    stim[10] = 27'h790181e;
    stim[11] = 27'h0af0932;
    stim[12] = 27'h1e5f1d5;
    stim[13] = 27'h7ffc881;
    stim[14] = 27'h384f63c;
    stim[15] = 27'h2f309f4;
    stim[16] = 27'h311c303;
    stim[17] = 27'h4132522;
    stim[18] = 27'h46344bb;
    stim[19] = 27'h6c1266e;
    stim[20] = 27'h25223af;
    stim[21] = 27'h1107408;
    stim[22] = 27'h5b19a50;
    stim[23] = 27'h791b66e;
    stim[24] = 27'h6493e92;
    stim[25] = 27'h6768104;
    stim[26] = 27'h2e636b3;
    stim[27] = 27'h47ae4f4;
    stim[28] = 27'h01dc4bd;
    stim[29] = 27'h49e9bba;
    stim[30] = 27'h5fea567;
    stim[31] = 27'h7f1ff90;
    stim[32] = 27'h44feaee;
    stim[33] = 27'h053a16e;
    stim[34] = 27'h5ff84bb;
    stim[35] = 27'h34a441f;
    stim[36] = 27'h304c6f5;
    stim[37] = 27'h18e9186;
    stim[38] = 27'h590330d;
    stim[39] = 27'h62820cc;
    stim[40] = 27'h70311e0;
    stim[41] = 27'h5eab339;
    stim[42] = 27'h3f09e17;
    stim[43] = 27'h4fa659c;
    stim[44] = 27'h574443c;
    stim[45] = 27'h11715d0;
    stim[46] = 27'h4becd92;
    stim[47] = 27'h40d0da2;
    stim[48] = 27'h7ea849b;
    stim[49] = 27'h21ca58f;
    stim[50] = 27'h46dd983;
    stim[51] = 27'h5797e89;
    stim[52] = 27'h0b92129;
    stim[53] = 27'h0adfc8c;
    stim[54] = 27'h7678e1a;
    stim[55] = 27'h3af5269;
    stim[56] = 27'h5d1a5e6;
    stim[57] = 27'h34bf04e;
    stim[58] = 27'h763d57c;
    stim[59] = 27'h279b95a;
    stim[60] = 27'h4525eb6;
    stim[61] = 27'h46f05d2;
    stim[62] = 27'h37e05b7;
    stim[63] = 27'h4453dfb;
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
      expv[0] = 4'h0;
      expv[1] = 4'ha;
      expv[2] = 4'hd;
      expv[3] = 4'h8;
      expv[4] = 4'he;
      expv[5] = 4'h6;
      expv[6] = 4'h1;
      expv[7] = 4'hf;
      expv[8] = 4'h0;
      expv[9] = 4'h7;
      expv[10] = 4'h0;
      expv[11] = 4'ha;
      expv[12] = 4'h5;
      expv[13] = 4'h0;
      expv[14] = 4'hf;
      expv[15] = 4'h9;
      expv[16] = 4'hc;
      expv[17] = 4'h2;
      expv[18] = 4'hb;
      expv[19] = 4'h0;
      expv[20] = 4'h3;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h6;
      expv[27] = 4'hf;
      expv[28] = 4'h1;
      expv[29] = 4'hb;
      expv[30] = 4'h7;
      expv[31] = 4'h0;
      expv[32] = 4'he;
      expv[33] = 4'h5;
      expv[34] = 4'hb;
      expv[35] = 4'h4;
      expv[36] = 4'hc;
      expv[37] = 4'he;
      expv[38] = 4'hd;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h9;
      expv[42] = 4'h9;
      expv[43] = 4'h9;
      expv[44] = 4'hc;
      expv[45] = 4'h7;
      expv[46] = 4'h9;
      expv[47] = 4'ha;
      expv[48] = 4'h0;
      expv[49] = 4'h5;
      expv[50] = 4'h8;
      expv[51] = 4'h9;
      expv[52] = 4'hb;
      expv[53] = 4'ha;
      expv[54] = 4'h0;
      expv[55] = 4'h5;
      expv[56] = 4'h6;
      expv[57] = 4'hf;
      expv[58] = 4'h0;
      expv[59] = 4'h9;
      expv[60] = 4'hb;
      expv[61] = 4'hd;
      expv[62] = 4'h0;
      expv[63] = 4'hf;
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
