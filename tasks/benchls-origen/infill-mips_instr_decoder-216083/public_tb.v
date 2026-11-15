// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_216083 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .addu(out_vec[11:11]),
    .subu(out_vec[10:10]),
    .ori(out_vec[9:9]),
    .lui(out_vec[8:8]),
    .lw(out_vec[7:7]),
    .sw(out_vec[6:6]),
    .beq(out_vec[5:5]),
    .j(out_vec[4:4]),
    .jal(out_vec[3:3]),
    .jr(out_vec[2:2]),
    .blezals(out_vec[1:1]),
    .rev(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9f8;
    stim[1] = 12'h2a6;
    stim[2] = 12'h2a5;
    stim[3] = 12'h1ef;
    stim[4] = 12'h517;
    stim[5] = 12'hb0e;
    stim[6] = 12'h7cf;
    stim[7] = 12'h5b9;
    stim[8] = 12'h788;
    stim[9] = 12'h5de;
    stim[10] = 12'h232;
    stim[11] = 12'hd0b;
    stim[12] = 12'haa6;
    stim[13] = 12'hf8a;
    stim[14] = 12'h4e4;
    stim[15] = 12'hb5e;
    stim[16] = 12'hd20;
    stim[17] = 12'hdcc;
    stim[18] = 12'hfd6;
    stim[19] = 12'hcd4;
    stim[20] = 12'he21;
    stim[21] = 12'h694;
    stim[22] = 12'h67d;
    stim[23] = 12'h1e5;
    stim[24] = 12'habb;
    stim[25] = 12'h193;
    stim[26] = 12'hb0b;
    stim[27] = 12'h47e;
    stim[28] = 12'ha44;
    stim[29] = 12'haf2;
    stim[30] = 12'hb8b;
    stim[31] = 12'h225;
    stim[32] = 12'ha78;
    stim[33] = 12'h7e1;
    stim[34] = 12'h592;
    stim[35] = 12'h71f;
    stim[36] = 12'haec;
    stim[37] = 12'h85b;
    stim[38] = 12'h83c;
    stim[39] = 12'h53f;
    stim[40] = 12'h02e;
    stim[41] = 12'h83e;
    stim[42] = 12'he1a;
    stim[43] = 12'h41b;
    stim[44] = 12'h008;
    stim[45] = 12'hdbb;
    stim[46] = 12'hf2c;
    stim[47] = 12'hb3c;
    stim[48] = 12'h1ea;
    stim[49] = 12'ha6f;
    stim[50] = 12'h04e;
    stim[51] = 12'hed0;
    stim[52] = 12'hf37;
    stim[53] = 12'h36b;
    stim[54] = 12'h0cb;
    stim[55] = 12'hfec;
    stim[56] = 12'h5fb;
    stim[57] = 12'h7f6;
    stim[58] = 12'h337;
    stim[59] = 12'h30a;
    stim[60] = 12'hf38;
    stim[61] = 12'hb12;
    stim[62] = 12'hde8;
    stim[63] = 12'hbfd;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h000;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h040;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h040;
      expv[37] = 12'h000;
      expv[38] = 12'h000;
      expv[39] = 12'h000;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h004;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h200;
      expv[54] = 12'h008;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h000;
      expv[62] = 12'h000;
      expv[63] = 12'h000;
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
