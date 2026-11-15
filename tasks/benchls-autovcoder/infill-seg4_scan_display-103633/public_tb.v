// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103633 dut (
    .clk(clk),
    .d7s_0(in_vec[27:21]),
    .d7s_1(in_vec[20:14]),
    .d7s_2(in_vec[13:7]),
    .d7s_3(in_vec[6:0]),
    .segments(out_vec[10:4]),
    .anodo(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h89fae8b;
    stim[1] = 28'h2a23b95;
    stim[2] = 28'h3b88016;
    stim[3] = 28'h7614c81;
    stim[4] = 28'h5e75b45;
    stim[5] = 28'h4ed592f;
    stim[6] = 28'h41f3efb;
    stim[7] = 28'h2c79799;
    stim[8] = 28'h00285f0;
    stim[9] = 28'h321a509;
    stim[10] = 28'haf10402;
    stim[11] = 28'h43d384f;
    stim[12] = 28'h9bd8b2f;
    stim[13] = 28'hb49b4b0;
    stim[14] = 28'h0d65431;
    stim[15] = 28'ha60a7e9;
    stim[16] = 28'h2e34f3b;
    stim[17] = 28'h56409db;
    stim[18] = 28'h23a8d9f;
    stim[19] = 28'h6957b67;
    stim[20] = 28'h3d25621;
    stim[21] = 28'h2f8f109;
    stim[22] = 28'h72adc7a;
    stim[23] = 28'h0c82678;
    stim[24] = 28'h82cbf8b;
    stim[25] = 28'h2fd124b;
    stim[26] = 28'h1b32346;
    stim[27] = 28'h023fbac;
    stim[28] = 28'h6ccf388;
    stim[29] = 28'he2cff2d;
    stim[30] = 28'h28c09fc;
    stim[31] = 28'hc3106d3;
    stim[32] = 28'hc3f0dbe;
    stim[33] = 28'hf167d7a;
    stim[34] = 28'h060fef3;
    stim[35] = 28'h07bc2b3;
    stim[36] = 28'he4bcf45;
    stim[37] = 28'h8cd52f5;
    stim[38] = 28'hf822522;
    stim[39] = 28'hd36c3d0;
    stim[40] = 28'hf430ca7;
    stim[41] = 28'h55fe36d;
    stim[42] = 28'hfa70b77;
    stim[43] = 28'hd72a00e;
    stim[44] = 28'h61f615c;
    stim[45] = 28'h10f3ee4;
    stim[46] = 28'h4022f16;
    stim[47] = 28'hb5ece0d;
    stim[48] = 28'h0fcf5ed;
    stim[49] = 28'h9782418;
    stim[50] = 28'h94b671b;
    stim[51] = 28'h4ba798a;
    stim[52] = 28'h79112f8;
    stim[53] = 28'h233f46b;
    stim[54] = 28'hdd6339b;
    stim[55] = 28'h9d84bb4;
    stim[56] = 28'had640dc;
    stim[57] = 28'h6c1b53f;
    stim[58] = 28'hfe59333;
    stim[59] = 28'h5642dba;
    stim[60] = 28'h4c6b7c2;
    stim[61] = 28'hd02bb37;
    stim[62] = 28'ha24f5e3;
    stim[63] = 28'h5405b6d;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h447;
      expv[2] = 11'h08b;
      expv[3] = 11'h00d;
      expv[4] = 11'h01e;
      expv[5] = 11'h3f6;
      expv[6] = 11'h3f6;
      expv[7] = 11'h3f6;
      expv[8] = 11'h3f6;
      expv[9] = 11'h007;
      expv[10] = 11'h06b;
      expv[11] = 11'h08d;
      expv[12] = 11'h4fe;
      expv[13] = 11'h3f6;
      expv[14] = 11'h3f6;
      expv[15] = 11'h3f6;
      expv[16] = 11'h3f6;
      expv[17] = 11'h177;
      expv[18] = 11'h10b;
      expv[19] = 11'h1bd;
      expv[20] = 11'h67e;
      expv[21] = 11'h3f6;
      expv[22] = 11'h3f6;
      expv[23] = 11'h3f6;
      expv[24] = 11'h3f6;
      expv[25] = 11'h417;
      expv[26] = 11'h74b;
      expv[27] = 11'h46d;
      expv[28] = 11'h2ce;
      expv[29] = 11'h3f6;
      expv[30] = 11'h3f6;
      expv[31] = 11'h3f6;
      expv[32] = 11'h3f6;
      expv[33] = 11'h617;
      expv[34] = 11'h59b;
      expv[35] = 11'h7dd;
      expv[36] = 11'h33e;
      expv[37] = 11'h3f6;
      expv[38] = 11'h3f6;
      expv[39] = 11'h3f6;
      expv[40] = 11'h3f6;
      expv[41] = 11'h7a7;
      expv[42] = 11'h7fb;
      expv[43] = 11'h16d;
      expv[44] = 11'h0ee;
      expv[45] = 11'h3f6;
      expv[46] = 11'h3f6;
      expv[47] = 11'h3f6;
      expv[48] = 11'h3f6;
      expv[49] = 11'h077;
      expv[50] = 11'h60b;
      expv[51] = 11'h4ed;
      expv[52] = 11'h0ae;
      expv[53] = 11'h3f6;
      expv[54] = 11'h3f6;
      expv[55] = 11'h3f6;
      expv[56] = 11'h3f6;
      expv[57] = 11'h567;
      expv[58] = 11'h06b;
      expv[59] = 11'h26d;
      expv[60] = 11'h3ae;
      expv[61] = 11'h3f6;
      expv[62] = 11'h3f6;
      expv[63] = 11'h3f6;
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
