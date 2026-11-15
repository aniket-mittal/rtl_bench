// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099806 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h418a8df2f5c;
    stim[1] = 43'h115cfb6c957;
    stim[2] = 43'h70a2103d9f0;
    stim[3] = 43'h621ae3a2b96;
    stim[4] = 43'h19143de96a7;
    stim[5] = 43'h7223f4a4a80;
    stim[6] = 43'h7d827a1cf4c;
    stim[7] = 43'h07daa291475;
    stim[8] = 43'h7fe811ead9a;
    stim[9] = 43'h74a1dd81d75;
    stim[10] = 43'h0bc79a3c390;
    stim[11] = 43'h239f1884d4e;
    stim[12] = 43'h1aee637ee2a;
    stim[13] = 43'h65455251cf4;
    stim[14] = 43'h547319f6806;
    stim[15] = 43'h1732e688bcf;
    stim[16] = 43'h748fe1e917c;
    stim[17] = 43'h5960cb52ef1;
    stim[18] = 43'h761f8d96ca5;
    stim[19] = 43'h4a88ccb3dae;
    stim[20] = 43'h568819204ac;
    stim[21] = 43'h67245573275;
    stim[22] = 43'h57ae1106a5f;
    stim[23] = 43'h60b27e846af;
    stim[24] = 43'h1af5dff6302;
    stim[25] = 43'h24b2fd129fc;
    stim[26] = 43'h5091267d4c6;
    stim[27] = 43'h36e974cf198;
    stim[28] = 43'h5a2e16cbf87;
    stim[29] = 43'h290a8579553;
    stim[30] = 43'h018e68e2c8f;
    stim[31] = 43'h0b2c3aa659c;
    stim[32] = 43'h4443422d8c8;
    stim[33] = 43'h2b98c899e86;
    stim[34] = 43'h29f7a1b5e37;
    stim[35] = 43'h30700386d68;
    stim[36] = 43'h172230425ee;
    stim[37] = 43'h46efbd3f6b0;
    stim[38] = 43'h2814d8c4021;
    stim[39] = 43'h2fd04232b93;
    stim[40] = 43'h728bea5f8db;
    stim[41] = 43'h33d5c01b65f;
    stim[42] = 43'h68d396cebd1;
    stim[43] = 43'h13ca52f811f;
    stim[44] = 43'h386d02a66fe;
    stim[45] = 43'h0d3d909e37a;
    stim[46] = 43'h1a4453ff461;
    stim[47] = 43'h02713f878c4;
    stim[48] = 43'h6f170199877;
    stim[49] = 43'h1b9e5506b95;
    stim[50] = 43'h4c9c91678f6;
    stim[51] = 43'h08f5bd40c40;
    stim[52] = 43'h68f885d667f;
    stim[53] = 43'h24cb319f113;
    stim[54] = 43'h3714e3b74b1;
    stim[55] = 43'h607993284e3;
    stim[56] = 43'h64548207f77;
    stim[57] = 43'h764bc6805bb;
    stim[58] = 43'h1b576b24f9a;
    stim[59] = 43'h43faf2abe10;
    stim[60] = 43'h2b8c76606f8;
    stim[61] = 43'h5b692046ad6;
    stim[62] = 43'h23c39223037;
    stim[63] = 43'h58dcd1c4a93;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h418a8df2f5c;
      expv[2] = 43'h115cfb6c957;
      expv[3] = 43'h70a2103d9f0;
      expv[4] = 43'h621ae3a2b96;
      expv[5] = 43'h19143de96a7;
      expv[6] = 43'h7223f4a4a80;
      expv[7] = 43'h7d827a1cf4c;
      expv[8] = 43'h07daa291475;
      expv[9] = 43'h7fe811ead9a;
      expv[10] = 43'h74a1dd81d75;
      expv[11] = 43'h0bc79a3c390;
      expv[12] = 43'h239f1884d4e;
      expv[13] = 43'h1aee637ee2a;
      expv[14] = 43'h65455251cf4;
      expv[15] = 43'h547319f6806;
      expv[16] = 43'h1732e688bcf;
      expv[17] = 43'h748fe1e917c;
      expv[18] = 43'h5960cb52ef1;
      expv[19] = 43'h761f8d96ca5;
      expv[20] = 43'h4a88ccb3dae;
      expv[21] = 43'h568819204ac;
      expv[22] = 43'h67245573275;
      expv[23] = 43'h57ae1106a5f;
      expv[24] = 43'h60b27e846af;
      expv[25] = 43'h1af5dff6302;
      expv[26] = 43'h24b2fd129fc;
      expv[27] = 43'h5091267d4c6;
      expv[28] = 43'h36e974cf198;
      expv[29] = 43'h5a2e16cbf87;
      expv[30] = 43'h290a8579553;
      expv[31] = 43'h018e68e2c8f;
      expv[32] = 43'h0b2c3aa659c;
      expv[33] = 43'h4443422d8c8;
      expv[34] = 43'h2b98c899e86;
      expv[35] = 43'h29f7a1b5e37;
      expv[36] = 43'h30700386d68;
      expv[37] = 43'h172230425ee;
      expv[38] = 43'h46efbd3f6b0;
      expv[39] = 43'h2814d8c4021;
      expv[40] = 43'h2fd04232b93;
      expv[41] = 43'h728bea5f8db;
      expv[42] = 43'h33d5c01b65f;
      expv[43] = 43'h68d396cebd1;
      expv[44] = 43'h13ca52f811f;
      expv[45] = 43'h386d02a66fe;
      expv[46] = 43'h0d3d909e37a;
      expv[47] = 43'h1a4453ff461;
      expv[48] = 43'h02713f878c4;
      expv[49] = 43'h6f170199877;
      expv[50] = 43'h1b9e5506b95;
      expv[51] = 43'h4c9c91678f6;
      expv[52] = 43'h08f5bd40c40;
      expv[53] = 43'h68f885d667f;
      expv[54] = 43'h24cb319f113;
      expv[55] = 43'h3714e3b74b1;
      expv[56] = 43'h607993284e3;
      expv[57] = 43'h64548207f77;
      expv[58] = 43'h764bc6805bb;
      expv[59] = 43'h1b576b24f9a;
      expv[60] = 43'h43faf2abe10;
      expv[61] = 43'h2b8c76606f8;
      expv[62] = 43'h5b692046ad6;
      expv[63] = 43'h23c39223037;
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
