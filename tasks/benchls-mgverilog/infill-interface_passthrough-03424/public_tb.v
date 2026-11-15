// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03424 dut (
    .clk(clk),
    .rst(in_vec[6:6]),
    .u_MyInterfaceInSub2_setting(in_vec[5:5]),
    .u_MyInterfaceInSub2_mysig_out(in_vec[4:3]),
    .u_MyInterfaceInSub3_setting(in_vec[2:2]),
    .u_MyInterfaceInSub3_mysig_out(in_vec[1:0]),
    .u_MyInterfaceInSub2_other_setting(out_vec[41:38]),
    .u_MyInterfaceInSub3_other_setting(out_vec[37:16]),
    .passThrough(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h68;
    stim[1] = 7'h54;
    stim[2] = 7'h1c;
    stim[3] = 7'h0f;
    stim[4] = 7'h04;
    stim[5] = 7'h1a;
    stim[6] = 7'h3b;
    stim[7] = 7'h39;
    stim[8] = 7'h2d;
    stim[9] = 7'h1c;
    stim[10] = 7'h2f;
    stim[11] = 7'h11;
    stim[12] = 7'h0d;
    stim[13] = 7'h0d;
    stim[14] = 7'h2e;
    stim[15] = 7'h23;
    stim[16] = 7'h1f;
    stim[17] = 7'h28;
    stim[18] = 7'h1e;
    stim[19] = 7'h07;
    stim[20] = 7'h3d;
    stim[21] = 7'h07;
    stim[22] = 7'h00;
    stim[23] = 7'h2d;
    stim[24] = 7'h25;
    stim[25] = 7'h0d;
    stim[26] = 7'h3b;
    stim[27] = 7'h20;
    stim[28] = 7'h2f;
    stim[29] = 7'h24;
    stim[30] = 7'h1a;
    stim[31] = 7'h2f;
    stim[32] = 7'h1e;
    stim[33] = 7'h24;
    stim[34] = 7'h3d;
    stim[35] = 7'h36;
    stim[36] = 7'h32;
    stim[37] = 7'h02;
    stim[38] = 7'h01;
    stim[39] = 7'h23;
    stim[40] = 7'h1d;
    stim[41] = 7'h1a;
    stim[42] = 7'h2c;
    stim[43] = 7'h36;
    stim[44] = 7'h0c;
    stim[45] = 7'h08;
    stim[46] = 7'h33;
    stim[47] = 7'h28;
    stim[48] = 7'h3c;
    stim[49] = 7'h24;
    stim[50] = 7'h07;
    stim[51] = 7'h34;
    stim[52] = 7'h1b;
    stim[53] = 7'h01;
    stim[54] = 7'h03;
    stim[55] = 7'h0b;
    stim[56] = 7'h29;
    stim[57] = 7'h07;
    stim[58] = 7'h07;
    stim[59] = 7'h3f;
    stim[60] = 7'h06;
    stim[61] = 7'h2b;
    stim[62] = 7'h08;
    stim[63] = 7'h3e;
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
      expv[0] = 42'hxx003e8c87c;
      expv[1] = 42'hxx003e8c87c;
      expv[2] = 42'hxx003e8c87c;
      expv[3] = 42'hxx00fa0c87c;
      expv[4] = 42'hxx003e8c87c;
      expv[5] = 42'hxx00bb8c87c;
      expv[6] = 42'hxx00fa0c87c;
      expv[7] = 42'hxx007d0c87c;
      expv[8] = 42'hxx007d0c87c;
      expv[9] = 42'hxx003e8c87c;
      expv[10] = 42'hxx00fa0c87c;
      expv[11] = 42'hxx007d0c87c;
      expv[12] = 42'hxx007d0c87c;
      expv[13] = 42'hxx007d0c87c;
      expv[14] = 42'hxx00bb8c87c;
      expv[15] = 42'hxx00fa0c87c;
      expv[16] = 42'hxx00fa0c87c;
      expv[17] = 42'hxx003e8c87c;
      expv[18] = 42'hxx00bb8c87c;
      expv[19] = 42'hxx00fa0c87c;
      expv[20] = 42'hxx007d0c87c;
      expv[21] = 42'hxx00fa0c87c;
      expv[22] = 42'hxx003e8c87c;
      expv[23] = 42'hxx007d0c87c;
      expv[24] = 42'hxx007d0c87c;
      expv[25] = 42'hxx007d0c87c;
      expv[26] = 42'hxx00fa0c87c;
      expv[27] = 42'hxx003e8c87c;
      expv[28] = 42'hxx00fa0c87c;
      expv[29] = 42'hxx003e8c87c;
      expv[30] = 42'hxx00bb8c87c;
      expv[31] = 42'hxx00fa0c87c;
      expv[32] = 42'hxx00bb8c87c;
      expv[33] = 42'hxx003e8c87c;
      expv[34] = 42'hxx007d0c87c;
      expv[35] = 42'hxx00bb8c87c;
      expv[36] = 42'hxx00bb8c87c;
      expv[37] = 42'hxx00bb8c87c;
      expv[38] = 42'hxx007d0c87c;
      expv[39] = 42'hxx00fa0c87c;
      expv[40] = 42'hxx007d0c87c;
      expv[41] = 42'hxx00bb8c87c;
      expv[42] = 42'hxx003e8c87c;
      expv[43] = 42'hxx00bb8c87c;
      expv[44] = 42'hxx003e8c87c;
      expv[45] = 42'hxx003e8c87c;
      expv[46] = 42'hxx00fa0c87c;
      expv[47] = 42'hxx003e8c87c;
      expv[48] = 42'hxx003e8c87c;
      expv[49] = 42'hxx003e8c87c;
      expv[50] = 42'hxx00fa0c87c;
      expv[51] = 42'hxx003e8c87c;
      expv[52] = 42'hxx00fa0c87c;
      expv[53] = 42'hxx007d0c87c;
      expv[54] = 42'hxx00fa0c87c;
      expv[55] = 42'hxx00fa0c87c;
      expv[56] = 42'hxx007d0c87c;
      expv[57] = 42'hxx00fa0c87c;
      expv[58] = 42'hxx00fa0c87c;
      expv[59] = 42'hxx00fa0c87c;
      expv[60] = 42'hxx00bb8c87c;
      expv[61] = 42'hxx00fa0c87c;
      expv[62] = 42'hxx003e8c87c;
      expv[63] = 42'hxx00bb8c87c;
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
