// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .a(in_vec[29:25]),
    .b(in_vec[24:20]),
    .c(in_vec[19:15]),
    .d(in_vec[14:10]),
    .e(in_vec[9:5]),
    .f(in_vec[4:0]),
    .w(out_vec[31:24]),
    .x(out_vec[23:16]),
    .y(out_vec[15:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h39f2b9cc;
    stim[1] = 30'h1266c224;
    stim[2] = 30'h1f4a816d;
    stim[3] = 30'h389a6a06;
    stim[4] = 30'h01f5a4f2;
    stim[5] = 30'h32064326;
    stim[6] = 30'h15e72b85;
    stim[7] = 30'h05cf3e7a;
    stim[8] = 30'h2eec778f;
    stim[9] = 30'h1eced710;
    stim[10] = 30'h2e42f28e;
    stim[11] = 30'h3d748f7c;
    stim[12] = 30'h0640e36c;
    stim[13] = 30'h2eed28ba;
    stim[14] = 30'h2d9eec58;
    stim[15] = 30'h359be3cc;
    stim[16] = 30'h0c8281f5;
    stim[17] = 30'h2a60427b;
    stim[18] = 30'h2f60c7d5;
    stim[19] = 30'h22713ce6;
    stim[20] = 30'h3e6b69a5;
    stim[21] = 30'h2d83a2ad;
    stim[22] = 30'h1a303ea2;
    stim[23] = 30'h24699a62;
    stim[24] = 30'h18ff24b9;
    stim[25] = 30'h10877c32;
    stim[26] = 30'h2ba28b49;
    stim[27] = 30'h03d5c637;
    stim[28] = 30'h04587517;
    stim[29] = 30'h27249307;
    stim[30] = 30'h1775ef7e;
    stim[31] = 30'h21cb3429;
    stim[32] = 30'h308cc260;
    stim[33] = 30'h2ff9ae60;
    stim[34] = 30'h22f47662;
    stim[35] = 30'h1694f723;
    stim[36] = 30'h1d5cda7f;
    stim[37] = 30'h0729e4e6;
    stim[38] = 30'h3291f11f;
    stim[39] = 30'h3420c8ec;
    stim[40] = 30'h19f7826f;
    stim[41] = 30'h2ec0d662;
    stim[42] = 30'h292b9914;
    stim[43] = 30'h1c671db1;
    stim[44] = 30'h3cf31edb;
    stim[45] = 30'h34b6189d;
    stim[46] = 30'h027438bc;
    stim[47] = 30'h3cc60c4f;
    stim[48] = 30'h3d534c45;
    stim[49] = 30'h008cbea6;
    stim[50] = 30'h0463a7c7;
    stim[51] = 30'h360c0392;
    stim[52] = 30'h1d50157e;
    stim[53] = 30'h336c5334;
    stim[54] = 30'h07292884;
    stim[55] = 30'h245f7f96;
    stim[56] = 30'h0d62acc1;
    stim[57] = 30'h1479046e;
    stim[58] = 30'h173c2779;
    stim[59] = 30'h1393e140;
    stim[60] = 30'h304aff62;
    stim[61] = 30'h1dee7844;
    stim[62] = 30'h2b27f111;
    stim[63] = 30'h360af775;
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
      expv[0] = 32'he7cae733;
      expv[1] = 32'h499b0893;
      expv[2] = 32'h7d2a05b7;
      expv[3] = 32'he269a81b;
      expv[4] = 32'h07d693cb;
      expv[5] = 32'hc8190c9b;
      expv[6] = 32'h579cae17;
      expv[7] = 32'h173cf9eb;
      expv[8] = 32'hbbb1de3f;
      expv[9] = 32'h7b3b5c43;
      expv[10] = 32'hb90bca3b;
      expv[11] = 32'hf5d23df3;
      expv[12] = 32'h19038db3;
      expv[13] = 32'hbbb4a2eb;
      expv[14] = 32'hb67bb163;
      expv[15] = 32'hd66f8f33;
      expv[16] = 32'h320a07d7;
      expv[17] = 32'ha98109ef;
      expv[18] = 32'hbd831f57;
      expv[19] = 32'h89c4f39b;
      expv[20] = 32'hf9ada697;
      expv[21] = 32'hb60e8ab7;
      expv[22] = 32'h68c0fa8b;
      expv[23] = 32'h91a6698b;
      expv[24] = 32'h63fc92e7;
      expv[25] = 32'h421df0cb;
      expv[26] = 32'hae8a2d27;
      expv[27] = 32'h0f5718df;
      expv[28] = 32'h1161d45f;
      expv[29] = 32'h9c924c1f;
      expv[30] = 32'h5dd7bdfb;
      expv[31] = 32'h872cd0a7;
      expv[32] = 32'hc2330983;
      expv[33] = 32'hbfe6b983;
      expv[34] = 32'h8bd1d98b;
      expv[35] = 32'h5a53dc8f;
      expv[36] = 32'h757369ff;
      expv[37] = 32'h1ca7939b;
      expv[38] = 32'hca47c47f;
      expv[39] = 32'hd08323b3;
      expv[40] = 32'h67de09bf;
      expv[41] = 32'hbb03598b;
      expv[42] = 32'ha4ae6453;
      expv[43] = 32'h719c76c7;
      expv[44] = 32'hf3cc7b6f;
      expv[45] = 32'hd2d86277;
      expv[46] = 32'h09d0e2f3;
      expv[47] = 32'hf318313f;
      expv[48] = 32'hf54d3117;
      expv[49] = 32'h0232fa9b;
      expv[50] = 32'h118e9f1f;
      expv[51] = 32'hd8300e4b;
      expv[52] = 32'h754055fb;
      expv[53] = 32'hcdb14cd3;
      expv[54] = 32'h1ca4a213;
      expv[55] = 32'h917dfe5b;
      expv[56] = 32'h358ab307;
      expv[57] = 32'h51e411bb;
      expv[58] = 32'h5cf09de7;
      expv[59] = 32'h4e4f8503;
      expv[60] = 32'hc12bfd8b;
      expv[61] = 32'h77b9e113;
      expv[62] = 32'hac9fc447;
      expv[63] = 32'hd82bddd7;
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
