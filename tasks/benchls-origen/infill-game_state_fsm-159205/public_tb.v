// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_159205 dut (
    .CC_CLOCK_50(clk),
    .CC_POSX_IN(in_vec[11:9]),
    .CC_POSY_IN(in_vec[8:6]),
    .CC_ESTADO_IN(in_vec[5:3]),
    .CC_PERDIO_IN(in_vec[2:2]),
    .CC_GANO_IN(in_vec[1:1]),
    .CC_RESET(in_vec[0:0]),
    .CC_REG7_OUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hd4b;
    stim[1] = 12'h141;
    stim[2] = 12'hd2c;
    stim[3] = 12'h55e;
    stim[4] = 12'heb0;
    stim[5] = 12'hba4;
    stim[6] = 12'h1e6;
    stim[7] = 12'h6ec;
    stim[8] = 12'h032;
    stim[9] = 12'hd58;
    stim[10] = 12'h8c6;
    stim[11] = 12'heaa;
    stim[12] = 12'h35a;
    stim[13] = 12'h7e6;
    stim[14] = 12'he96;
    stim[15] = 12'hfda;
    stim[16] = 12'ha1e;
    stim[17] = 12'hf70;
    stim[18] = 12'hc56;
    stim[19] = 12'hb76;
    stim[20] = 12'h0a8;
    stim[21] = 12'h702;
    stim[22] = 12'h5be;
    stim[23] = 12'h1f6;
    stim[24] = 12'hdc4;
    stim[25] = 12'hef0;
    stim[26] = 12'h83a;
    stim[27] = 12'h126;
    stim[28] = 12'hfae;
    stim[29] = 12'h734;
    stim[30] = 12'h714;
    stim[31] = 12'hc98;
    stim[32] = 12'he8c;
    stim[33] = 12'h68a;
    stim[34] = 12'h77a;
    stim[35] = 12'he4e;
    stim[36] = 12'hdfc;
    stim[37] = 12'h794;
    stim[38] = 12'h03a;
    stim[39] = 12'h876;
    stim[40] = 12'h176;
    stim[41] = 12'h4ee;
    stim[42] = 12'hd16;
    stim[43] = 12'hf30;
    stim[44] = 12'hbea;
    stim[45] = 12'h4d4;
    stim[46] = 12'h0dc;
    stim[47] = 12'h1ee;
    stim[48] = 12'h3de;
    stim[49] = 12'h766;
    stim[50] = 12'ha60;
    stim[51] = 12'h0fe;
    stim[52] = 12'h9ab;
    stim[53] = 12'h942;
    stim[54] = 12'h29e;
    stim[55] = 12'hde8;
    stim[56] = 12'hbba;
    stim[57] = 12'hbf4;
    stim[58] = 12'hd84;
    stim[59] = 12'h1a4;
    stim[60] = 12'hcf6;
    stim[61] = 12'h68c;
    stim[62] = 12'h9f8;
    stim[63] = 12'hb8a;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'hbf;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'hbf;
      expv[51] = 8'hbf;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
