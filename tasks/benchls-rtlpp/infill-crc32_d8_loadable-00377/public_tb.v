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

  rtlpp_00377 dut (
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
    stim[0] = 43'h3d72068eec6;
    stim[1] = 43'h72f209cf3c9;
    stim[2] = 43'h09252d914a9;
    stim[3] = 43'h0309937fb40;
    stim[4] = 43'h1fb233793ce;
    stim[5] = 43'h37a4d584ca5;
    stim[6] = 43'h1999212558d;
    stim[7] = 43'h4baa14488b2;
    stim[8] = 43'h3411f892ad1;
    stim[9] = 43'h7bb1f000632;
    stim[10] = 43'h0f32c24ac60;
    stim[11] = 43'h33a6fdd3973;
    stim[12] = 43'h1a1a9fde4d0;
    stim[13] = 43'h2937e35e951;
    stim[14] = 43'h74b11b0741b;
    stim[15] = 43'h153814d9bb2;
    stim[16] = 43'h2630c3063a7;
    stim[17] = 43'h688aca0607f;
    stim[18] = 43'h1684ce79ba4;
    stim[19] = 43'h652ef509dcc;
    stim[20] = 43'h082236a5827;
    stim[21] = 43'h01af71fc6db;
    stim[22] = 43'h11935a22bcc;
    stim[23] = 43'h2bbc98fa2aa;
    stim[24] = 43'h2c901768652;
    stim[25] = 43'h3100d3fd853;
    stim[26] = 43'h2c388f958e8;
    stim[27] = 43'h239a273986b;
    stim[28] = 43'h07bf14b0c6b;
    stim[29] = 43'h1e897eaf685;
    stim[30] = 43'h78813386f89;
    stim[31] = 43'h3a0293395b5;
    stim[32] = 43'h26b90157075;
    stim[33] = 43'h7027981c4fa;
    stim[34] = 43'h2284cdd5960;
    stim[35] = 43'h7d17095df28;
    stim[36] = 43'h01267ca56cd;
    stim[37] = 43'h5d24524d4c4;
    stim[38] = 43'h249c20e8b03;
    stim[39] = 43'h373ae435f18;
    stim[40] = 43'h7b0c778f49a;
    stim[41] = 43'h0b9e0541a7c;
    stim[42] = 43'h2e9f1350357;
    stim[43] = 43'h1a1cc509254;
    stim[44] = 43'h6c15afb62b3;
    stim[45] = 43'h770094ce330;
    stim[46] = 43'h000347a635c;
    stim[47] = 43'h36a37a4605a;
    stim[48] = 43'h0c9bc75ed71;
    stim[49] = 43'h3d81cdf6e7b;
    stim[50] = 43'h250aafa3e76;
    stim[51] = 43'h4fa5093a0d4;
    stim[52] = 43'h10a4f5f82a3;
    stim[53] = 43'h1a98cc643e1;
    stim[54] = 43'h528e3acea7a;
    stim[55] = 43'h22482873908;
    stim[56] = 43'h0d0d6f54927;
    stim[57] = 43'h5d270fd3448;
    stim[58] = 43'h75b187a60cc;
    stim[59] = 43'h3da56cd9f95;
    stim[60] = 43'h6a3f6e05546;
    stim[61] = 43'h0e8629bcb2d;
    stim[62] = 43'h3805d563428;
    stim[63] = 43'h15994bb6da5;
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
      expv[3] = 32'hd26c4a22;
      expv[4] = 32'h31c0b481;
      expv[5] = 32'h233793ce;
      expv[6] = 32'h4e8e8ef4;
      expv[7] = 32'h126c5e5f;
      expv[8] = 32'h126c5e5f;
      expv[9] = 32'h1297d0bd;
      expv[10] = 32'h1f000632;
      expv[11] = 32'he3a7fe99;
      expv[12] = 32'h1f8be52a;
      expv[13] = 32'h4d59d997;
      expv[14] = 32'h7e35e951;
      expv[15] = 32'h98c67de4;
      expv[16] = 32'h2208e7d0;
      expv[17] = 32'h2eef3df8;
      expv[18] = 32'h4a1a06e1;
      expv[19] = 32'h4a1a06e1;
      expv[20] = 32'h4a1a06e1;
      expv[21] = 32'h730a05fe;
      expv[22] = 32'habe31d5e;
      expv[23] = 32'h343ae0e6;
      expv[24] = 32'hc98fa2aa;
      expv[25] = 32'h96313574;
      expv[26] = 32'h96313574;
      expv[27] = 32'h88f958e8;
      expv[28] = 32'he8c3a571;
      expv[29] = 32'hf14b0c6b;
      expv[30] = 32'hfe3a31eb;
      expv[31] = 32'hfe3a31eb;
      expv[32] = 32'hfe3a31eb;
      expv[33] = 32'h90157075;
      expv[34] = 32'h3526beca;
      expv[35] = 32'h20e0ec32;
      expv[36] = 32'h7095df28;
      expv[37] = 32'h7095df28;
      expv[38] = 32'h7ce90d11;
      expv[39] = 32'hae01ca03;
      expv[40] = 32'hae435f18;
      expv[41] = 32'h1ed58e81;
      expv[42] = 32'he0541a7c;
      expv[43] = 32'hf1350357;
      expv[44] = 32'hcc509254;
      expv[45] = 32'h5afb62b3;
      expv[46] = 32'h5afb62b3;
      expv[47] = 32'h5afb62b3;
      expv[48] = 32'h5afb62b3;
      expv[49] = 32'h31178f2d;
      expv[50] = 32'h31178f2d;
      expv[51] = 32'h31178f2d;
      expv[52] = 32'h31178f2d;
      expv[53] = 32'hda2ede64;
      expv[54] = 32'h8c2d55a8;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h92b45e68;
      expv[60] = 32'h76238628;
      expv[61] = 32'h124baebb;
      expv[62] = 32'h0ca26003;
      expv[63] = 32'h0ca26003;
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
