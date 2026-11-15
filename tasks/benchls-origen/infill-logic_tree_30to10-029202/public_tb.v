// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_029202 dut (
    .in(in_vec[29:0]),
    .out(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h028f54ff;
    stim[1] = 30'h09e20fff;
    stim[2] = 30'h1a71a2e5;
    stim[3] = 30'h1b10c530;
    stim[4] = 30'h0044e083;
    stim[5] = 30'h01d9d81e;
    stim[6] = 30'h02140c82;
    stim[7] = 30'h151afe5b;
    stim[8] = 30'h04ec531f;
    stim[9] = 30'h3e4bde1a;
    stim[10] = 30'h15285011;
    stim[11] = 30'h39ae81b5;
    stim[12] = 30'h33971ad2;
    stim[13] = 30'h3b64d168;
    stim[14] = 30'h277f01c8;
    stim[15] = 30'h211b4c8b;
    stim[16] = 30'h3205890d;
    stim[17] = 30'h2ce9293b;
    stim[18] = 30'h39a0fe2d;
    stim[19] = 30'h285423c7;
    stim[20] = 30'h36e0f856;
    stim[21] = 30'h3bae7279;
    stim[22] = 30'h0c0b3454;
    stim[23] = 30'h1c2c26a5;
    stim[24] = 30'h24c564ed;
    stim[25] = 30'h11a2a609;
    stim[26] = 30'h24c86c63;
    stim[27] = 30'h07c925f4;
    stim[28] = 30'h15a21674;
    stim[29] = 30'h3b0cd036;
    stim[30] = 30'h2fce03f6;
    stim[31] = 30'h25511cfc;
    stim[32] = 30'h3c62b7c6;
    stim[33] = 30'h12564373;
    stim[34] = 30'h0d4c8f66;
    stim[35] = 30'h156df572;
    stim[36] = 30'h060407b3;
    stim[37] = 30'h101db69b;
    stim[38] = 30'h0fb98654;
    stim[39] = 30'h2d92004c;
    stim[40] = 30'h2a65cb84;
    stim[41] = 30'h3d6991b0;
    stim[42] = 30'h185e206f;
    stim[43] = 30'h265aaa81;
    stim[44] = 30'h35135e71;
    stim[45] = 30'h0c97eaa1;
    stim[46] = 30'h1ceafacb;
    stim[47] = 30'h3d03fa2c;
    stim[48] = 30'h0ad7e520;
    stim[49] = 30'h096cbd09;
    stim[50] = 30'h3e58cf6f;
    stim[51] = 30'h3f3a3a1d;
    stim[52] = 30'h23f7bf78;
    stim[53] = 30'h1fa7daea;
    stim[54] = 30'h29dd8230;
    stim[55] = 30'h2d693179;
    stim[56] = 30'h12e9e8af;
    stim[57] = 30'h3f337e20;
    stim[58] = 30'h0c3530a8;
    stim[59] = 30'h280eec3e;
    stim[60] = 30'h2b1ab3f7;
    stim[61] = 30'h2c3299ea;
    stim[62] = 30'h3f199019;
    stim[63] = 30'h082127ff;
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
      expv[0] = 10'h060;
      expv[1] = 10'h060;
      expv[2] = 10'h062;
      expv[3] = 10'h062;
      expv[4] = 10'h061;
      expv[5] = 10'h060;
      expv[6] = 10'h060;
      expv[7] = 10'h063;
      expv[8] = 10'h060;
      expv[9] = 10'h263;
      expv[10] = 10'h062;
      expv[11] = 10'h262;
      expv[12] = 10'h262;
      expv[13] = 10'h262;
      expv[14] = 10'h260;
      expv[15] = 10'h260;
      expv[16] = 10'h262;
      expv[17] = 10'h260;
      expv[18] = 10'h263;
      expv[19] = 10'h260;
      expv[20] = 10'h263;
      expv[21] = 10'h262;
      expv[22] = 10'h061;
      expv[23] = 10'h062;
      expv[24] = 10'h261;
      expv[25] = 10'h063;
      expv[26] = 10'h260;
      expv[27] = 10'h061;
      expv[28] = 10'h063;
      expv[29] = 10'h262;
      expv[30] = 10'h260;
      expv[31] = 10'h261;
      expv[32] = 10'h263;
      expv[33] = 10'h062;
      expv[34] = 10'h060;
      expv[35] = 10'h062;
      expv[36] = 10'h060;
      expv[37] = 10'h062;
      expv[38] = 10'h061;
      expv[39] = 10'h261;
      expv[40] = 10'h260;
      expv[41] = 10'h262;
      expv[42] = 10'h062;
      expv[43] = 10'h260;
      expv[44] = 10'h263;
      expv[45] = 10'h061;
      expv[46] = 10'h062;
      expv[47] = 10'h263;
      expv[48] = 10'h061;
      expv[49] = 10'h060;
      expv[50] = 10'h262;
      expv[51] = 10'h262;
      expv[52] = 10'h260;
      expv[53] = 10'h062;
      expv[54] = 10'h260;
      expv[55] = 10'h260;
      expv[56] = 10'h062;
      expv[57] = 10'h262;
      expv[58] = 10'h060;
      expv[59] = 10'h260;
      expv[60] = 10'h260;
      expv[61] = 10'h260;
      expv[62] = 10'h262;
      expv[63] = 10'h060;
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
