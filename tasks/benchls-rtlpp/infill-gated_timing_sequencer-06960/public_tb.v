// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06960 dut (
    .clk(clk),
    .rst_n(in_vec[49:49]),
    .ena(in_vec[48:48]),
    .Tsync(in_vec[47:40]),
    .Tgdel(in_vec[39:32]),
    .Tgate(in_vec[31:16]),
    .Tlen(in_vec[15:0]),
    .sync(out_vec[2:2]),
    .gate(out_vec[1:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h0e7bce02239c7;
    stim[1] = 50'h0f8d4c9325657;
    stim[2] = 50'h202a641b69d73;
    stim[3] = 50'h2e6c9f8bef05c;
    stim[4] = 50'h3e8f46dd9e882;
    stim[5] = 50'h3674dde601724;
    stim[6] = 50'h3ec72497d0989;
    stim[7] = 50'h26cbf2f95dfd3;
    stim[8] = 50'h27901388f4ade;
    stim[9] = 50'h3c9df8d65307a;
    stim[10] = 50'h37f801c96c519;
    stim[11] = 50'h356a2b1f74a60;
    stim[12] = 50'h3269d4a0dd167;
    stim[13] = 50'h29ee31abbb994;
    stim[14] = 50'h2aa3b0fe882d0;
    stim[15] = 50'h3200658ece78b;
    stim[16] = 50'h317af01fb9e08;
    stim[17] = 50'h2f92d280df8d7;
    stim[18] = 50'h23f9d3d028bae;
    stim[19] = 50'h2e1ae8cb7fc76;
    stim[20] = 50'h21917abdad2b9;
    stim[21] = 50'h20aa41b8826fd;
    stim[22] = 50'h2fb974ebfd101;
    stim[23] = 50'h341428d0b35d0;
    stim[24] = 50'h34d6bc63888cb;
    stim[25] = 50'h2da805ac0304a;
    stim[26] = 50'h217f6d6fb7aeb;
    stim[27] = 50'h38037cf401f31;
    stim[28] = 50'h1c644f599e281;
    stim[29] = 50'h3ed96c9a1b455;
    stim[30] = 50'h3f9cc49a2b0dd;
    stim[31] = 50'h24d780d92af92;
    stim[32] = 50'h2174972a35557;
    stim[33] = 50'h37bf83a131088;
    stim[34] = 50'h2715054377b27;
    stim[35] = 50'h3292f06e26b91;
    stim[36] = 50'h2e05b64be2cae;
    stim[37] = 50'h37512955186aa;
    stim[38] = 50'h3883a88259f3d;
    stim[39] = 50'h1ad99253c0869;
    stim[40] = 50'h3479c35f804dd;
    stim[41] = 50'h3b9d414197d8a;
    stim[42] = 50'h3dda6b987aae4;
    stim[43] = 50'h2b9bf721ed790;
    stim[44] = 50'h3aec8908e407b;
    stim[45] = 50'h37bd3a17b771c;
    stim[46] = 50'h31706c355f805;
    stim[47] = 50'h3a8fc32eb8a16;
    stim[48] = 50'h25bb738b2e13c;
    stim[49] = 50'h25cc6d82bf32d;
    stim[50] = 50'h25b3c0edb5d58;
    stim[51] = 50'h29f7b9a235aa1;
    stim[52] = 50'h266f7df0ee211;
    stim[53] = 50'h20da18cd1b549;
    stim[54] = 50'h26962c38cb509;
    stim[55] = 50'h3bc678b670e5d;
    stim[56] = 50'h2c3d2b2463011;
    stim[57] = 50'h29bf5383209a2;
    stim[58] = 50'h208c4dab4cde1;
    stim[59] = 50'h08395c7acf046;
    stim[60] = 50'h31aa1ef43bf5f;
    stim[61] = 50'h21cbdc3987294;
    stim[62] = 50'h27f9508bb9187;
    stim[63] = 50'h3a017169aed18;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h0;
      expv[29] = 3'h0;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h0;
      expv[40] = 3'h0;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
