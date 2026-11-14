// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118320 dut (
    .clk(clk),
    .rst(in_vec[70:70]),
    .is_branch_ex(in_vec[69:69]),
    .cmp_out_ex(in_vec[68:68]),
    .loc_predict_taken_if(in_vec[67:67]),
    .glob_predict_taken_if(in_vec[66:66]),
    .loc_predict_taken_ex(in_vec[65:65]),
    .glob_predict_taken_ex(in_vec[64:64]),
    .pc_if(in_vec[63:32]),
    .pc_ex(in_vec[31:0]),
    .valid_branch(out_vec[1:1]),
    .predict_taken(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h657fe37cb0c4a42c19;
    stim[1] = 71'h724a4986e4c52f4b1d;
    stim[2] = 71'h13441e0f16823f124d;
    stim[3] = 71'h0dfbe6f3c993f75c62;
    stim[4] = 71'h33e64a6859296637ed;
    stim[5] = 71'h12e5e6484101849361;
    stim[6] = 71'h194d06aa831921e297;
    stim[7] = 71'h38b9f2e81e1d3bbfb3;
    stim[8] = 71'h0a8e4854f7a6e4167d;
    stim[9] = 71'h3c9741d7b96b2daff2;
    stim[10] = 71'h143e5fcafc2a3d053b;
    stim[11] = 71'h033252028484a53894;
    stim[12] = 71'h1d1ff6141f0d46ad1f;
    stim[13] = 71'h107748ad06f196d707;
    stim[14] = 71'h2c06122408ff1b8c6b;
    stim[15] = 71'h716e57e521093050a4;
    stim[16] = 71'h3c7f785828bdd72eb5;
    stim[17] = 71'h376c00a4a32a6c1a95;
    stim[18] = 71'h1af096d0ce53fab4ab;
    stim[19] = 71'h008af46f93bbf2026a;
    stim[20] = 71'h370e2129fddda1b6f1;
    stim[21] = 71'h104dd91dadd93aef02;
    stim[22] = 71'h18ddb8c575907db84c;
    stim[23] = 71'h205b5278667cba3c17;
    stim[24] = 71'h0611051beba491245f;
    stim[25] = 71'h37b55a1550c96837cd;
    stim[26] = 71'h013de85ba2363cb6f8;
    stim[27] = 71'h188677cea76b20f907;
    stim[28] = 71'h2da3bbf1d2c9d8d4a2;
    stim[29] = 71'h1e30fcbd5f94319b4a;
    stim[30] = 71'h2617b5adaae32abf64;
    stim[31] = 71'h1555cfbeeaa4fb9ef7;
    stim[32] = 71'h19fd310ac613352f61;
    stim[33] = 71'h05174c2a7ea77d6551;
    stim[34] = 71'h24fc07d1368f6a1efe;
    stim[35] = 71'h1b85b878f4aff61983;
    stim[36] = 71'h35fe41f44e56216ba5;
    stim[37] = 71'h269b07b7e55beef485;
    stim[38] = 71'h2ca0b378f56886088f;
    stim[39] = 71'h316588790063f4bb3e;
    stim[40] = 71'h073b37232bc539710a;
    stim[41] = 71'h2ae4b9b65c29dd5630;
    stim[42] = 71'h2c8424fc044bb3055f;
    stim[43] = 71'h3100163964684d5932;
    stim[44] = 71'h614145becf73fc2e24;
    stim[45] = 71'h0f997ccefceec324ad;
    stim[46] = 71'h3eba8595a8175d7ef4;
    stim[47] = 71'h39e2904d2146b3aa82;
    stim[48] = 71'h2a54624b0d59484188;
    stim[49] = 71'h29c64fbcc3ad51fa11;
    stim[50] = 71'h23d4fdb4a9a6c67d5f;
    stim[51] = 71'h1f3767dc1be3c1280d;
    stim[52] = 71'h3d02a1ab91c6b4e305;
    stim[53] = 71'h1de44c21e131ded70b;
    stim[54] = 71'h035c35d4791869538a;
    stim[55] = 71'h3bc0cce5e9f66cefcf;
    stim[56] = 71'h1efe0683e08fd1f0a7;
    stim[57] = 71'h221aa0dda714858487;
    stim[58] = 71'h3b33ea3dc732d0677d;
    stim[59] = 71'h32ec181867de4ea3d4;
    stim[60] = 71'h32dc869a45f5525bba;
    stim[61] = 71'h13ecd10c11817947f8;
    stim[62] = 71'h1c9ed23ed524f5d590;
    stim[63] = 71'h2ee409a5a1f30e3e07;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h1;
      expv[13] = 2'h0;
      expv[14] = 2'h1;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h0;
      expv[18] = 2'h1;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h1;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h1;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h1;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h1;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h0;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h0;
      expv[58] = 2'h1;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
