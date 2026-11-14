// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103858 dut (
    .data_7(in_vec[34:31]),
    .data_6(in_vec[30:27]),
    .data_5(in_vec[26:23]),
    .data_4(in_vec[22:19]),
    .data_3(in_vec[18:15]),
    .data_2(in_vec[14:11]),
    .data_1(in_vec[10:7]),
    .data_0(in_vec[6:3]),
    .counter(in_vec[2:0]),
    .anodos(out_vec[11:4]),
    .DIG(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h3cb128803;
    stim[1] = 35'h50a72bc09;
    stim[2] = 35'h4e7c1e3e4;
    stim[3] = 35'h6951f4145;
    stim[4] = 35'h13483d6bf;
    stim[5] = 35'h33f339c03;
    stim[6] = 35'h612c3adb8;
    stim[7] = 35'h6f3a5517d;
    stim[8] = 35'h311ec903a;
    stim[9] = 35'h25958a1d5;
    stim[10] = 35'h74890ce89;
    stim[11] = 35'h272718525;
    stim[12] = 35'h507e6a086;
    stim[13] = 35'h430becd53;
    stim[14] = 35'h1ad3ebef5;
    stim[15] = 35'h1c0666f93;
    stim[16] = 35'h6e1373fc3;
    stim[17] = 35'h3507c14ae;
    stim[18] = 35'h7b6df1207;
    stim[19] = 35'h4d416dd68;
    stim[20] = 35'h66541d58c;
    stim[21] = 35'h3d626fd65;
    stim[22] = 35'h4159be089;
    stim[23] = 35'h643043d65;
    stim[24] = 35'h77a98849f;
    stim[25] = 35'h0ecf930dd;
    stim[26] = 35'h6b4be08c8;
    stim[27] = 35'h35fcad4c0;
    stim[28] = 35'h2ce6acbed;
    stim[29] = 35'h7062bdaba;
    stim[30] = 35'h37d1b6f78;
    stim[31] = 35'h6b4c8f8a6;
    stim[32] = 35'h471552342;
    stim[33] = 35'h3fc8d2ca7;
    stim[34] = 35'h296efba2c;
    stim[35] = 35'h285268dd6;
    stim[36] = 35'h449de4cb8;
    stim[37] = 35'h771b6569c;
    stim[38] = 35'h306cdbc46;
    stim[39] = 35'h67cc4b6a6;
    stim[40] = 35'h0eda59161;
    stim[41] = 35'h6dea78f44;
    stim[42] = 35'h2495b3134;
    stim[43] = 35'h5e4d1e73d;
    stim[44] = 35'h7e7ab4076;
    stim[45] = 35'h1b6872059;
    stim[46] = 35'h6b956764b;
    stim[47] = 35'h35a4d7731;
    stim[48] = 35'h5f8cae86e;
    stim[49] = 35'h7c5899783;
    stim[50] = 35'h5b920bf4c;
    stim[51] = 35'h4d76ae316;
    stim[52] = 35'h4931dcfa9;
    stim[53] = 35'h0e98e9964;
    stim[54] = 35'h70305c079;
    stim[55] = 35'h45cadc3d8;
    stim[56] = 35'h2b2f5da73;
    stim[57] = 35'h2edac69f7;
    stim[58] = 35'h4a6a02955;
    stim[59] = 35'h2978cbdc3;
    stim[60] = 35'h23d914b07;
    stim[61] = 35'h6952e03b5;
    stim[62] = 35'h0aa33a676;
    stim[63] = 35'h69303d9c7;
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
      expv[0] = 12'hff0;
      expv[1] = 12'hfd8;
      expv[2] = 12'hff0;
      expv[3] = 12'hff0;
      expv[4] = 12'hff0;
      expv[5] = 12'hff0;
      expv[6] = 12'hfe7;
      expv[7] = 12'hff0;
      expv[8] = 12'hff0;
      expv[9] = 12'hff0;
      expv[10] = 12'hfdd;
      expv[11] = 12'hff0;
      expv[12] = 12'hff0;
      expv[13] = 12'hff0;
      expv[14] = 12'hff0;
      expv[15] = 12'hff0;
      expv[16] = 12'hff0;
      expv[17] = 12'hff0;
      expv[18] = 12'hff0;
      expv[19] = 12'hfed;
      expv[20] = 12'hff0;
      expv[21] = 12'hff0;
      expv[22] = 12'hfd1;
      expv[23] = 12'hff0;
      expv[24] = 12'hff0;
      expv[25] = 12'hff0;
      expv[26] = 12'hfe9;
      expv[27] = 12'hfe8;
      expv[28] = 12'hff0;
      expv[29] = 12'hff0;
      expv[30] = 12'hfef;
      expv[31] = 12'hff0;
      expv[32] = 12'hff0;
      expv[33] = 12'hff0;
      expv[34] = 12'hff0;
      expv[35] = 12'hff0;
      expv[36] = 12'hfe7;
      expv[37] = 12'hff0;
      expv[38] = 12'hff0;
      expv[39] = 12'hff0;
      expv[40] = 12'hfd2;
      expv[41] = 12'hff0;
      expv[42] = 12'hff0;
      expv[43] = 12'hff0;
      expv[44] = 12'hff0;
      expv[45] = 12'hfd0;
      expv[46] = 12'hff0;
      expv[47] = 12'hfde;
      expv[48] = 12'hff0;
      expv[49] = 12'hff0;
      expv[50] = 12'hff0;
      expv[51] = 12'hff0;
      expv[52] = 12'hfdf;
      expv[53] = 12'hff0;
      expv[54] = 12'hfd0;
      expv[55] = 12'hfeb;
      expv[56] = 12'hff0;
      expv[57] = 12'hff0;
      expv[58] = 12'hff0;
      expv[59] = 12'hff0;
      expv[60] = 12'hff0;
      expv[61] = 12'hff0;
      expv[62] = 12'hff0;
      expv[63] = 12'hff0;
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
