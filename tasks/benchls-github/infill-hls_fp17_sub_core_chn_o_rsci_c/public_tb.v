// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  HLS_fp17_sub_core_chn_o_rsci_chn_o_wait_ctrl dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[6:6]),
    .chn_o_rsci_oswt(in_vec[5:5]),
    .core_wen(in_vec[4:4]),
    .core_wten(in_vec[3:3]),
    .chn_o_rsci_iswt0(in_vec[2:2]),
    .chn_o_rsci_ld_core_psct(in_vec[1:1]),
    .chn_o_rsci_vd(in_vec[0:0]),
    .chn_o_rsci_biwt(out_vec[2:2]),
    .chn_o_rsci_bdwt(out_vec[1:1]),
    .chn_o_rsci_ld_core_sct(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h2b;
    stim[1] = 7'h14;
    stim[2] = 7'h4c;
    stim[3] = 7'h6e;
    stim[4] = 7'h59;
    stim[5] = 7'h4a;
    stim[6] = 7'h60;
    stim[7] = 7'h57;
    stim[8] = 7'h51;
    stim[9] = 7'h5c;
    stim[10] = 7'h4a;
    stim[11] = 7'h4d;
    stim[12] = 7'h5e;
    stim[13] = 7'h7b;
    stim[14] = 7'h71;
    stim[15] = 7'h40;
    stim[16] = 7'h5c;
    stim[17] = 7'h48;
    stim[18] = 7'h76;
    stim[19] = 7'h49;
    stim[20] = 7'h4b;
    stim[21] = 7'h6a;
    stim[22] = 7'h5d;
    stim[23] = 7'h6e;
    stim[24] = 7'h50;
    stim[25] = 7'h44;
    stim[26] = 7'h53;
    stim[27] = 7'h6a;
    stim[28] = 7'h55;
    stim[29] = 7'h54;
    stim[30] = 7'h5d;
    stim[31] = 7'h4e;
    stim[32] = 7'h53;
    stim[33] = 7'h48;
    stim[34] = 7'h5a;
    stim[35] = 7'h5e;
    stim[36] = 7'h72;
    stim[37] = 7'h4e;
    stim[38] = 7'h7b;
    stim[39] = 7'h5e;
    stim[40] = 7'h75;
    stim[41] = 7'h5e;
    stim[42] = 7'h6a;
    stim[43] = 7'h5a;
    stim[44] = 7'h55;
    stim[45] = 7'h5b;
    stim[46] = 7'h51;
    stim[47] = 7'h59;
    stim[48] = 7'h7b;
    stim[49] = 7'h6a;
    stim[50] = 7'h49;
    stim[51] = 7'h45;
    stim[52] = 7'h53;
    stim[53] = 7'h72;
    stim[54] = 7'h44;
    stim[55] = 7'h64;
    stim[56] = 7'h5f;
    stim[57] = 7'h52;
    stim[58] = 7'h4f;
    stim[59] = 7'h43;
    stim[60] = 7'h5d;
    stim[61] = 7'h42;
    stim[62] = 7'h76;
    stim[63] = 7'h7e;
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
      expv[0] = 3'h0;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h0;
      expv[7] = 3'h5;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h2;
      expv[14] = 3'h2;
      expv[15] = 3'h0;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h3;
      expv[19] = 3'h4;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h5;
      expv[27] = 3'h0;
      expv[28] = 3'h4;
      expv[29] = 3'h0;
      expv[30] = 3'h4;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h2;
      expv[37] = 3'h0;
      expv[38] = 3'h2;
      expv[39] = 3'h0;
      expv[40] = 3'h6;
      expv[41] = 3'h0;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h4;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h2;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h4;
      expv[52] = 3'h0;
      expv[53] = 3'h2;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h5;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h0;
      expv[62] = 3'h3;
      expv[63] = 3'h3;
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
