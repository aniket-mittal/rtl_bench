// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09582 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h307970203420db3d79;
    stim[1] = 70'h376399f4019b728ea3;
    stim[2] = 70'h0bcfb73d46fcd41699;
    stim[3] = 70'h0391dc9e3c83a808d1;
    stim[4] = 70'h17c871d6141ecdcd3a;
    stim[5] = 70'h10da9d050dfe34cfe5;
    stim[6] = 70'h04644393170ec2703f;
    stim[7] = 70'h0a0257d7add5c4bd69;
    stim[8] = 70'h107f675a388621ecf8;
    stim[9] = 70'h0b3a13076f5f47c52e;
    stim[10] = 70'h11945600c3143c8c98;
    stim[11] = 70'h1298fdcd09794fc6ac;
    stim[12] = 70'h0284a1416daffc4e55;
    stim[13] = 70'h16cf466864560dca05;
    stim[14] = 70'h1d0e9c213837041aad;
    stim[15] = 70'h03b935147d2f53c56f;
    stim[16] = 70'h1a0099126d177b9a3c;
    stim[17] = 70'h36686a16c357435ba2;
    stim[18] = 70'h06b9a9ec9ff3baab06;
    stim[19] = 70'h152e8d2325bab97db0;
    stim[20] = 70'h13fff5aa047ffad76b;
    stim[21] = 70'h08c6fd42205ff4715a;
    stim[22] = 70'h037264d32ba12972b5;
    stim[23] = 70'h0696fe74d8b368af57;
    stim[24] = 70'h03a76dfe320a0bb4ec;
    stim[25] = 70'h0149427f9cc8e4d250;
    stim[26] = 70'h1b9872b91c3fd26b6f;
    stim[27] = 70'h1944929aa3573614b5;
    stim[28] = 70'h02b5e714222a9a97e2;
    stim[29] = 70'h057b5243b707f99d9c;
    stim[30] = 70'h116b78abc78e6d41cf;
    stim[31] = 70'h0ba6c45a663f0f129f;
    stim[32] = 70'h006f81db7333d74d29;
    stim[33] = 70'h17924e9e4e26299e82;
    stim[34] = 70'h1506b2c68adbea4584;
    stim[35] = 70'h03cfbdd4ebedf48320;
    stim[36] = 70'h0bbcc769518b61c1c1;
    stim[37] = 70'h0b11d634bb5f17695a;
    stim[38] = 70'h160805ce96cf761882;
    stim[39] = 70'h08c65d58cf282e6ee8;
    stim[40] = 70'h12e62dd56bbf37e3d0;
    stim[41] = 70'h138ae51f0493ea460f;
    stim[42] = 70'h1efb05f8311bc6ed96;
    stim[43] = 70'h040e24953b1ba47784;
    stim[44] = 70'h0203c9d65d3b9edb46;
    stim[45] = 70'h00568fa82b2f876d35;
    stim[46] = 70'h03153f0b80358482e3;
    stim[47] = 70'h0c9f43849a8ed4f1ee;
    stim[48] = 70'h08f17266505929a3f4;
    stim[49] = 70'h0314a16cd3a9b2edc3;
    stim[50] = 70'h0c0ad23dcf448eb69f;
    stim[51] = 70'h16ad103e31e4ab01cb;
    stim[52] = 70'h025726e100dc73cdcf;
    stim[53] = 70'h13c9159edd604cb161;
    stim[54] = 70'h1c944fcd83cb125c5e;
    stim[55] = 70'h1b295c2453e3d177e5;
    stim[56] = 70'h17b9b5c480473740ef;
    stim[57] = 70'h1cf47075db5df7c059;
    stim[58] = 70'h05faa6e5eac476efdb;
    stim[59] = 70'h0297dec9001fdd7b8a;
    stim[60] = 70'h11e079a2fc82babd21;
    stim[61] = 70'h17fd74cd83010cf0e2;
    stim[62] = 70'h0e8294a3cbcacf26e6;
    stim[63] = 70'h1b4e7079c447d843b4;
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
      expv[0] = 33'h020db3d78;
      expv[1] = 33'h19b728ea2;
      expv[2] = 33'h0fcd41698;
      expv[3] = 33'h083a808d0;
      expv[4] = 33'h01ecdcd3a;
      expv[5] = 33'h1fe34cfe4;
      expv[6] = 33'h10ec2703e;
      expv[7] = 33'h1d5c4bd68;
      expv[8] = 33'h08621ecf9;
      expv[9] = 33'h15f47c52e;
      expv[10] = 33'h1143c8c98;
      expv[11] = 33'h1794fc6ad;
      expv[12] = 33'h1affc4e54;
      expv[13] = 33'h0560dca04;
      expv[14] = 33'h037041aac;
      expv[15] = 33'h12f53c56e;
      expv[16] = 33'h1177b9a3c;
      expv[17] = 33'h157435ba2;
      expv[18] = 33'h1f3baab06;
      expv[19] = 33'h1bab97db0;
      expv[20] = 33'h07ffad76a;
      expv[21] = 33'h05ff4715a;
      expv[22] = 33'h1a12972b4;
      expv[23] = 33'h0b368af56;
      expv[24] = 33'h00a0bb4ec;
      expv[25] = 33'h0c8e4d250;
      expv[26] = 33'h03fd26b6e;
      expv[27] = 33'h1573614b4;
      expv[28] = 33'h02a9a97e2;
      expv[29] = 33'h107f99d9c;
      expv[30] = 33'h18e6d41ce;
      expv[31] = 33'h03f0f129e;
      expv[32] = 33'h133d74d28;
      expv[33] = 33'h026299e82;
      expv[34] = 33'h0dbea4584;
      expv[35] = 33'h1edf48320;
      expv[36] = 33'h18b61c1c0;
      expv[37] = 33'h15f17695a;
      expv[38] = 33'h0cf761882;
      expv[39] = 33'h1282e6ee8;
      expv[40] = 33'h1bf37e3d0;
      expv[41] = 33'h093ea460e;
      expv[42] = 33'h11bc6ed97;
      expv[43] = 33'h11ba47784;
      expv[44] = 33'h13b9edb46;
      expv[45] = 33'h12f876d34;
      expv[46] = 33'h0358482e2;
      expv[47] = 33'h08ed4f1ee;
      expv[48] = 33'h05929a3f4;
      expv[49] = 33'h1a9b2edc2;
      expv[50] = 33'h1448eb69e;
      expv[51] = 33'h1e4ab01ca;
      expv[52] = 33'h0dc73cdce;
      expv[53] = 33'h1604cb160;
      expv[54] = 33'h1cb125c5e;
      expv[55] = 33'h1e3d177e4;
      expv[56] = 33'h0473740ee;
      expv[57] = 33'h15df7c058;
      expv[58] = 33'h0c476efda;
      expv[59] = 33'h01fdd7b8a;
      expv[60] = 33'h082babd20;
      expv[61] = 33'h1010cf0e2;
      expv[62] = 33'h1cacf26e6;
      expv[63] = 33'h047d843b4;
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
