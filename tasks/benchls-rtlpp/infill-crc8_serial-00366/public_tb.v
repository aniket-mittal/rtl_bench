// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00366 dut (
    .clk(clk),
    .d(in_vec[11:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[39:8]),
    .crc(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h229;
    stim[1] = 12'ha0d;
    stim[2] = 12'he34;
    stim[3] = 12'hf6a;
    stim[4] = 12'h33e;
    stim[5] = 12'he18;
    stim[6] = 12'h5b2;
    stim[7] = 12'he5c;
    stim[8] = 12'h864;
    stim[9] = 12'h09e;
    stim[10] = 12'h0c0;
    stim[11] = 12'h5fe;
    stim[12] = 12'h1fa;
    stim[13] = 12'hbf4;
    stim[14] = 12'h480;
    stim[15] = 12'h718;
    stim[16] = 12'hefa;
    stim[17] = 12'h560;
    stim[18] = 12'h4dc;
    stim[19] = 12'h3fa;
    stim[20] = 12'he52;
    stim[21] = 12'hb74;
    stim[22] = 12'h8ca;
    stim[23] = 12'hf7e;
    stim[24] = 12'h296;
    stim[25] = 12'hf26;
    stim[26] = 12'h766;
    stim[27] = 12'hab0;
    stim[28] = 12'h9a6;
    stim[29] = 12'he94;
    stim[30] = 12'hf9c;
    stim[31] = 12'h232;
    stim[32] = 12'h01c;
    stim[33] = 12'h5b7;
    stim[34] = 12'h6a6;
    stim[35] = 12'h2fe;
    stim[36] = 12'h88e;
    stim[37] = 12'h2f6;
    stim[38] = 12'h110;
    stim[39] = 12'h126;
    stim[40] = 12'h0d8;
    stim[41] = 12'hca8;
    stim[42] = 12'h4b4;
    stim[43] = 12'h7b2;
    stim[44] = 12'haa0;
    stim[45] = 12'h1b0;
    stim[46] = 12'ha42;
    stim[47] = 12'h3f4;
    stim[48] = 12'hb6a;
    stim[49] = 12'he0c;
    stim[50] = 12'h968;
    stim[51] = 12'h19c;
    stim[52] = 12'hef6;
    stim[53] = 12'heea;
    stim[54] = 12'h1e6;
    stim[55] = 12'he56;
    stim[56] = 12'hb14;
    stim[57] = 12'h4f4;
    stim[58] = 12'h840;
    stim[59] = 12'h760;
    stim[60] = 12'hd7e;
    stim[61] = 12'he12;
    stim[62] = 12'hdc0;
    stim[63] = 12'h666;
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
      expv[0] = 40'hffffffffff;
      expv[1] = 40'hffffffffff;
      expv[2] = 40'hffffffffff;
      expv[3] = 40'hffffffffff;
      expv[4] = 40'hdae2c49ea4;
      expv[5] = 40'hffffffffff;
      expv[6] = 40'hffffffffff;
      expv[7] = 40'hffffffff00;
      expv[8] = 40'hffffffffff;
      expv[9] = 40'hffffffffff;
      expv[10] = 40'hffffffffff;
      expv[11] = 40'hffffffffff;
      expv[12] = 40'hffffffffff;
      expv[13] = 40'he1b8af0578;
      expv[14] = 40'hffffffffff;
      expv[15] = 40'hffffffffff;
      expv[16] = 40'hffffffffff;
      expv[17] = 40'hd9f712b864;
      expv[18] = 40'hd9f712b864;
      expv[19] = 40'hffffffffff;
      expv[20] = 40'hf2bcd9d9b0;
      expv[21] = 40'hbcd9d9ffc2;
      expv[22] = 40'hffffffffff;
      expv[23] = 40'h9efbcf9386;
      expv[24] = 40'hffffffffff;
      expv[25] = 40'hffffffffff;
      expv[26] = 40'hffffffffff;
      expv[27] = 40'hffffffffff;
      expv[28] = 40'hffffffffff;
      expv[29] = 40'hffffffffff;
      expv[30] = 40'hffffffffff;
      expv[31] = 40'hffffffffff;
      expv[32] = 40'hffffffff00;
      expv[33] = 40'hffffffffff;
      expv[34] = 40'hffffffffff;
      expv[35] = 40'hffffffffff;
      expv[36] = 40'hffffffffff;
      expv[37] = 40'hffffffffff;
      expv[38] = 40'hffffffffff;
      expv[39] = 40'hffffffffff;
      expv[40] = 40'hffffffffff;
      expv[41] = 40'hffffffffff;
      expv[42] = 40'hffffffffff;
      expv[43] = 40'hffffffffff;
      expv[44] = 40'hffffffff00;
      expv[45] = 40'hffffffff00;
      expv[46] = 40'hffffffff00;
      expv[47] = 40'hffffffff00;
      expv[48] = 40'hffffffffff;
      expv[49] = 40'hd360fff034;
      expv[50] = 40'hffffffffff;
      expv[51] = 40'hffffffffff;
      expv[52] = 40'hffffffffff;
      expv[53] = 40'hffffffffff;
      expv[54] = 40'hb0fbf256f2;
      expv[55] = 40'hffffffffff;
      expv[56] = 40'hffffffffff;
      expv[57] = 40'hffffffffff;
      expv[58] = 40'hffffffffff;
      expv[59] = 40'hffffffffff;
      expv[60] = 40'hffffffffff;
      expv[61] = 40'hffffffffff;
      expv[62] = 40'hffffffff00;
      expv[63] = 40'hffffffff00;
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
