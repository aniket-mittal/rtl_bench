// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08286 dut (
    .clk(clk),
    .rst(in_vec[51:51]),
    .fracta_i(in_vec[50:27]),
    .fractb_i(in_vec[26:3]),
    .signa_i(in_vec[2:2]),
    .signb_i(in_vec[1:1]),
    .start_i(in_vec[0:0]),
    .fract_o(out_vec[49:2]),
    .sign_o(out_vec[1:1]),
    .ready_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hadc5a1d7cea74;
    stim[1] = 52'h88866bb8b1805;
    stim[2] = 52'h77ada34ae62f8;
    stim[3] = 52'h322829ca0e683;
    stim[4] = 52'h0e836cd366700;
    stim[5] = 52'h2f362683418cc;
    stim[6] = 52'h17123a6f04208;
    stim[7] = 52'h6c02170b7195d;
    stim[8] = 52'h3fca8cbb3f515;
    stim[9] = 52'h1f8c664a2de24;
    stim[10] = 52'h2f8218aac9068;
    stim[11] = 52'h186316695a8ea;
    stim[12] = 52'h0cad57776f684;
    stim[13] = 52'h33d62f6059e24;
    stim[14] = 52'h238b818f4f608;
    stim[15] = 52'h2e577fd5c425f;
    stim[16] = 52'h4b2af0c4eba15;
    stim[17] = 52'h19beeeb8966d9;
    stim[18] = 52'h48db0f23aafa0;
    stim[19] = 52'h07d8f66c8bc3d;
    stim[20] = 52'h2c427a0f8dcb0;
    stim[21] = 52'h2998396e7d1db;
    stim[22] = 52'h57a0719d83a42;
    stim[23] = 52'h38927228154d7;
    stim[24] = 52'h025f0d882af1e;
    stim[25] = 52'h6f03a7b6c2467;
    stim[26] = 52'h25e1d2e25c00b;
    stim[27] = 52'h59738b4445ca5;
    stim[28] = 52'h78706ce3433c6;
    stim[29] = 52'h5f3837f170dc9;
    stim[30] = 52'h49e4d42ea9852;
    stim[31] = 52'h14420099433d8;
    stim[32] = 52'h0f1d5233fe5ea;
    stim[33] = 52'h78ad7d6b18b4b;
    stim[34] = 52'h5afdba0bbd23f;
    stim[35] = 52'h790c24610a8cf;
    stim[36] = 52'h734a47133cd10;
    stim[37] = 52'h5f5af572aed8b;
    stim[38] = 52'h33ef7553162dd;
    stim[39] = 52'h58df58efd9a38;
    stim[40] = 52'h62e23612e9738;
    stim[41] = 52'h6638c79afe4d8;
    stim[42] = 52'h666496528df8c;
    stim[43] = 52'hc5f03bc89f98a;
    stim[44] = 52'h2f113f75935e1;
    stim[45] = 52'h3a48b757f3f5e;
    stim[46] = 52'hb23ff11ef755c;
    stim[47] = 52'h2b17d7fc98969;
    stim[48] = 52'h4efa55f7968bc;
    stim[49] = 52'h642a74f1bcb78;
    stim[50] = 52'h31ee8c965f630;
    stim[51] = 52'h326fd5b0a3213;
    stim[52] = 52'h53fa0453ffe85;
    stim[53] = 52'h2f7b1c22933f1;
    stim[54] = 52'h58f0fe7db8714;
    stim[55] = 52'h72eab580d8c9f;
    stim[56] = 52'h1d7754a9e02f1;
    stim[57] = 52'h04cc33b00dfbe;
    stim[58] = 52'h4542fbafa98e7;
    stim[59] = 52'h13bb003d83e88;
    stim[60] = 52'h414f3f7906128;
    stim[61] = 52'h1bc5cdb7c9004;
    stim[62] = 52'h6d4c3af631e7b;
    stim[63] = 52'haa62b34b57701;
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
      expv[0] = 50'h0000000000000;
      expv[1] = 50'h0000000000000;
      expv[2] = 50'h0000000000000;
      expv[3] = 50'h000000000000x;
      expv[4] = 50'h0000000000000;
      expv[5] = 50'h0000000000002;
      expv[6] = 50'h0000000000000;
      expv[7] = 50'h0000000000002;
      expv[8] = 50'h0000000000000;
      expv[9] = 50'h0000000000002;
      expv[10] = 50'h000000b0085c2;
      expv[11] = 50'h0000000000002;
      expv[12] = 50'h0000000000000;
      expv[13] = 50'h0000000000002;
      expv[14] = 50'h00000030c62c2;
      expv[15] = 50'h00000030c62c2;
      expv[16] = 50'h00000030c62c0;
      expv[17] = 50'h00000030c62c0;
      expv[18] = 50'h000005fbb61c2;
      expv[19] = 50'h0000000000000;
      expv[20] = 50'h0000000cdf774;
      expv[21] = 50'h0000000000002;
      expv[22] = 50'h00000007d8f60;
      expv[23] = 50'h0000000000002;
      expv[24] = 50'h0000002998392;
      expv[25] = 50'h0000000000000;
      expv[26] = 50'h0000003892720;
      expv[27] = 50'h000000012f86c;
      expv[28] = 50'h000000012f86e;
      expv[29] = 50'h00000012f0e96;
      expv[30] = 50'h0000000000000;
      expv[31] = 50'h0000000000000;
      expv[32] = 50'h0000000000002;
      expv[33] = 50'h0000000000000;
      expv[34] = 50'h000000144200a;
      expv[35] = 50'h000000327ca4a;
      expv[36] = 50'h0000011532988;
      expv[37] = 50'h0000000d7edd0;
      expv[38] = 50'h0000001c86120;
      expv[39] = 50'h0000000000002;
      expv[40] = 50'h0000000000002;
      expv[41] = 50'h00000019f7ba8;
      expv[42] = 50'h0000000c6fac4;
      expv[43] = 50'h0000000000000;
      expv[44] = 50'h0000000000000;
      expv[45] = 50'h0000000000000;
      expv[46] = 50'h0000000000000;
      expv[47] = 50'h0000000000000;
      expv[48] = 50'h0000000000000;
      expv[49] = 50'h0000000000000;
      expv[50] = 50'h0000000000002;
      expv[51] = 50'h000000077d2ac;
      expv[52] = 50'h0000002ba79f4;
      expv[53] = 50'h0000008f84b86;
      expv[54] = 50'h0000008f84b86;
      expv[55] = 50'h0000000000000;
      expv[56] = 50'h0000000000002;
      expv[57] = 50'h0000000000000;
      expv[58] = 50'h00000032eab58;
      expv[59] = 50'h0000000000000;
      expv[60] = 50'h000000026619c;
      expv[61] = 50'h000000026619c;
      expv[62] = 50'h00000009dd800;
      expv[63] = 50'h0000000000000;
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
