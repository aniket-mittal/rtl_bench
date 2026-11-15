// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133025 dut (
    .data_in(in_vec[37:6]),
    .shift_amount(in_vec[5:1]),
    .direction(in_vec[0:0]),
    .upper_byte(out_vec[63:56]),
    .lower_byte(out_vec[55:48]),
    .reversed_bytes(out_vec[47:16]),
    .sum_output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h04bb1834c9;
    stim[1] = 38'h08d0b38450;
    stim[2] = 38'h053d74f45a;
    stim[3] = 38'h1a988036d9;
    stim[4] = 38'h01275c0c5f;
    stim[5] = 38'h1d7ca99cd1;
    stim[6] = 38'h207459c047;
    stim[7] = 38'h011e328bb3;
    stim[8] = 38'h23b310080b;
    stim[9] = 38'h1e1934ff2b;
    stim[10] = 38'h1209f0a7a9;
    stim[11] = 38'h1292e54efa;
    stim[12] = 38'h3ebf04d755;
    stim[13] = 38'h1db80a087e;
    stim[14] = 38'h27cb8e1512;
    stim[15] = 38'h27c760a9c9;
    stim[16] = 38'h0ad5373872;
    stim[17] = 38'h1f0252beef;
    stim[18] = 38'h2e167b359e;
    stim[19] = 38'h00f6d7ecf8;
    stim[20] = 38'h3b0427a2e0;
    stim[21] = 38'h30ea5d6cfe;
    stim[22] = 38'h236f0b59d9;
    stim[23] = 38'h15dac15dc9;
    stim[24] = 38'h00c3f672e6;
    stim[25] = 38'h174fb4f12f;
    stim[26] = 38'h1026ea2138;
    stim[27] = 38'h3b32db8c22;
    stim[28] = 38'h1f210ea126;
    stim[29] = 38'h2443f0c49e;
    stim[30] = 38'h29f226462d;
    stim[31] = 38'h3f7f9a5407;
    stim[32] = 38'h213b247c39;
    stim[33] = 38'h199d07320a;
    stim[34] = 38'h31766bb9db;
    stim[35] = 38'h1f6a26433a;
    stim[36] = 38'h024ddc2a57;
    stim[37] = 38'h1c662b2ee4;
    stim[38] = 38'h335aec6c72;
    stim[39] = 38'h30a1e20243;
    stim[40] = 38'h0ce43c4fe0;
    stim[41] = 38'h357550cbab;
    stim[42] = 38'h0190e67aca;
    stim[43] = 38'h05af9a8277;
    stim[44] = 38'h37d9c3eeb2;
    stim[45] = 38'h229e386200;
    stim[46] = 38'h37302f6dd5;
    stim[47] = 38'h25a8d60998;
    stim[48] = 38'h12b3b922d1;
    stim[49] = 38'h337e366d62;
    stim[50] = 38'h0341c12616;
    stim[51] = 38'h1eb4e7e28e;
    stim[52] = 38'h35f406728a;
    stim[53] = 38'h3254409ebc;
    stim[54] = 38'h0e1914595f;
    stim[55] = 38'h287e2af0b7;
    stim[56] = 38'h0443771696;
    stim[57] = 38'h16385f3a58;
    stim[58] = 38'h2de79f6ec0;
    stim[59] = 38'h1907b41d93;
    stim[60] = 38'h0a64648ad1;
    stim[61] = 38'h008a12f57b;
    stim[62] = 38'h2f5967ffc6;
    stim[63] = 38'h0bc8137f10;
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
      expv[0] = 64'hc60d0dc62e0100d3;
      expv[1] = 64'h11000011ce420011;
      expv[2] = 64'h200000207aba0020;
      expv[3] = 64'ha62020a6060000c6;
      expv[4] = 64'h093a3a0900000043;
      expv[5] = 64'hf2a6a6f275000198;
      expv[6] = 64'h2ce0e02c3a10010c;
      expv[7] = 64'h0002020000000002;
      expv[8] = 64'h6201016276040063;
      expv[9] = 64'h03c3c303000000c6;
      expv[10] = 64'h0482820400000086;
      expv[11] = 64'h0000000000600000;
      expv[12] = 64'hbf0404bf3e0000c3;
      expv[13] = 64'h0000000000800000;
      expv[14] = 64'ha80000a8705c00a8;
      expv[15] = 64'hd82a2ad8f1090102;
      expv[16] = 64'h0000000000c20000;
      expv[17] = 64'h00f8f800000000f8;
      expv[18] = 64'h000000006bf60000;
      expv[19] = 64'h0000000000300000;
      expv[20] = 64'h000000008b9e0000;
      expv[21] = 64'h0000000000800000;
      expv[22] = 64'hdbc2c2db0800019d;
      expv[23] = 64'hb05757b076050107;
      expv[24] = 64'h0000000058ce0000;
      expv[25] = 64'h00baba00000000ba;
      expv[26] = 64'h0000000000400000;
      expv[27] = 64'h0000000060dc0000;
      expv[28] = 64'h0000000020d40000;
      expv[29] = 64'h0000000089e10000;
      expv[30] = 64'h029f9f02000000a1;
      expv[31] = 64'hcd2a2acdbf1f00f7;
      expv[32] = 64'h0008080000000008;
      expv[33] = 64'h9900009983ce0099;
      expv[34] = 64'h2ecdcd2e060000fb;
      expv[35] = 64'h0000000000800000;
      expv[36] = 64'h26eeee2601000114;
      expv[37] = 64'h00000000ecb20000;
      expv[38] = 64'h0000000000620000;
      expv[39] = 64'hc40404c4436100c8;
      expv[40] = 64'h000000003ff10000;
      expv[41] = 64'h06aeae06000000b4;
      expv[42] = 64'h3d60603d73c8009d;
      expv[43] = 64'h0002020000000002;
      expv[44] = 64'h0000000000740000;
      expv[45] = 64'he18888e1788a0169;
      expv[46] = 64'h302f2f303700005f;
      expv[47] = 64'h6000006082350060;
      expv[48] = 64'hcee4e4ce4a0001b2;
      expv[49] = 64'h000000006ab30000;
      expv[50] = 64'hc00000c0243800c0;
      expv[51] = 64'hc50000c5cf6900c5;
      expv[52] = 64'h3940403903fa0079;
      expv[53] = 64'h0000000000800000;
      expv[54] = 64'h70c8c87000000138;
      expv[55] = 64'h0014140000000014;
      expv[56] = 64'hd00000d0e26e00d0;
      expv[57] = 64'h90000090ce170090;
      expv[58] = 64'h7dbbbb7d9eb70138;
      expv[59] = 64'h0f68680f32000077;
      expv[60] = 64'h9192929129000123;
      expv[61] = 64'h0000000000000000;
      expv[62] = 64'hfff8f8ff2ceb01f7;
      expv[63] = 64'hfc0000fc4d2000fc;
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
