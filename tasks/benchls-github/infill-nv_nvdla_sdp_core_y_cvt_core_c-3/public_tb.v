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

  NV_NVDLA_SDP_CORE_Y_cvt_core_chn_out_rsci_chn_out_wait_ctrl dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[6:6]),
    .chn_out_rsci_oswt(in_vec[5:5]),
    .core_wen(in_vec[4:4]),
    .core_wten(in_vec[3:3]),
    .chn_out_rsci_iswt0(in_vec[2:2]),
    .chn_out_rsci_ld_core_psct(in_vec[1:1]),
    .chn_out_rsci_vd(in_vec[0:0]),
    .chn_out_rsci_biwt(out_vec[2:2]),
    .chn_out_rsci_bdwt(out_vec[1:1]),
    .chn_out_rsci_ld_core_sct(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h35;
    stim[1] = 7'h3d;
    stim[2] = 7'h54;
    stim[3] = 7'h69;
    stim[4] = 7'h51;
    stim[5] = 7'h6a;
    stim[6] = 7'h7b;
    stim[7] = 7'h58;
    stim[8] = 7'h4e;
    stim[9] = 7'h60;
    stim[10] = 7'h5c;
    stim[11] = 7'h77;
    stim[12] = 7'h59;
    stim[13] = 7'h59;
    stim[14] = 7'h4c;
    stim[15] = 7'h44;
    stim[16] = 7'h5a;
    stim[17] = 7'h5b;
    stim[18] = 7'h72;
    stim[19] = 7'h78;
    stim[20] = 7'h6c;
    stim[21] = 7'h7e;
    stim[22] = 7'h6d;
    stim[23] = 7'h40;
    stim[24] = 7'h5a;
    stim[25] = 7'h63;
    stim[26] = 7'h5e;
    stim[27] = 7'h44;
    stim[28] = 7'h69;
    stim[29] = 7'h52;
    stim[30] = 7'h66;
    stim[31] = 7'h47;
    stim[32] = 7'h6c;
    stim[33] = 7'h61;
    stim[34] = 7'h5d;
    stim[35] = 7'h6a;
    stim[36] = 7'h68;
    stim[37] = 7'h46;
    stim[38] = 7'h43;
    stim[39] = 7'h6b;
    stim[40] = 7'h7d;
    stim[41] = 7'h4b;
    stim[42] = 7'h67;
    stim[43] = 7'h56;
    stim[44] = 7'h70;
    stim[45] = 7'h70;
    stim[46] = 7'h4d;
    stim[47] = 7'h61;
    stim[48] = 7'h44;
    stim[49] = 7'h7f;
    stim[50] = 7'h7d;
    stim[51] = 7'h53;
    stim[52] = 7'h50;
    stim[53] = 7'h5c;
    stim[54] = 7'h6b;
    stim[55] = 7'h6a;
    stim[56] = 7'h77;
    stim[57] = 7'h5d;
    stim[58] = 7'h4d;
    stim[59] = 7'h5c;
    stim[60] = 7'h79;
    stim[61] = 7'h54;
    stim[62] = 7'h69;
    stim[63] = 7'h69;
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
      expv[0] = 3'h6;
      expv[1] = 3'h2;
      expv[2] = 3'h0;
      expv[3] = 3'h4;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h2;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h0;
      expv[11] = 3'h7;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h0;
      expv[15] = 3'h0;
      expv[16] = 3'h1;
      expv[17] = 3'h5;
      expv[18] = 3'h2;
      expv[19] = 3'h2;
      expv[20] = 3'h0;
      expv[21] = 3'h2;
      expv[22] = 3'h0;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h4;
      expv[29] = 3'h0;
      expv[30] = 3'h1;
      expv[31] = 3'h5;
      expv[32] = 3'h0;
      expv[33] = 3'h0;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h0;
      expv[37] = 3'h1;
      expv[38] = 3'h5;
      expv[39] = 3'h0;
      expv[40] = 3'h2;
      expv[41] = 3'h0;
      expv[42] = 3'h5;
      expv[43] = 3'h1;
      expv[44] = 3'h2;
      expv[45] = 3'h2;
      expv[46] = 3'h4;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h7;
      expv[50] = 3'h2;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h7;
      expv[57] = 3'h0;
      expv[58] = 3'h0;
      expv[59] = 3'h0;
      expv[60] = 3'h2;
      expv[61] = 3'h0;
      expv[62] = 3'h4;
      expv[63] = 3'h0;
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
