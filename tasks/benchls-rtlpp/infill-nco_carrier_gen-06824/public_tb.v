// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06824 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h1c8c5d97;
    stim[1] = 31'h339a69a0;
    stim[2] = 31'h74acbe71;
    stim[3] = 31'h793e8b3c;
    stim[4] = 31'h7e2edf59;
    stim[5] = 31'h598c5bc2;
    stim[6] = 31'h52447b7b;
    stim[7] = 31'h6b1276ac;
    stim[8] = 31'h5c71c01b;
    stim[9] = 31'h7096260f;
    stim[10] = 31'h71436223;
    stim[11] = 31'h50a0a5e3;
    stim[12] = 31'h6e3f0bb3;
    stim[13] = 31'h4178fe69;
    stim[14] = 31'h68d817fd;
    stim[15] = 31'h60521132;
    stim[16] = 31'h4eeb97d7;
    stim[17] = 31'h6f62ee1d;
    stim[18] = 31'h66d67503;
    stim[19] = 31'h6a337baf;
    stim[20] = 31'h78519d15;
    stim[21] = 31'h76b8843d;
    stim[22] = 31'h6d7cc772;
    stim[23] = 31'h482533b5;
    stim[24] = 31'h4c23271e;
    stim[25] = 31'h7659a595;
    stim[26] = 31'h4136dcde;
    stim[27] = 31'h7f62e9ce;
    stim[28] = 31'h6f2dd0b6;
    stim[29] = 31'h4e239a77;
    stim[30] = 31'h6b36755a;
    stim[31] = 31'h6acadf4c;
    stim[32] = 31'h41cb76ac;
    stim[33] = 31'h55f13e45;
    stim[34] = 31'h4d4c7e0f;
    stim[35] = 31'h6730f73c;
    stim[36] = 31'h46e580f0;
    stim[37] = 31'h79f88082;
    stim[38] = 31'h5318abd5;
    stim[39] = 31'h6ac33b36;
    stim[40] = 31'h5fdec05a;
    stim[41] = 31'h6d968061;
    stim[42] = 31'h68a919bc;
    stim[43] = 31'h1a3d8eb5;
    stim[44] = 31'h51341504;
    stim[45] = 31'h62db7d12;
    stim[46] = 31'h46c32cf8;
    stim[47] = 31'h6d1f0aa5;
    stim[48] = 31'h71a5cccd;
    stim[49] = 31'h62d6cca0;
    stim[50] = 31'h01c2c285;
    stim[51] = 31'h54cb1722;
    stim[52] = 31'h59b3e260;
    stim[53] = 31'h5ae9b9aa;
    stim[54] = 31'h50f5aef9;
    stim[55] = 31'h41aa4ca0;
    stim[56] = 31'h7c5429a6;
    stim[57] = 31'h6beb24af;
    stim[58] = 31'h711388df;
    stim[59] = 31'h57a53a2a;
    stim[60] = 31'h64e10598;
    stim[61] = 31'h5f182fdb;
    stim[62] = 31'h6b17410e;
    stim[63] = 31'h72c17356;
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
      expv[0] = 36'hxxxxxxxx9;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'h000000004;
      expv[4] = 36'h0000014ae;
      expv[5] = 36'h000002de1;
      expv[6] = 36'h000002de6;
      expv[7] = 36'h000002de3;
      expv[8] = 36'h0000037e9;
      expv[9] = 36'h0000037e4;
      expv[10] = 36'h000001f63;
      expv[11] = 36'h00000300e;
      expv[12] = 36'h000003009;
      expv[13] = 36'h0000011e9;
      expv[14] = 36'h0000011e1;
      expv[15] = 36'h0000021a1;
      expv[16] = 36'h000002a76;
      expv[17] = 36'h000002a7b;
      expv[18] = 36'h0000039be;
      expv[19] = 36'h00000091c;
      expv[20] = 36'h000000ff4;
      expv[21] = 36'h000001a2b;
      expv[22] = 36'h00000327c;
      expv[23] = 36'h000000929;
      expv[24] = 36'h000000921;
      expv[25] = 36'h000000923;
      expv[26] = 36'h000002af3;
      expv[27] = 36'h000002af9;
      expv[28] = 36'h000000284;
      expv[29] = 36'h0000021e3;
      expv[30] = 36'h0000021eb;
      expv[31] = 36'h000003f3c;
      expv[32] = 36'h000000a6c;
      expv[33] = 36'h000000a64;
      expv[34] = 36'h000000a66;
      expv[35] = 36'h000000a63;
      expv[36] = 36'h000003a4b;
      expv[37] = 36'h000003a49;
      expv[38] = 36'h000000856;
      expv[39] = 36'h000000853;
      expv[40] = 36'h000003569;
      expv[41] = 36'h000003564;
      expv[42] = 36'h000002006;
      expv[43] = 36'h000002dac;
      expv[44] = 36'h000002dae;
      expv[45] = 36'h000002dac;
      expv[46] = 36'h00000113c;
      expv[47] = 36'h000001131;
      expv[48] = 36'h000001ad6;
      expv[49] = 36'h0000027f3;
      expv[50] = 36'h000003993;
      expv[51] = 36'h00000399c;
      expv[52] = 36'h000003994;
      expv[53] = 36'h00000399b;
      expv[54] = 36'h00000399c;
      expv[55] = 36'h000003999;
      expv[56] = 36'h000003996;
      expv[57] = 36'h000005c0b;
      expv[58] = 36'h00000385c;
      expv[59] = 36'h000000444;
      expv[60] = 36'h000000444;
      expv[61] = 36'h000002d0e;
      expv[62] = 36'h000002d09;
      expv[63] = 36'h0000050f4;
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
