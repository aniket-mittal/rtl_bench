// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_022756 dut (
    .clk_ref(clk),
    .sys_rstn(in_vec[3:3]),
    .ads_sdo0(in_vec[2:2]),
    .ads_sdo1(in_vec[1:1]),
    .ads_rvs(in_vec[0:0]),
    .ads_csn(out_vec[20:20]),
    .ads_rstn(out_vec[19:19]),
    .ads_sclk(out_vec[18:18]),
    .ads_sdi(out_vec[17:17]),
    .dvalid(out_vec[16:16]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h4;
    stim[1] = 4'h5;
    stim[2] = 4'he;
    stim[3] = 4'he;
    stim[4] = 4'hf;
    stim[5] = 4'hd;
    stim[6] = 4'he;
    stim[7] = 4'hc;
    stim[8] = 4'h8;
    stim[9] = 4'hf;
    stim[10] = 4'h2;
    stim[11] = 4'hc;
    stim[12] = 4'hf;
    stim[13] = 4'hf;
    stim[14] = 4'ha;
    stim[15] = 4'h9;
    stim[16] = 4'h8;
    stim[17] = 4'hd;
    stim[18] = 4'he;
    stim[19] = 4'h8;
    stim[20] = 4'ha;
    stim[21] = 4'h9;
    stim[22] = 4'h8;
    stim[23] = 4'hd;
    stim[24] = 4'h8;
    stim[25] = 4'hd;
    stim[26] = 4'hf;
    stim[27] = 4'ha;
    stim[28] = 4'h8;
    stim[29] = 4'hd;
    stim[30] = 4'ha;
    stim[31] = 4'hd;
    stim[32] = 4'hc;
    stim[33] = 4'hf;
    stim[34] = 4'he;
    stim[35] = 4'hb;
    stim[36] = 4'hc;
    stim[37] = 4'hd;
    stim[38] = 4'h9;
    stim[39] = 4'ha;
    stim[40] = 4'he;
    stim[41] = 4'hf;
    stim[42] = 4'h8;
    stim[43] = 4'ha;
    stim[44] = 4'hf;
    stim[45] = 4'he;
    stim[46] = 4'h9;
    stim[47] = 4'h9;
    stim[48] = 4'hc;
    stim[49] = 4'hc;
    stim[50] = 4'ha;
    stim[51] = 4'h9;
    stim[52] = 4'h9;
    stim[53] = 4'hd;
    stim[54] = 4'hc;
    stim[55] = 4'hc;
    stim[56] = 4'he;
    stim[57] = 4'hb;
    stim[58] = 4'hd;
    stim[59] = 4'hb;
    stim[60] = 4'hb;
    stim[61] = 4'ha;
    stim[62] = 4'hd;
    stim[63] = 4'hf;
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
      expv[0] = 21'h100000;
      expv[1] = 21'h100000;
      expv[2] = 21'h100000;
      expv[3] = 21'h180000;
      expv[4] = 21'h180000;
      expv[5] = 21'h180000;
      expv[6] = 21'h180000;
      expv[7] = 21'h180000;
      expv[8] = 21'h180000;
      expv[9] = 21'h180000;
      expv[10] = 21'h100000;
      expv[11] = 21'h100000;
      expv[12] = 21'h180000;
      expv[13] = 21'h180000;
      expv[14] = 21'h180000;
      expv[15] = 21'h180000;
      expv[16] = 21'h180000;
      expv[17] = 21'h180000;
      expv[18] = 21'h180000;
      expv[19] = 21'h180000;
      expv[20] = 21'h180000;
      expv[21] = 21'h180000;
      expv[22] = 21'h180000;
      expv[23] = 21'h180000;
      expv[24] = 21'h180000;
      expv[25] = 21'h180000;
      expv[26] = 21'h180000;
      expv[27] = 21'h180000;
      expv[28] = 21'h180000;
      expv[29] = 21'h180000;
      expv[30] = 21'h180000;
      expv[31] = 21'h180000;
      expv[32] = 21'h180000;
      expv[33] = 21'h180000;
      expv[34] = 21'h180000;
      expv[35] = 21'h180000;
      expv[36] = 21'h180000;
      expv[37] = 21'h180000;
      expv[38] = 21'h180000;
      expv[39] = 21'h180000;
      expv[40] = 21'h180000;
      expv[41] = 21'h180000;
      expv[42] = 21'h180000;
      expv[43] = 21'h180000;
      expv[44] = 21'h180000;
      expv[45] = 21'h180000;
      expv[46] = 21'h180000;
      expv[47] = 21'h180000;
      expv[48] = 21'h180000;
      expv[49] = 21'h180000;
      expv[50] = 21'h180000;
      expv[51] = 21'h180000;
      expv[52] = 21'h180000;
      expv[53] = 21'h180000;
      expv[54] = 21'h180000;
      expv[55] = 21'h180000;
      expv[56] = 21'h180000;
      expv[57] = 21'h180000;
      expv[58] = 21'h180000;
      expv[59] = 21'h180000;
      expv[60] = 21'h180000;
      expv[61] = 21'h180000;
      expv[62] = 21'h180000;
      expv[63] = 21'h180000;
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
