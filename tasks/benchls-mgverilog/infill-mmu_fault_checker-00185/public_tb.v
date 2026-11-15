// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00185 dut (
    .iPAGING_ENA(in_vec[15:15]),
    .iKERNEL_ACCESS(in_vec[14:14]),
    .iMMU_FLAGS(in_vec[13:0]),
    .oIRQ40(out_vec[8:6]),
    .oIRQ41(out_vec[5:3]),
    .oIRQ42(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h792f;
    stim[1] = 16'h0247;
    stim[2] = 16'hfe31;
    stim[3] = 16'h79ea;
    stim[4] = 16'hf440;
    stim[5] = 16'h7456;
    stim[6] = 16'ha22f;
    stim[7] = 16'hb1b7;
    stim[8] = 16'hd332;
    stim[9] = 16'h90d3;
    stim[10] = 16'haab8;
    stim[11] = 16'h0b95;
    stim[12] = 16'h797f;
    stim[13] = 16'h1fa2;
    stim[14] = 16'h68d2;
    stim[15] = 16'h3061;
    stim[16] = 16'h475a;
    stim[17] = 16'hdd77;
    stim[18] = 16'h2d83;
    stim[19] = 16'h8cdb;
    stim[20] = 16'hdc65;
    stim[21] = 16'h01de;
    stim[22] = 16'h9300;
    stim[23] = 16'h73f5;
    stim[24] = 16'h6a3a;
    stim[25] = 16'h6cb9;
    stim[26] = 16'hd359;
    stim[27] = 16'h123e;
    stim[28] = 16'hff83;
    stim[29] = 16'h699b;
    stim[30] = 16'h5ba1;
    stim[31] = 16'h5420;
    stim[32] = 16'hf6d2;
    stim[33] = 16'h6352;
    stim[34] = 16'h4067;
    stim[35] = 16'hfe38;
    stim[36] = 16'ha02f;
    stim[37] = 16'hb38a;
    stim[38] = 16'hb6ae;
    stim[39] = 16'haeb4;
    stim[40] = 16'h74dd;
    stim[41] = 16'hfa47;
    stim[42] = 16'hed42;
    stim[43] = 16'hfc5d;
    stim[44] = 16'h8cc2;
    stim[45] = 16'hb135;
    stim[46] = 16'h2d2a;
    stim[47] = 16'h67f7;
    stim[48] = 16'h8515;
    stim[49] = 16'h3220;
    stim[50] = 16'hdae0;
    stim[51] = 16'h4230;
    stim[52] = 16'h695e;
    stim[53] = 16'h3bd6;
    stim[54] = 16'h844b;
    stim[55] = 16'h67a1;
    stim[56] = 16'h8270;
    stim[57] = 16'h696a;
    stim[58] = 16'hd9be;
    stim[59] = 16'h3a4f;
    stim[60] = 16'h37ff;
    stim[61] = 16'h08ea;
    stim[62] = 16'h674d;
    stim[63] = 16'h1dd3;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h100;
      expv[3] = 9'h000;
      expv[4] = 9'h100;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h100;
      expv[8] = 9'h100;
      expv[9] = 9'h100;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h100;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h100;
      expv[21] = 9'h000;
      expv[22] = 9'h100;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h100;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h100;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h080;
      expv[38] = 9'h000;
      expv[39] = 9'h100;
      expv[40] = 9'h000;
      expv[41] = 9'h100;
      expv[42] = 9'h100;
      expv[43] = 9'h000;
      expv[44] = 9'h100;
      expv[45] = 9'h100;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h100;
      expv[49] = 9'h000;
      expv[50] = 9'h100;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h080;
      expv[55] = 9'h000;
      expv[56] = 9'h100;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
