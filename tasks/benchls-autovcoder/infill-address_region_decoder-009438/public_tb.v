// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009438 dut (
    .addr(in_vec[31:0]),
    .sel_ram(out_vec[6:6]),
    .sel_IO(out_vec[5:5]),
    .sel_read_shared(out_vec[4:4]),
    .sel_write_shared(out_vec[3:3]),
    .read_select(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'haf0e3296;
    stim[1] = 32'ha71ce330;
    stim[2] = 32'h9570932b;
    stim[3] = 32'hc28c12d9;
    stim[4] = 32'h6cecbfff;
    stim[5] = 32'h9ca2844c;
    stim[6] = 32'h6aa30e77;
    stim[7] = 32'h84ce042c;
    stim[8] = 32'h3d17adb5;
    stim[9] = 32'h70613d2c;
    stim[10] = 32'h532a8edb;
    stim[11] = 32'h4efb0319;
    stim[12] = 32'h44a26027;
    stim[13] = 32'hfdcf1d44;
    stim[14] = 32'h38d86707;
    stim[15] = 32'h05bb3a32;
    stim[16] = 32'hef7a6d10;
    stim[17] = 32'h48f0c939;
    stim[18] = 32'h388d0e92;
    stim[19] = 32'h1af65757;
    stim[20] = 32'h96229f77;
    stim[21] = 32'hf9f2c135;
    stim[22] = 32'hf935c24a;
    stim[23] = 32'h97e24d37;
    stim[24] = 32'h874ba5ff;
    stim[25] = 32'h3786ba2f;
    stim[26] = 32'h9ee747de;
    stim[27] = 32'h9cb321ea;
    stim[28] = 32'h44f627fc;
    stim[29] = 32'h3f34d11e;
    stim[30] = 32'h7f2f64dd;
    stim[31] = 32'h93db9157;
    stim[32] = 32'h256aa705;
    stim[33] = 32'h43883ef4;
    stim[34] = 32'h7f3f4a9a;
    stim[35] = 32'h92abcd9e;
    stim[36] = 32'hb641665d;
    stim[37] = 32'h8f7d9520;
    stim[38] = 32'h8653075f;
    stim[39] = 32'h2f8e139e;
    stim[40] = 32'heba0de65;
    stim[41] = 32'ha15be8f5;
    stim[42] = 32'h565dd167;
    stim[43] = 32'haafc5870;
    stim[44] = 32'h771072b3;
    stim[45] = 32'h397c98fe;
    stim[46] = 32'h9bfa85e3;
    stim[47] = 32'hd72093b3;
    stim[48] = 32'h738e7b73;
    stim[49] = 32'hfc2b6494;
    stim[50] = 32'ha35ed9d5;
    stim[51] = 32'h88f23810;
    stim[52] = 32'h85da52ad;
    stim[53] = 32'hc1cb1a91;
    stim[54] = 32'hcc570599;
    stim[55] = 32'hfd7d8cd8;
    stim[56] = 32'h352ca554;
    stim[57] = 32'hd7ece21e;
    stim[58] = 32'hc548fce2;
    stim[59] = 32'h697eae88;
    stim[60] = 32'h23fa04eb;
    stim[61] = 32'hf9ba0459;
    stim[62] = 32'h4338e706;
    stim[63] = 32'h8aa62cd8;
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
      expv[0] = 7'h40;
      expv[1] = 7'h40;
      expv[2] = 7'h40;
      expv[3] = 7'h40;
      expv[4] = 7'h40;
      expv[5] = 7'h40;
      expv[6] = 7'h40;
      expv[7] = 7'h40;
      expv[8] = 7'h40;
      expv[9] = 7'h40;
      expv[10] = 7'h40;
      expv[11] = 7'h40;
      expv[12] = 7'h40;
      expv[13] = 7'h40;
      expv[14] = 7'h40;
      expv[15] = 7'h40;
      expv[16] = 7'h40;
      expv[17] = 7'h40;
      expv[18] = 7'h40;
      expv[19] = 7'h40;
      expv[20] = 7'h40;
      expv[21] = 7'h40;
      expv[22] = 7'h40;
      expv[23] = 7'h40;
      expv[24] = 7'h40;
      expv[25] = 7'h40;
      expv[26] = 7'h40;
      expv[27] = 7'h40;
      expv[28] = 7'h40;
      expv[29] = 7'h40;
      expv[30] = 7'h40;
      expv[31] = 7'h40;
      expv[32] = 7'h40;
      expv[33] = 7'h40;
      expv[34] = 7'h40;
      expv[35] = 7'h40;
      expv[36] = 7'h40;
      expv[37] = 7'h40;
      expv[38] = 7'h40;
      expv[39] = 7'h40;
      expv[40] = 7'h40;
      expv[41] = 7'h40;
      expv[42] = 7'h40;
      expv[43] = 7'h40;
      expv[44] = 7'h40;
      expv[45] = 7'h40;
      expv[46] = 7'h40;
      expv[47] = 7'h40;
      expv[48] = 7'h40;
      expv[49] = 7'h40;
      expv[50] = 7'h40;
      expv[51] = 7'h40;
      expv[52] = 7'h40;
      expv[53] = 7'h40;
      expv[54] = 7'h40;
      expv[55] = 7'h40;
      expv[56] = 7'h40;
      expv[57] = 7'h40;
      expv[58] = 7'h40;
      expv[59] = 7'h40;
      expv[60] = 7'h40;
      expv[61] = 7'h40;
      expv[62] = 7'h40;
      expv[63] = 7'h40;
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
