// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04789 dut (
    .clk(clk),
    .binary_input_0(in_vec[15:12]),
    .binary_input_1(in_vec[11:8]),
    .binary_input_2(in_vec[7:4]),
    .binary_input_3(in_vec[3:0]),
    .IO_SSEG_SEL(out_vec[10:7]),
    .IO_SSEG(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h98ac;
    stim[1] = 16'h0f4b;
    stim[2] = 16'h2484;
    stim[3] = 16'hfe6e;
    stim[4] = 16'h16ea;
    stim[5] = 16'he9d3;
    stim[6] = 16'h5e1b;
    stim[7] = 16'h7741;
    stim[8] = 16'hed4a;
    stim[9] = 16'h195b;
    stim[10] = 16'h5b8e;
    stim[11] = 16'hf043;
    stim[12] = 16'hd341;
    stim[13] = 16'hef04;
    stim[14] = 16'h562e;
    stim[15] = 16'h8836;
    stim[16] = 16'hb721;
    stim[17] = 16'hade0;
    stim[18] = 16'ha0de;
    stim[19] = 16'heef7;
    stim[20] = 16'hbe10;
    stim[21] = 16'h3a6b;
    stim[22] = 16'h8a0a;
    stim[23] = 16'he4dc;
    stim[24] = 16'h2c0b;
    stim[25] = 16'h1d49;
    stim[26] = 16'h3e6c;
    stim[27] = 16'hb9b9;
    stim[28] = 16'h4f01;
    stim[29] = 16'h749f;
    stim[30] = 16'h11c7;
    stim[31] = 16'h83d2;
    stim[32] = 16'h29bc;
    stim[33] = 16'h3c61;
    stim[34] = 16'h6375;
    stim[35] = 16'h39fd;
    stim[36] = 16'hce06;
    stim[37] = 16'h1837;
    stim[38] = 16'hba3f;
    stim[39] = 16'h20da;
    stim[40] = 16'hf1be;
    stim[41] = 16'h6d4e;
    stim[42] = 16'h6691;
    stim[43] = 16'h4b6e;
    stim[44] = 16'h968b;
    stim[45] = 16'h6f53;
    stim[46] = 16'h90ab;
    stim[47] = 16'h6c67;
    stim[48] = 16'h6838;
    stim[49] = 16'hc11f;
    stim[50] = 16'h57d8;
    stim[51] = 16'he389;
    stim[52] = 16'h81fc;
    stim[53] = 16'h62a9;
    stim[54] = 16'h5eae;
    stim[55] = 16'hfd9f;
    stim[56] = 16'hd681;
    stim[57] = 16'hcace;
    stim[58] = 16'he3ca;
    stim[59] = 16'h7988;
    stim[60] = 16'hd704;
    stim[61] = 16'h7d17;
    stim[62] = 16'h1be1;
    stim[63] = 16'h0de4;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'h7xx;
      expv[2] = 11'h718;
      expv[3] = 11'h740;
      expv[4] = 11'h724;
      expv[5] = 11'h70e;
      expv[6] = 11'h779;
      expv[7] = 11'h706;
      expv[8] = 11'h712;
      expv[9] = 11'h778;
      expv[10] = 11'h706;
      expv[11] = 11'h779;
      expv[12] = 11'h712;
      expv[13] = 11'h70e;
      expv[14] = 11'h721;
      expv[15] = 11'h706;
      expv[16] = 11'h712;
      expv[17] = 11'h700;
      expv[18] = 11'h703;
      expv[19] = 11'h708;
      expv[20] = 11'h708;
      expv[21] = 11'h706;
      expv[22] = 11'h703;
      expv[23] = 11'h730;
      expv[24] = 11'h700;
      expv[25] = 11'h706;
      expv[26] = 11'h724;
      expv[27] = 11'h779;
      expv[28] = 11'h730;
      expv[29] = 11'h703;
      expv[30] = 11'h719;
      expv[31] = 11'h778;
      expv[32] = 11'h779;
      expv[33] = 11'h700;
      expv[34] = 11'h724;
      expv[35] = 11'h730;
      expv[36] = 11'h702;
      expv[37] = 11'h730;
      expv[38] = 11'h746;
      expv[39] = 11'h779;
      expv[40] = 11'h703;
      expv[41] = 11'h724;
      expv[42] = 11'h70e;
      expv[43] = 11'h702;
      expv[44] = 11'h702;
      expv[45] = 11'h719;
      expv[46] = 11'h718;
      expv[47] = 11'h702;
      expv[48] = 11'h718;
      expv[49] = 11'h702;
      expv[50] = 11'h702;
      expv[51] = 11'h746;
      expv[52] = 11'h712;
      expv[53] = 11'h706;
      expv[54] = 11'h700;
      expv[55] = 11'h702;
      expv[56] = 11'h712;
      expv[57] = 11'h70e;
      expv[58] = 11'h721;
      expv[59] = 11'h746;
      expv[60] = 11'h706;
      expv[61] = 11'h778;
      expv[62] = 11'h721;
      expv[63] = 11'h778;
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
