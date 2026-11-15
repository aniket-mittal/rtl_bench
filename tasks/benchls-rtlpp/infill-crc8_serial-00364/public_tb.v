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

  rtlpp_00364 dut (
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
    stim[0] = 12'he8d;
    stim[1] = 12'he75;
    stim[2] = 12'h38a;
    stim[3] = 12'hbe8;
    stim[4] = 12'h37e;
    stim[5] = 12'hf0e;
    stim[6] = 12'h6d0;
    stim[7] = 12'h61c;
    stim[8] = 12'ha92;
    stim[9] = 12'h71a;
    stim[10] = 12'h950;
    stim[11] = 12'hf2c;
    stim[12] = 12'h4ac;
    stim[13] = 12'hb4e;
    stim[14] = 12'hb9a;
    stim[15] = 12'h2a6;
    stim[16] = 12'h648;
    stim[17] = 12'h00e;
    stim[18] = 12'hcba;
    stim[19] = 12'h01c;
    stim[20] = 12'h862;
    stim[21] = 12'hcf0;
    stim[22] = 12'h060;
    stim[23] = 12'h232;
    stim[24] = 12'h53a;
    stim[25] = 12'h63e;
    stim[26] = 12'hb24;
    stim[27] = 12'h172;
    stim[28] = 12'h6d6;
    stim[29] = 12'hd60;
    stim[30] = 12'h9b4;
    stim[31] = 12'h7a2;
    stim[32] = 12'h28f;
    stim[33] = 12'h878;
    stim[34] = 12'h2be;
    stim[35] = 12'h2de;
    stim[36] = 12'h266;
    stim[37] = 12'ha7a;
    stim[38] = 12'ha14;
    stim[39] = 12'h24e;
    stim[40] = 12'h40e;
    stim[41] = 12'h6cc;
    stim[42] = 12'hae7;
    stim[43] = 12'h0fe;
    stim[44] = 12'hce8;
    stim[45] = 12'h9ec;
    stim[46] = 12'haf0;
    stim[47] = 12'hc3e;
    stim[48] = 12'h1b8;
    stim[49] = 12'hc74;
    stim[50] = 12'h502;
    stim[51] = 12'he56;
    stim[52] = 12'h766;
    stim[53] = 12'h2de;
    stim[54] = 12'h7ae;
    stim[55] = 12'hd06;
    stim[56] = 12'h856;
    stim[57] = 12'hee8;
    stim[58] = 12'h382;
    stim[59] = 12'h7d2;
    stim[60] = 12'h62e;
    stim[61] = 12'h456;
    stim[62] = 12'h776;
    stim[63] = 12'hdb6;
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
      expv[3] = 40'h3715ffa013;
      expv[4] = 40'h3715ffa013;
      expv[5] = 40'hffffffffff;
      expv[6] = 40'hffffffffff;
      expv[7] = 40'hffffffffff;
      expv[8] = 40'hffffffffff;
      expv[9] = 40'hffffffff00;
      expv[10] = 40'h1b8aff5027;
      expv[11] = 40'h1b8aff5027;
      expv[12] = 40'hffffffffff;
      expv[13] = 40'hffffffffff;
      expv[14] = 40'hffffffffff;
      expv[15] = 40'h5ad802f9a5;
      expv[16] = 40'hffffffffff;
      expv[17] = 40'hffffffffff;
      expv[18] = 40'hffffffffff;
      expv[19] = 40'h52d0d284b5;
      expv[20] = 40'hffffffffff;
      expv[21] = 40'hffffffff00;
      expv[22] = 40'hffffffff00;
      expv[23] = 40'hffffffff00;
      expv[24] = 40'hffffffff00;
      expv[25] = 40'h3c08f9fbc3;
      expv[26] = 40'hffffffffff;
      expv[27] = 40'hffffffffff;
      expv[28] = 40'hffffffff00;
      expv[29] = 40'hffffffffff;
      expv[30] = 40'hffffffffff;
      expv[31] = 40'hffffffffff;
      expv[32] = 40'hffffffffff;
      expv[33] = 40'hffffffffff;
      expv[34] = 40'hffffffffff;
      expv[35] = 40'hffffffffff;
      expv[36] = 40'hffffffffff;
      expv[37] = 40'hffffffffff;
      expv[38] = 40'h9c64f2a6c6;
      expv[39] = 40'hffffffffff;
      expv[40] = 40'hffffffffff;
      expv[41] = 40'hffffffffff;
      expv[42] = 40'hffffffffff;
      expv[43] = 40'hffffffffff;
      expv[44] = 40'hffffffffff;
      expv[45] = 40'hffffffffff;
      expv[46] = 40'hffffffffff;
      expv[47] = 40'hffffffffff;
      expv[48] = 40'hffffffffff;
      expv[49] = 40'hffffffffff;
      expv[50] = 40'hffffffffff;
      expv[51] = 40'hffffffff00;
      expv[52] = 40'hffffffffff;
      expv[53] = 40'hffffffffff;
      expv[54] = 40'hffffffffff;
      expv[55] = 40'hffffffffff;
      expv[56] = 40'hffffffffff;
      expv[57] = 40'hffffffffff;
      expv[58] = 40'hffffffffff;
      expv[59] = 40'hffffffff00;
      expv[60] = 40'hffffffff00;
      expv[61] = 40'hffffffffff;
      expv[62] = 40'hffffffffff;
      expv[63] = 40'hffffffffff;
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
