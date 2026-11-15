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

  rtlpp_09569 dut (
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
    stim[0] = 70'h345e39794ebd69a9d3;
    stim[1] = 70'h27f8732df211a5cd69;
    stim[2] = 70'h10fae07ef4b9984474;
    stim[3] = 70'h086ca0afd2ee20cf5f;
    stim[4] = 70'h10d8c03466c9e6f3f0;
    stim[5] = 70'h03e473e2d7ef284f6f;
    stim[6] = 70'h0689c7534e1e84d182;
    stim[7] = 70'h0d8932245facdec3e1;
    stim[8] = 70'h07c18a775bdbedc4a9;
    stim[9] = 70'h15c9c58729fce7923c;
    stim[10] = 70'h1c2a679f1ee40e79a1;
    stim[11] = 70'h004b1a1b6913177ddd;
    stim[12] = 70'h033de4403daafd9d0e;
    stim[13] = 70'h096e88ce11f65bcfd5;
    stim[14] = 70'h0b6b1e0b65b3d9adee;
    stim[15] = 70'h0997492ccd4532a1a3;
    stim[16] = 70'h046c3daf2f568b941f;
    stim[17] = 70'h15600a308250f0cb7d;
    stim[18] = 70'h34611a3e8fa3a1efd2;
    stim[19] = 70'h0c3a659a8932832693;
    stim[20] = 70'h0a2eb94f210d142e50;
    stim[21] = 70'h1f637fa0b7394a9c8c;
    stim[22] = 70'h194f3593cb26479f46;
    stim[23] = 70'h05cc466fbd8ddd88b1;
    stim[24] = 70'h1f912c20f6a1bc5e18;
    stim[25] = 70'h15f0ba2532652e04cd;
    stim[26] = 70'h030ae7cb52bac87233;
    stim[27] = 70'h020bf08d117482cd19;
    stim[28] = 70'h15b05814b7f1634fa1;
    stim[29] = 70'h13d1d934881820dcbe;
    stim[30] = 70'h113f809da8affca828;
    stim[31] = 70'h1b9ac79561282f4a44;
    stim[32] = 70'h16be59322173d4bb3e;
    stim[33] = 70'h0ed32c9ea35e575ddf;
    stim[34] = 70'h115f438e8f88b312ec;
    stim[35] = 70'h04bfae28d82412719b;
    stim[36] = 70'h082bfee39d74545670;
    stim[37] = 70'h032493702af14ee5f9;
    stim[38] = 70'h10d52400b001655309;
    stim[39] = 70'h0c47010361ccef2e8d;
    stim[40] = 70'h28d5ab088a85a2c3a3;
    stim[41] = 70'h14679e402761182ff6;
    stim[42] = 70'h14414944c510513384;
    stim[43] = 70'h0a38ac281defd0e448;
    stim[44] = 70'h1ab1c07f74ac27b96c;
    stim[45] = 70'h1f78dc707e2620fea8;
    stim[46] = 70'h1bc7c726970a2b24fb;
    stim[47] = 70'h05a2da29103e66be76;
    stim[48] = 70'h099f17570e4cda1c94;
    stim[49] = 70'h12bc05228fa5fd4103;
    stim[50] = 70'h056aefc61e7fef8bfd;
    stim[51] = 70'h1d02d0223c565af205;
    stim[52] = 70'h00b7efa6016087425a;
    stim[53] = 70'h02df4f7b082557e535;
    stim[54] = 70'h1c861708aeac6efb45;
    stim[55] = 70'h114365fa15366f3564;
    stim[56] = 70'h07c1aa3483aab46c9d;
    stim[57] = 70'h1c1e2844ace4d0c9d6;
    stim[58] = 70'h0db7901ee78da546d1;
    stim[59] = 70'h1457955946f9bd5072;
    stim[60] = 70'h101620123c1cd83269;
    stim[61] = 70'h1dcb23a7288182d4b4;
    stim[62] = 70'h162e446c98e83aaa82;
    stim[63] = 70'h1b2c028b305a7fc256;
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
      expv[0] = 33'h0bd69a9d2;
      expv[1] = 33'h011a5cd68;
      expv[2] = 33'h0b9984474;
      expv[3] = 33'h0ee20cf5e;
      expv[4] = 33'h0c9e6f3f0;
      expv[5] = 33'h1ef284f6e;
      expv[6] = 33'h01e84d182;
      expv[7] = 33'h1acdec3e0;
      expv[8] = 33'h1dbedc4a8;
      expv[9] = 33'h1fce7923d;
      expv[10] = 33'h0e40e79a0;
      expv[11] = 33'h113177ddc;
      expv[12] = 33'h1aafd9d0e;
      expv[13] = 33'h1f65bcfd4;
      expv[14] = 33'h1b3d9adee;
      expv[15] = 33'h14532a1a2;
      expv[16] = 33'h1568b941e;
      expv[17] = 33'h050f0cb7c;
      expv[18] = 33'h1a3a1efd2;
      expv[19] = 33'h132832692;
      expv[20] = 33'h10d142e50;
      expv[21] = 33'h1394a9c8c;
      expv[22] = 33'h126479f46;
      expv[23] = 33'h18ddd88b0;
      expv[24] = 33'h0a1bc5e18;
      expv[25] = 33'h0652e04cc;
      expv[26] = 33'h0bac87232;
      expv[27] = 33'h17482cd18;
      expv[28] = 33'h1f1634fa0;
      expv[29] = 33'h01820dcbf;
      expv[30] = 33'h0affca829;
      expv[31] = 33'h1282f4a45;
      expv[32] = 33'h173d4bb3f;
      expv[33] = 33'h15e575dde;
      expv[34] = 33'h188b312ec;
      expv[35] = 33'h02412719a;
      expv[36] = 33'h174545670;
      expv[37] = 33'h0f14ee5f8;
      expv[38] = 33'h001655308;
      expv[39] = 33'h1ccef2e8c;
      expv[40] = 33'h085a2c3a2;
      expv[41] = 33'h161182ff6;
      expv[42] = 33'h110513384;
      expv[43] = 33'h1efd0e448;
      expv[44] = 33'h0ac27b96c;
      expv[45] = 33'h02620fea8;
      expv[46] = 33'h10a2b24fa;
      expv[47] = 33'h03e66be76;
      expv[48] = 33'h04cda1c94;
      expv[49] = 33'h1a5fd4102;
      expv[50] = 33'h07fef8bfc;
      expv[51] = 33'h0565af204;
      expv[52] = 33'h16087425a;
      expv[53] = 33'h02557e534;
      expv[54] = 33'h0ac6efb44;
      expv[55] = 33'h1366f3564;
      expv[56] = 33'h1aab46c9c;
      expv[57] = 33'h0e4d0c9d6;
      expv[58] = 33'h18da546d0;
      expv[59] = 33'h0f9bd5072;
      expv[60] = 33'h01cd83268;
      expv[61] = 33'h08182d4b5;
      expv[62] = 33'h0e83aaa83;
      expv[63] = 33'h05a7fc257;
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
