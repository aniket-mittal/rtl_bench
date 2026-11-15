// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004001 dut (
    .clk(clk),
    .GATE(in_vec[128:128]),
    .A(in_vec[127:96]),
    .D(in_vec[95:64]),
    .S(in_vec[63:32]),
    .R(in_vec[31:0]),
    .sout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1bf35cea8fb8bed883f15b6a69ce6b6bb;
    stim[1] = 129'h0536680e625f9bb586641da6abaaefd2d;
    stim[2] = 129'h165746cd7d377b63dbd049a7c7b07807c;
    stim[3] = 129'h171d36d2b5d9147d0fe5ca955f3787e9a;
    stim[4] = 129'h12f3bba9d81cb9114fa3dae14a58089ab;
    stim[5] = 129'h11d08d8ea53a73c8f38b95341c2858a10;
    stim[6] = 129'h098299fdca49e747b2ee62d990208306e;
    stim[7] = 129'h08cbbc9e1eabb4194b734694428960fec;
    stim[8] = 129'h0e76314fbc74a1f9ddb4c503fdfa00268;
    stim[9] = 129'h1afcd28a6d5af4a45b96894da6bf57fe7;
    stim[10] = 129'h190e15d07cc92149ac81327648db99a57;
    stim[11] = 129'h1d96200d7513cd0883c389885eb19b53d;
    stim[12] = 129'h00410d5b964e5802ecad20f326a2431f8;
    stim[13] = 129'h154d707e4196e405a0ffe37d2e752b93f;
    stim[14] = 129'h197e457fb0823c01d21d49911aa7774a7;
    stim[15] = 129'h15c2e6d9cd3b62a59c0203c315f9ddce1;
    stim[16] = 129'h0e84af51d249d782e2571c8896594e3a9;
    stim[17] = 129'h0d2ff902c2c40964ed596f32b31caa7ac;
    stim[18] = 129'h1ea1e68f316d04258a53a72e418462e24;
    stim[19] = 129'h1e2c4f9c020db65b765be51b5f7eed6e5;
    stim[20] = 129'h007e375fd891420ffb19c0b9e85e73787;
    stim[21] = 129'h16781bc7d11c2ee4c3d1a8af0be2334f4;
    stim[22] = 129'h062bb8d65949837ce471da8609d2f7794;
    stim[23] = 129'h02941e96a1cf6ef61845583294b1e08be;
    stim[24] = 129'h10b30c7b089f9bff3ace483694680b01f;
    stim[25] = 129'h06a16f93b98e6a881f01eb542be768705;
    stim[26] = 129'h02f2f8b562513f1a4a3b5e6d37af49c7b;
    stim[27] = 129'h1c91ed0dedea34a7202ecd7cdb6c08e1b;
    stim[28] = 129'h104950acd5c15d76a5acb00742b841746;
    stim[29] = 129'h1a506a48cbb98fe3a73146948caeb58a5;
    stim[30] = 129'h06cc47867ec9d77eec7a0afc119aba619;
    stim[31] = 129'h1daa4858776f39499063020def528272c;
    stim[32] = 129'h15c9c1ed3977c36e06ad149e583c59685;
    stim[33] = 129'h1f78112a84c9481103e6f1fede1375f48;
    stim[34] = 129'h1bb90e2b2f8c93b7c45f33ec7008d231f;
    stim[35] = 129'h1538bf19fbfbe84eaf7db659628bb183c;
    stim[36] = 129'h150e10e2e135b908d9c2b9ef25244d002;
    stim[37] = 129'h00a9087c8dd5bd75ef1ef9ee0b6d64cfa;
    stim[38] = 129'h0a15b5cba5833e994d190615a3e752d48;
    stim[39] = 129'h0b4ef9420bd79634ab4482f9133497a28;
    stim[40] = 129'h1dec8b7a50a6c566a112a7ddd2e0c3f86;
    stim[41] = 129'h08b5768cb94eecb7490ef8cdbf39e14f8;
    stim[42] = 129'h0031c1c2b01dc6d6dbc547a8251acb84d;
    stim[43] = 129'h0cb0dbacc304e311bc72deb55f9f05051;
    stim[44] = 129'h056d0df9dda05554f72047392248e17a2;
    stim[45] = 129'h0c80f0ff6eeca2bd483226e1a8fd485a1;
    stim[46] = 129'h13f944040196d0caf583f03e76f04a58c;
    stim[47] = 129'h161f23b71c334da4703d98af12b68b45a;
    stim[48] = 129'h03148f139bee47a301e1384f4321d28ee;
    stim[49] = 129'h0e4202bc9fbb1ab6e10efafbda321de8e;
    stim[50] = 129'h005f48b664b8c0a84715e0618617c9bc6;
    stim[51] = 129'h0fd0a76aa27ddefad1a2abcc6cd4783d5;
    stim[52] = 129'h081a66fa23f401bbcbe634dc537a864dc;
    stim[53] = 129'h1766f8b572ecf54f6f83a53ed60996104;
    stim[54] = 129'h114a04cc93eb545766953e5cdc904dc37;
    stim[55] = 129'h1f1dae1a8aefda3ff5130a7676335e164;
    stim[56] = 129'h01e9b798adcd7903d23e4460e1e588ac7;
    stim[57] = 129'h1f56e56c54b09b1d2980cc378d23e89c3;
    stim[58] = 129'h01375b56da39f05c48e31e6d7016818f8;
    stim[59] = 129'h01ebf8e6631145fa22307aa8c5b7f7771;
    stim[60] = 129'h181ec046538a2b0ca2f154bb86f4fb29b;
    stim[61] = 129'h09a878e73dddae3cf071c6d6fc94d7170;
    stim[62] = 129'h0426e9980e6de5e99c37b667f816d0054;
    stim[63] = 129'h0b1ee8d446e278efb9b6b400eca3e965f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h71d36d2b;
      expv[5] = 32'ha10f27c8;
      expv[6] = 32'hbe1800b2;
      expv[7] = 32'hbe1800b2;
      expv[8] = 32'h9581f0c6;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h90e15d07;
      expv[12] = 32'hffffffff;
      expv[13] = 32'hffffffff;
      expv[14] = 32'h00000000;
      expv[15] = 32'h97e457fb;
      expv[16] = 32'hf412c597;
      expv[17] = 32'hf412c597;
      expv[18] = 32'hc2481deb;
      expv[19] = 32'h00000000;
      expv[20] = 32'he2c4f9c0;
      expv[21] = 32'he2c4f9c0;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h04950acd;
      expv[30] = 32'ha99baf59;
      expv[31] = 32'ha99baf59;
      expv[32] = 32'h00000000;
      expv[33] = 32'h5c9c1ed3;
      expv[34] = 32'hffffffff;
      expv[35] = 32'h45f33ec7;
      expv[36] = 32'hf7db6596;
      expv[37] = 32'he47fd509;
      expv[38] = 32'he47fd509;
      expv[39] = 32'ha60aa7c1;
      expv[40] = 32'h72c12d99;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h61f23b71;
      expv[49] = 32'h61f23b71;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h14a04cc9;
      expv[56] = 32'hffffffff;
      expv[57] = 32'hffffffff;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
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
