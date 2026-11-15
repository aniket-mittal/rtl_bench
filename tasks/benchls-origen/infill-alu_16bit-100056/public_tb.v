// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_100056 dut (
    .x(in_vec[37:22]),
    .y(in_vec[21:6]),
    .select(in_vec[5:0]),
    .out(out_vec[17:2]),
    .zr(out_vec[1:1]),
    .ng(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h3100309b94;
    stim[1] = 38'h3d9633d44d;
    stim[2] = 38'h33ecd3fb35;
    stim[3] = 38'h2ae5a7e8e0;
    stim[4] = 38'h1f64d84d8a;
    stim[5] = 38'h1be63bab5f;
    stim[6] = 38'h3c9d4db552;
    stim[7] = 38'h3b134964ab;
    stim[8] = 38'h1c72d935a9;
    stim[9] = 38'h0f34da8453;
    stim[10] = 38'h017709e3c2;
    stim[11] = 38'h1d36b07c67;
    stim[12] = 38'h0d56079f36;
    stim[13] = 38'h1c24cd3763;
    stim[14] = 38'h3c1a722c18;
    stim[15] = 38'h20df76319a;
    stim[16] = 38'h05a867864c;
    stim[17] = 38'h0394ee171a;
    stim[18] = 38'h1830e3f369;
    stim[19] = 38'h0542efcfbb;
    stim[20] = 38'h355d345db7;
    stim[21] = 38'h1a87fd49d8;
    stim[22] = 38'h1903b5e5bf;
    stim[23] = 38'h2c3ed6741e;
    stim[24] = 38'h13047e06f9;
    stim[25] = 38'h07824c9bcf;
    stim[26] = 38'h3f03831938;
    stim[27] = 38'h360a20fee1;
    stim[28] = 38'h06fca77044;
    stim[29] = 38'h190424e1d7;
    stim[30] = 38'h373e2f7684;
    stim[31] = 38'h3f1145e59f;
    stim[32] = 38'h237331f948;
    stim[33] = 38'h060e31e3ae;
    stim[34] = 38'h2393f45bb2;
    stim[35] = 38'h2eb9a004ab;
    stim[36] = 38'h060dfab5f1;
    stim[37] = 38'h21c7598cae;
    stim[38] = 38'h191b0d4686;
    stim[39] = 38'h230283afb6;
    stim[40] = 38'h38b836e89a;
    stim[41] = 38'h11475d307a;
    stim[42] = 38'h1c115afde6;
    stim[43] = 38'h33b233795d;
    stim[44] = 38'h29d78c5144;
    stim[45] = 38'h3609a0145c;
    stim[46] = 38'h3c1d10015d;
    stim[47] = 38'h2529f5ee28;
    stim[48] = 38'h2b5831abd1;
    stim[49] = 38'h2c7ab2e4c2;
    stim[50] = 38'h2bbfde4163;
    stim[51] = 38'h025bc5ee19;
    stim[52] = 38'h18eafc6949;
    stim[53] = 38'h05b3d1fd15;
    stim[54] = 38'h30320a5c3c;
    stim[55] = 38'h301031e2b9;
    stim[56] = 38'h2bd6db6ba8;
    stim[57] = 38'h1e91468f8c;
    stim[58] = 38'h27f6289dc1;
    stim[59] = 38'h3f6785d922;
    stim[60] = 38'h3ae30f11af;
    stim[61] = 38'h2dae18f687;
    stim[62] = 38'h142e856502;
    stim[63] = 38'h3744e2ee0e;
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
      expv[0] = 18'h0e644;
      expv[1] = 18'h3fffd;
      expv[2] = 18'h3fffd;
      expv[3] = 18'h27e8d;
      expv[4] = 18'h1f648;
      expv[5] = 18'h1be60;
      expv[6] = 18'h1117c;
      expv[7] = 18'h00004;
      expv[8] = 18'h00002;
      expv[9] = 18'h34b09;
      expv[10] = 18'h0b5ac;
      expv[11] = 18'h307c9;
      expv[12] = 18'h3860d;
      expv[13] = 18'h32c8d;
      expv[14] = 18'h03e58;
      expv[15] = 18'h1f204;
      expv[16] = 18'h00002;
      expv[17] = 18'h3c6ad;
      expv[18] = 18'h00002;
      expv[19] = 18'h00002;
      expv[20] = 18'h345d9;
      expv[21] = 18'h25781;
      expv[22] = 18'h3fffd;
      expv[23] = 18'h13c10;
      expv[24] = 18'h3fffd;
      expv[25] = 18'h387d9;
      expv[26] = 18'h00002;
      expv[27] = 18'h1f010;
      expv[28] = 18'h008c8;
      expv[29] = 18'h3de61;
      expv[30] = 18'h10080;
      expv[31] = 18'h3f115;
      expv[32] = 18'h23731;
      expv[33] = 18'h3fffd;
      expv[34] = 18'h345b9;
      expv[35] = 18'h00004;
      expv[36] = 18'h3fffd;
      expv[37] = 18'h3fffd;
      expv[38] = 18'h0bd44;
      expv[39] = 18'h3c505;
      expv[40] = 18'h07478;
      expv[41] = 18'h3fffd;
      expv[42] = 18'h2501d;
      expv[43] = 18'h3fffd;
      expv[44] = 18'h21869;
      expv[45] = 18'h00002;
      expv[46] = 18'h3fffd;
      expv[47] = 18'h3fffd;
      expv[48] = 18'h2f5c1;
      expv[49] = 18'h1f5f4;
      expv[50] = 18'h21bed;
      expv[51] = 18'h025bc;
      expv[52] = 18'h27151;
      expv[53] = 18'h15ffc;
      expv[54] = 18'h00002;
      expv[55] = 18'h3fffd;
      expv[56] = 18'h3fffd;
      expv[57] = 18'h00002;
      expv[58] = 18'h1f6bc;
      expv[59] = 18'h05d8c;
      expv[60] = 18'h00002;
      expv[61] = 18'h2b489;
      expv[62] = 18'h19938;
      expv[63] = 18'h3744d;
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
