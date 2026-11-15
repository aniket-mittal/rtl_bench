// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04396 dut (
    .clk(clk),
    .resetn(in_vec[34:34]),
    .d(in_vec[33:2]),
    .squashn(in_vec[1:1]),
    .en(in_vec[0:0]),
    .q(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h16455f788;
    stim[1] = 35'h1f574c70c;
    stim[2] = 35'h7dc2714f8;
    stim[3] = 35'h5571c081b;
    stim[4] = 35'h553ce2ee7;
    stim[5] = 35'h790125dd1;
    stim[6] = 35'h46ab4714f;
    stim[7] = 35'h52d113834;
    stim[8] = 35'h6ec327c53;
    stim[9] = 35'h53430173b;
    stim[10] = 35'h52dbddba9;
    stim[11] = 35'h70d3b2e0c;
    stim[12] = 35'h712540a95;
    stim[13] = 35'h7215d4841;
    stim[14] = 35'h76de4d416;
    stim[15] = 35'h6348cd8d9;
    stim[16] = 35'h5c320081d;
    stim[17] = 35'h7a7e5a959;
    stim[18] = 35'h66e7278da;
    stim[19] = 35'h72cf20802;
    stim[20] = 35'h7157b1bff;
    stim[21] = 35'h7e3797610;
    stim[22] = 35'h7aa0ed00d;
    stim[23] = 35'h72b5d6faf;
    stim[24] = 35'h43751fd73;
    stim[25] = 35'h08982973c;
    stim[26] = 35'h616bee455;
    stim[27] = 35'h79425b238;
    stim[28] = 35'h550b262bb;
    stim[29] = 35'h4183b8421;
    stim[30] = 35'h544c02353;
    stim[31] = 35'h6f2f3500e;
    stim[32] = 35'h75d7df26e;
    stim[33] = 35'h48d19d86d;
    stim[34] = 35'h529c79f8f;
    stim[35] = 35'h71f2797be;
    stim[36] = 35'h5996159a8;
    stim[37] = 35'h5ab2fa90d;
    stim[38] = 35'h66d2cd184;
    stim[39] = 35'h7c5fa765e;
    stim[40] = 35'h52884568c;
    stim[41] = 35'h41327c049;
    stim[42] = 35'h644217140;
    stim[43] = 35'h698ae4009;
    stim[44] = 35'h5c87cf077;
    stim[45] = 35'h0ee18e4f5;
    stim[46] = 35'h6266479ec;
    stim[47] = 35'h5d44d2933;
    stim[48] = 35'h698e19441;
    stim[49] = 35'h77ef7ea0a;
    stim[50] = 35'h352c3cf3f;
    stim[51] = 35'h4719b9c0c;
    stim[52] = 35'h4420f78db;
    stim[53] = 35'h0b09a8363;
    stim[54] = 35'h6bc22a61e;
    stim[55] = 35'h671b5c747;
    stim[56] = 35'h5e95069cb;
    stim[57] = 35'h7e066e505;
    stim[58] = 35'h6f01ff25b;
    stim[59] = 35'h6d88d9ddc;
    stim[60] = 35'h5c55d6063;
    stim[61] = 35'h7e8f005d1;
    stim[62] = 35'h4b9a6a4a5;
    stim[63] = 35'h422ec4806;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000006;
      expv[5] = 32'h00000019;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000013;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000014;
      expv[10] = 32'h0000000e;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h0000001f;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h0000000b;
      expv[25] = 32'h0000001c;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h0000000e;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000014;
      expv[32] = 32'h00000014;
      expv[33] = 32'h00000014;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000003;
      expv[36] = 32'h00000003;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h0000001d;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h0000000c;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000016;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000011;
      expv[57] = 32'h00000012;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000016;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000018;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
