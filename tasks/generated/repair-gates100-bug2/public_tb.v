// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h5ddda6e9697b7ff3c79c12991;
    stim[1] = 100'h8a431000713abf57d1731f063;
    stim[2] = 100'h20a3c806dc0307ad4805e4a0d;
    stim[3] = 100'hef39ab6cb29239ea12d3de58b;
    stim[4] = 100'h11db044d3b711d3e28131de36;
    stim[5] = 100'hc30c09289c424d4684d537b9e;
    stim[6] = 100'hdbda95b7968a8066691313239;
    stim[7] = 100'h887340bf61d1d2cfc30eb9d9c;
    stim[8] = 100'hd34654d4a981e5b73ee8c22dc;
    stim[9] = 100'hb67145ac46f610f2c470f85e0;
    stim[10] = 100'h4efd9e9de7276fdf0d14d17ed;
    stim[11] = 100'hac7342dcfeca4388d3ed1066c;
    stim[12] = 100'hc8052fca944baa4265819405f;
    stim[13] = 100'hebf91be236738cb0c8fb0b6f2;
    stim[14] = 100'h51ba20c50e90015d81c9e2952;
    stim[15] = 100'h47f10a9303070ecaca787c550;
    stim[16] = 100'h14dd512249437db18e46a4e23;
    stim[17] = 100'h0a2c1f6ab2d12a9e5bf3cda9f;
    stim[18] = 100'h1a609d2db2fa51d1ab0306c4f;
    stim[19] = 100'hc3d5515a88690d1045050cc4e;
    stim[20] = 100'h5b206c6e4872b9938d4cd4267;
    stim[21] = 100'h84e101ad99fc1491e423c7658;
    stim[22] = 100'h2be13abb899eb3a57edd1bed6;
    stim[23] = 100'h7191b8e28aa04f0c4e34c87d2;
    stim[24] = 100'hcf0dfae26addfe3b584ab5a5c;
    stim[25] = 100'hbf3ae6cd138eec6f4d612aaca;
    stim[26] = 100'hc49779cf629afca2f1c23f20f;
    stim[27] = 100'h1deab2888ead89db1fae43aea;
    stim[28] = 100'h9655d25841d8d36169bb02a9b;
    stim[29] = 100'h7ffb824175a66780ab601b276;
    stim[30] = 100'h052a5a0c6b11c0e3a608499a0;
    stim[31] = 100'h0791e716e99d6e746ad67e265;
    stim[32] = 100'hbdbae5b87a24f83c22d5834f6;
    stim[33] = 100'h6d75704e10bfec3e6624ee29b;
    stim[34] = 100'hbc98bda1d159b1562f9b3a33b;
    stim[35] = 100'h974d792c78653b8c4c6102184;
    stim[36] = 100'h6efd9e410d82d3be5ea4f8e52;
    stim[37] = 100'h21080d8fc9d27bd2324465a34;
    stim[38] = 100'h8993d9c8aa97ea723f80745b8;
    stim[39] = 100'hbc36b87736232516825eef8d4;
    stim[40] = 100'h7fe8cffe6431fc6ea0014c956;
    stim[41] = 100'h961e623734ba37a376a97a137;
    stim[42] = 100'h7f65f70c03faea4c37c90d7a5;
    stim[43] = 100'hb45e00b6167d62719c02f5813;
    stim[44] = 100'haf2e7889babf0e4f996f5536b;
    stim[45] = 100'h1fce6bf988ac4b7d2b1168abc;
    stim[46] = 100'h998f7332b78a980f4618a684a;
    stim[47] = 100'ha116da5a606f1bcc4a750ae30;
    stim[48] = 100'h256d0de90bdeef62d9a2d7ab4;
    stim[49] = 100'hc500cae058887f92e74a7a860;
    stim[50] = 100'h14167eb5db106f321add7a513;
    stim[51] = 100'h58b0111abe1e684892e8684bf;
    stim[52] = 100'hb9bff0cf1ed07b708cce92eb4;
    stim[53] = 100'hb7f1a740ed1913f6bee47fafd;
    stim[54] = 100'hb64d9dcff2f96ada34e2f2b39;
    stim[55] = 100'ha7be706eaf045e734f2686e1e;
    stim[56] = 100'h47a83f1f96e3e2794309397ba;
    stim[57] = 100'hb23716f20c7b61d57a3e48407;
    stim[58] = 100'h4514275cea53266b1fe7f3251;
    stim[59] = 100'ha4b9a928693fad6bd8726560c;
    stim[60] = 100'ha85b9007ba41a9503d63f3b0f;
    stim[61] = 100'h723f8be0fc71b4dc56d986ace;
    stim[62] = 100'haac82045017245541e128ae3a;
    stim[63] = 100'ha8cef2535fae874185392aca1;
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
      expv[0] = 3'h1;
      expv[1] = 3'h1;
      expv[2] = 3'h0;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h0;
      expv[7] = 3'h1;
      expv[8] = 3'h0;
      expv[9] = 3'h1;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h0;
      expv[16] = 3'h1;
      expv[17] = 3'h0;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h0;
      expv[22] = 3'h1;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h1;
      expv[26] = 3'h0;
      expv[27] = 3'h1;
      expv[28] = 3'h1;
      expv[29] = 3'h0;
      expv[30] = 3'h1;
      expv[31] = 3'h0;
      expv[32] = 3'h1;
      expv[33] = 3'h1;
      expv[34] = 3'h0;
      expv[35] = 3'h1;
      expv[36] = 3'h0;
      expv[37] = 3'h1;
      expv[38] = 3'h0;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h1;
      expv[44] = 3'h0;
      expv[45] = 3'h1;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h1;
      expv[54] = 3'h1;
      expv[55] = 3'h0;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h1;
      expv[62] = 3'h0;
      expv[63] = 3'h1;
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
