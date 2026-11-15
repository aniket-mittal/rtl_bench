// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_052791 dut (
    .CLK(clk),
    .RST(in_vec[8:8]),
    .I2C_START(in_vec[7:7]),
    .MT(in_vec[6:6]),
    .N_BYTES(in_vec[5:2]),
    .READ(in_vec[1:1]),
    .READY(in_vec[0:0]),
    .CLR_START(out_vec[11:11]),
    .EXECUTE(out_vec[10:10]),
    .LD_ADDR(out_vec[9:9]),
    .LD_DEV(out_vec[8:8]),
    .LD_N_BYTE(out_vec[7:7]),
    .NVIO_ENA(out_vec[6:6]),
    .READ_FF(out_vec[5:5]),
    .WRT_ENA(out_vec[4:4]),
    .I2C_PARSER_STATE(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h177;
    stim[1] = 9'h19c;
    stim[2] = 9'h0f0;
    stim[3] = 9'h084;
    stim[4] = 9'h0a7;
    stim[5] = 9'h02c;
    stim[6] = 9'h0cb;
    stim[7] = 9'h0fa;
    stim[8] = 9'h02a;
    stim[9] = 9'h0aa;
    stim[10] = 9'h062;
    stim[11] = 9'h035;
    stim[12] = 9'h042;
    stim[13] = 9'h0cf;
    stim[14] = 9'h051;
    stim[15] = 9'h0b6;
    stim[16] = 9'h0a3;
    stim[17] = 9'h00c;
    stim[18] = 9'h09c;
    stim[19] = 9'h020;
    stim[20] = 9'h013;
    stim[21] = 9'h0ee;
    stim[22] = 9'h06f;
    stim[23] = 9'h08e;
    stim[24] = 9'h0f2;
    stim[25] = 9'h0ae;
    stim[26] = 9'h095;
    stim[27] = 9'h0ff;
    stim[28] = 9'h0f0;
    stim[29] = 9'h089;
    stim[30] = 9'h019;
    stim[31] = 9'h078;
    stim[32] = 9'h0e4;
    stim[33] = 9'h0b0;
    stim[34] = 9'h03e;
    stim[35] = 9'h048;
    stim[36] = 9'h01c;
    stim[37] = 9'h049;
    stim[38] = 9'h052;
    stim[39] = 9'h05e;
    stim[40] = 9'h085;
    stim[41] = 9'h0ae;
    stim[42] = 9'h0ff;
    stim[43] = 9'h08e;
    stim[44] = 9'h0d8;
    stim[45] = 9'h04b;
    stim[46] = 9'h035;
    stim[47] = 9'h002;
    stim[48] = 9'h093;
    stim[49] = 9'h0d0;
    stim[50] = 9'h05b;
    stim[51] = 9'h001;
    stim[52] = 9'h0b0;
    stim[53] = 9'h0ef;
    stim[54] = 9'h05a;
    stim[55] = 9'h0b4;
    stim[56] = 9'h0ab;
    stim[57] = 9'h0ec;
    stim[58] = 9'h0e7;
    stim[59] = 9'h0e3;
    stim[60] = 9'h034;
    stim[61] = 9'h012;
    stim[62] = 9'h054;
    stim[63] = 9'h07f;
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
      expv[0] = 12'h000;
      expv[1] = 12'h100;
      expv[2] = 12'h000;
      expv[3] = 12'h100;
      expv[4] = 12'h204;
      expv[5] = 12'h403;
      expv[6] = 12'h002;
      expv[7] = 12'h006;
      expv[8] = 12'h006;
      expv[9] = 12'h006;
      expv[10] = 12'h006;
      expv[11] = 12'h006;
      expv[12] = 12'h057;
      expv[13] = 12'h008;
      expv[14] = 12'h006;
      expv[15] = 12'h057;
      expv[16] = 12'h008;
      expv[17] = 12'h006;
      expv[18] = 12'h006;
      expv[19] = 12'h006;
      expv[20] = 12'h006;
      expv[21] = 12'h057;
      expv[22] = 12'h008;
      expv[23] = 12'h006;
      expv[24] = 12'h006;
      expv[25] = 12'h006;
      expv[26] = 12'h006;
      expv[27] = 12'h007;
      expv[28] = 12'h057;
      expv[29] = 12'h008;
      expv[30] = 12'h006;
      expv[31] = 12'h057;
      expv[32] = 12'h008;
      expv[33] = 12'h006;
      expv[34] = 12'h006;
      expv[35] = 12'h006;
      expv[36] = 12'h006;
      expv[37] = 12'h006;
      expv[38] = 12'h057;
      expv[39] = 12'h008;
      expv[40] = 12'h006;
      expv[41] = 12'h057;
      expv[42] = 12'h008;
      expv[43] = 12'h006;
      expv[44] = 12'h006;
      expv[45] = 12'h006;
      expv[46] = 12'h007;
      expv[47] = 12'h057;
      expv[48] = 12'h008;
      expv[49] = 12'h006;
      expv[50] = 12'h006;
      expv[51] = 12'h007;
      expv[52] = 12'h057;
      expv[53] = 12'h008;
      expv[54] = 12'h006;
      expv[55] = 12'h006;
      expv[56] = 12'h006;
      expv[57] = 12'h057;
      expv[58] = 12'h008;
      expv[59] = 12'h006;
      expv[60] = 12'h057;
      expv[61] = 12'h008;
      expv[62] = 12'h006;
      expv[63] = 12'h006;
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
