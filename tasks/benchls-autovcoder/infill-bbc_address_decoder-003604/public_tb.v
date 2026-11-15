// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_003604 dut (
    .cpu_a(in_vec[19:4]),
    .romsel(in_vec[3:0]),
    .ddr_enable(out_vec[18:18]),
    .ram_enable(out_vec[17:17]),
    .rom_enable(out_vec[16:16]),
    .mos_enable(out_vec[15:15]),
    .io_fred(out_vec[14:14]),
    .io_jim(out_vec[13:13]),
    .io_sheila(out_vec[12:12]),
    .crtc_enable(out_vec[11:11]),
    .acia_enable(out_vec[10:10]),
    .serproc_enable(out_vec[9:9]),
    .vidproc_enable(out_vec[8:8]),
    .romsel_enable(out_vec[7:7]),
    .sys_via_enable(out_vec[6:6]),
    .user_via_enable(out_vec[5:5]),
    .fddc_enable(out_vec[4:4]),
    .adlc_enable(out_vec[3:3]),
    .adc_enable(out_vec[2:2]),
    .tube_enable(out_vec[1:1]),
    .mhz1_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h69048;
    stim[1] = 20'hfc72f;
    stim[2] = 20'hcc16a;
    stim[3] = 20'h4a1a2;
    stim[4] = 20'h7a003;
    stim[5] = 20'h1136b;
    stim[6] = 20'h076c7;
    stim[7] = 20'h26388;
    stim[8] = 20'h4de0f;
    stim[9] = 20'h1cb0b;
    stim[10] = 20'h213b2;
    stim[11] = 20'ha1f90;
    stim[12] = 20'h7a85c;
    stim[13] = 20'h3d2f1;
    stim[14] = 20'hc8c21;
    stim[15] = 20'h6102a;
    stim[16] = 20'hbbcf6;
    stim[17] = 20'h02e8f;
    stim[18] = 20'h43812;
    stim[19] = 20'h36dfa;
    stim[20] = 20'h7176f;
    stim[21] = 20'h3ed00;
    stim[22] = 20'h382ea;
    stim[23] = 20'ha932b;
    stim[24] = 20'hb2f75;
    stim[25] = 20'h678ed;
    stim[26] = 20'h21fd6;
    stim[27] = 20'h16551;
    stim[28] = 20'h95075;
    stim[29] = 20'h584f8;
    stim[30] = 20'hae1e4;
    stim[31] = 20'h97178;
    stim[32] = 20'h9e07f;
    stim[33] = 20'hb935e;
    stim[34] = 20'hfb3f2;
    stim[35] = 20'h623bf;
    stim[36] = 20'h43c16;
    stim[37] = 20'h3d853;
    stim[38] = 20'ha93d7;
    stim[39] = 20'hcfb7a;
    stim[40] = 20'hfe747;
    stim[41] = 20'h166e0;
    stim[42] = 20'hda39b;
    stim[43] = 20'hd967d;
    stim[44] = 20'h41417;
    stim[45] = 20'hf5f19;
    stim[46] = 20'h06e8b;
    stim[47] = 20'h0a562;
    stim[48] = 20'h93576;
    stim[49] = 20'h673bf;
    stim[50] = 20'hd1c31;
    stim[51] = 20'h374ec;
    stim[52] = 20'h18d21;
    stim[53] = 20'h33b63;
    stim[54] = 20'hf122c;
    stim[55] = 20'hfbee4;
    stim[56] = 20'h37ff7;
    stim[57] = 20'heb368;
    stim[58] = 20'h0ff43;
    stim[59] = 20'hc7034;
    stim[60] = 20'h40c67;
    stim[61] = 20'h63260;
    stim[62] = 20'hb7847;
    stim[63] = 20'h4d46d;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h04001;
      expv[2] = 19'h08000;
      expv[3] = 19'h20000;
      expv[4] = 19'h20000;
      expv[5] = 19'h20000;
      expv[6] = 19'h20000;
      expv[7] = 19'h20000;
      expv[8] = 19'h20000;
      expv[9] = 19'h20000;
      expv[10] = 19'h20000;
      expv[11] = 19'h50000;
      expv[12] = 19'h20000;
      expv[13] = 19'h20000;
      expv[14] = 19'h08000;
      expv[15] = 19'h20000;
      expv[16] = 19'h50000;
      expv[17] = 19'h20000;
      expv[18] = 19'h20000;
      expv[19] = 19'h20000;
      expv[20] = 19'h20000;
      expv[21] = 19'h20000;
      expv[22] = 19'h20000;
      expv[23] = 19'h10000;
      expv[24] = 19'h50000;
      expv[25] = 19'h20000;
      expv[26] = 19'h20000;
      expv[27] = 19'h20000;
      expv[28] = 19'h50000;
      expv[29] = 19'h20000;
      expv[30] = 19'h50000;
      expv[31] = 19'h10000;
      expv[32] = 19'h10000;
      expv[33] = 19'h10000;
      expv[34] = 19'h08000;
      expv[35] = 19'h20000;
      expv[36] = 19'h20000;
      expv[37] = 19'h20000;
      expv[38] = 19'h50000;
      expv[39] = 19'h08000;
      expv[40] = 19'h01021;
      expv[41] = 19'h20000;
      expv[42] = 19'h08000;
      expv[43] = 19'h08000;
      expv[44] = 19'h20000;
      expv[45] = 19'h08000;
      expv[46] = 19'h20000;
      expv[47] = 19'h20000;
      expv[48] = 19'h50000;
      expv[49] = 19'h20000;
      expv[50] = 19'h08000;
      expv[51] = 19'h20000;
      expv[52] = 19'h20000;
      expv[53] = 19'h20000;
      expv[54] = 19'h08000;
      expv[55] = 19'h08000;
      expv[56] = 19'h20000;
      expv[57] = 19'h08000;
      expv[58] = 19'h20000;
      expv[59] = 19'h08000;
      expv[60] = 19'h20000;
      expv[61] = 19'h20000;
      expv[62] = 19'h50000;
      expv[63] = 19'h20000;
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
