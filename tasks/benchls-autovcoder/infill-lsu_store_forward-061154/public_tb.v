// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061154 dut (
    .clock(clk),
    .reset(in_vec[11:11]),
    .io_addr_matches(in_vec[10:3]),
    .io_youngest_st_idx(in_vec[2:0]),
    .io_forwarding_val(out_vec[3:3]),
    .io_forwarding_idx(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h825;
    stim[1] = 12'hbec;
    stim[2] = 12'h11b;
    stim[3] = 12'h169;
    stim[4] = 12'h4ca;
    stim[5] = 12'h14a;
    stim[6] = 12'h524;
    stim[7] = 12'h4f8;
    stim[8] = 12'h15a;
    stim[9] = 12'h7e1;
    stim[10] = 12'h70b;
    stim[11] = 12'h2bd;
    stim[12] = 12'h21a;
    stim[13] = 12'h58f;
    stim[14] = 12'h418;
    stim[15] = 12'h4ba;
    stim[16] = 12'h03e;
    stim[17] = 12'h069;
    stim[18] = 12'h02a;
    stim[19] = 12'h1a1;
    stim[20] = 12'h04b;
    stim[21] = 12'h489;
    stim[22] = 12'h212;
    stim[23] = 12'h069;
    stim[24] = 12'h767;
    stim[25] = 12'h155;
    stim[26] = 12'h21b;
    stim[27] = 12'h31a;
    stim[28] = 12'h52e;
    stim[29] = 12'h946;
    stim[30] = 12'h12b;
    stim[31] = 12'h708;
    stim[32] = 12'h42d;
    stim[33] = 12'h55b;
    stim[34] = 12'h5d1;
    stim[35] = 12'h6c0;
    stim[36] = 12'h3f6;
    stim[37] = 12'h586;
    stim[38] = 12'h00c;
    stim[39] = 12'h1e2;
    stim[40] = 12'h02c;
    stim[41] = 12'h6d9;
    stim[42] = 12'h09c;
    stim[43] = 12'h1c3;
    stim[44] = 12'h1af;
    stim[45] = 12'h1be;
    stim[46] = 12'h441;
    stim[47] = 12'h5d9;
    stim[48] = 12'h16c;
    stim[49] = 12'h779;
    stim[50] = 12'h116;
    stim[51] = 12'h4f6;
    stim[52] = 12'h124;
    stim[53] = 12'h475;
    stim[54] = 12'h08f;
    stim[55] = 12'h541;
    stim[56] = 12'h60f;
    stim[57] = 12'h525;
    stim[58] = 12'h589;
    stim[59] = 12'h125;
    stim[60] = 12'h453;
    stim[61] = 12'h3ca;
    stim[62] = 12'h11a;
    stim[63] = 12'h587;
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
      expv[0] = 4'ha;
      expv[1] = 4'hb;
      expv[2] = 4'h9;
      expv[3] = 4'h8;
      expv[4] = 4'h8;
      expv[5] = 4'h8;
      expv[6] = 4'ha;
      expv[7] = 4'hf;
      expv[8] = 4'h9;
      expv[9] = 4'hf;
      expv[10] = 4'h8;
      expv[11] = 4'hc;
      expv[12] = 4'h9;
      expv[13] = 4'hd;
      expv[14] = 4'hf;
      expv[15] = 4'h9;
      expv[16] = 4'ha;
      expv[17] = 4'h8;
      expv[18] = 4'h8;
      expv[19] = 4'hd;
      expv[20] = 4'h8;
      expv[21] = 4'h8;
      expv[22] = 4'h9;
      expv[23] = 4'h8;
      expv[24] = 4'he;
      expv[25] = 4'hb;
      expv[26] = 4'h9;
      expv[27] = 4'h9;
      expv[28] = 4'hd;
      expv[29] = 4'hd;
      expv[30] = 4'ha;
      expv[31] = 4'hf;
      expv[32] = 4'ha;
      expv[33] = 4'h9;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hd;
      expv[37] = 4'hd;
      expv[38] = 4'h8;
      expv[39] = 4'hd;
      expv[40] = 4'ha;
      expv[41] = 4'h8;
      expv[42] = 4'h9;
      expv[43] = 4'hd;
      expv[44] = 4'hd;
      expv[45] = 4'hd;
      expv[46] = 4'hf;
      expv[47] = 4'h8;
      expv[48] = 4'hb;
      expv[49] = 4'h8;
      expv[50] = 4'hd;
      expv[51] = 4'hc;
      expv[52] = 4'ha;
      expv[53] = 4'hb;
      expv[54] = 4'hc;
      expv[55] = 4'hf;
      expv[56] = 4'he;
      expv[57] = 4'ha;
      expv[58] = 4'h8;
      expv[59] = 4'ha;
      expv[60] = 4'h9;
      expv[61] = 4'h8;
      expv[62] = 4'h9;
      expv[63] = 4'hd;
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
